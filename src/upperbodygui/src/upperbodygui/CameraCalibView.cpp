#include "ros/ros.h"
#include <ros/package.h>
#include "upperbodygui/CameraCalibView.h"
#include <pluginlib/class_list_macros.h>
#include <QStringList>
#include <sensor_msgs/image_encodings.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>

#include <upperbodycore_msgs/arm.h>
#include <upperbodycore_msgs/omnidata.h>
#include <upperbodycore_msgs/head.h>
#include <upperbodycore_msgs/irsensor.h>
#include <upperbodycore_msgs/motortorques.h>
#include <upperbodycore_msgs/upperbodymotors.h>
#include <upperbodycore_msgs/motortorque.h>
#include <upperbodycore_msgs/face_headtrackerSrv.h>

#include <upperbodycore_msgs/waveSrv.h>
#include <upperbodycore_msgs/wave_hand.h>

#include <std_msgs/Int32.h>
#include <QTimer>
#include <QDebug>
#include <QFile>
#include <QFileDialog>
#include <QMessageBox>

#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
#include <upperbodycore_msgs/slamactionAction.h>

#include <QProcess>
#include <QThread>
#include <geometry_msgs/PoseWithCovarianceStamped.h>

#include "std_msgs/String.h"

#include <boost/thread.hpp>
#include <boost/algorithm/string.hpp>
#include <boost/lexical_cast.hpp>

#include "upperbodycore_msgs/stop.h" //facestop and manualauto service


#include "upperbodycore_msgs/command.h" //command service
#include "upperbodycore_msgs/maptools.h" //command service

#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>

#include <upperbodycore_msgs/upperbodymotors.h>
#include <upperbodycore_msgs/upperbodymotorsfeedback.h>
#include <upperbodycore_msgs/motorfeedback.h>
#include <upperbodycore_msgs/motorreset.h>
#include <upperbodycore_msgs/jointPO.h>

#include <upperbodycore_msgs/recordSrv.h>
#include <upperbodycore_msgs/sound.h>

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/ros/conversions.h>

namespace pgitic_gui
{

ros::Publisher chatter_pub_motor_right;
ros::Publisher chatter_pub_motor_left;
ros::Publisher chatter_pub_motor_head;
ros::ServiceClient service_torquemotor;

ros::ServiceClient service_record;
ros::ServiceClient service_playback;
ros::ServiceClient service_sound;
ros::ServiceClient service_face;
ros::ServiceClient service_facetrack;
ros::ServiceClient service_headtracker;
ros::ServiceClient service_wave;

QTimer *mtimer;

struct motor_data
{
public :
    std::string name;
    std::string status;
    int speed;
    int position;
    float load;
    int voltage;
    int temp;
    int id;
    int max;
    int min;
    int init;
};

struct face_data
{
public :

    int id;
    float x;
    float y;
    float z;
};

CameraCalibView::CameraCalibView()
    : rqt_gui_cpp::Plugin()
    , widget(0)
{
    setObjectName("CameraCalibView");
}

bool motor_init = false;
std::vector<motor_data> motor_list;
std::vector<face_data> face_list;
std::vector<geometry_msgs::Vector3> joint_positions;
std::vector<geometry_msgs::Quaternion> joint_orientations;

int motor_count = 8;
int selected_motor = -1;
int selected_joint = -1;
int selected_face = -1;
int can_motor_update_counter = 0;
bool can_motor_update = false;
bool first_update = false;
bool joint_init = false;
std::string salam="sal";
std::string record_path = "";
std::string playBack_path = "";
std::string playBack_sound_path = "";
std::string qright_hand;
std::string qleft_hand;
std::string qright_leg;
std::string qleft_leg;
std::string wave_right_hand_str;
std::string wave_left_hand_str;
void CameraCalibView::callback_gestures(const upperbodycore_msgs::GestureDetect::ConstPtr &msg)
{
    qright_hand = msg->right_hand;
    qright_leg = msg->right_foot;
    qleft_hand = msg->left_hand;
    qleft_leg = msg->left_foot;
}

void CameraCalibView::callback_wave(const upperbodycore_msgs::wave_hand::ConstPtr &msg)
{

    wave_right_hand_str = msg->right;
    wave_left_hand_str = msg->left;
}
std::string joint_names[] =
{
    "head",
    "neck",
    "torso",
    "left_shoulder",
    "left_elbow",
    "left_hand",
    "right_shoulder",
    "right_elbow",
    "right_hand",
    "left_hip",
    "left_knee",
    "left_foot",
    "right_hip",
    "right_knee",
    "right_foot"
};

void CameraCalibView::callback_joints(const upperbodycore_msgs::jointPO::ConstPtr &msg)
{
    for(int i = 0 ; i < msg->position.size() ; i++ )
    {
        if ( joint_init == false )
        {
            ui.lst_joints->addItem( joint_names[i].c_str());
            joint_positions.push_back(msg->position.at(i));
            joint_orientations.push_back(msg->orientation.at(i));
        }
        else
        {
            joint_positions.at(i).x = msg->position.at(i).x;
            joint_positions.at(i).y = msg->position.at(i).y;
            joint_positions.at(i).z = msg->position.at(i).z;

            joint_orientations.at(i).x = msg->orientation.at(i).x;
            joint_orientations.at(i).y = msg->orientation.at(i).y;
            joint_orientations.at(i).z = msg->orientation.at(i).z;
            joint_orientations.at(i).w = msg->orientation.at(i).w;
        }
    }

    joint_init = true;
}

void CameraCalibView::joint_select()
{
    int index = ui.lst_joints->currentRow();
    selected_joint = index;
}

void CameraCalibView::face_select()
{
    int index = ui.lst_allfaces->currentRow();
    selected_face = index;
}

float nearest_x = -1;
float nearest_y= -1;
float nearest_z= -1;
int nearest_id= -1;

void CameraCalibView::callback_nearestface(const upperbodycore_msgs::nearestfacepos::ConstPtr &msg)
{
    nearest_x = msg->x;
    nearest_y = msg->y;
    nearest_z = msg->z;
    nearest_id = msg->id;
}

int old_face_counts = 0;

void CameraCalibView::callback_allfaces(const upperbodycore_msgs::faceposition::ConstPtr &msg)
{

    if ( old_face_counts != msg->faces_position.size() )
    {
        old_face_counts = msg->faces_position.size();
        ui.lst_allfaces->clear();

        for ( int i = 0 ; i < msg->faces_position.size() ; i++ )
        {
            ui.lst_allfaces->addItem("face : " + QString::number(i));
        }

        face_list.clear();

        for ( int i = 0 ; i < msg->faces_position.size() ; i++)
        {
           face_data fdata;
           fdata.x = msg->faces_position.at(i).x;
           fdata.y = msg->faces_position.at(i).y;
           fdata.z = msg->faces_position.at(i).z;
           fdata.id = 0;
           face_list.push_back(fdata);
        }

    }

    if (  msg->faces_position.size() != 0)
    {
        for ( int i = 0 ; i < msg->faces_position.size() ; i++)
        {
        face_list.at(i).x = msg->faces_position.at(i).x;
        face_list.at(i).y = msg->faces_position.at(i).y;
        face_list.at(i).z = msg->faces_position.at(i).z;

        }
    }
}



void CameraCalibView::callback_motors(const upperbodycore_msgs::upperbodymotorsfeedback::ConstPtr &msg)
{

    if ( motor_init == false)
    {
        for ( int i = 0 ; i < msg->motorfeedbacks.size() ; i++ )
        {
            motor_data motor;
            motor.speed = -1;
            motor.position = -1;
            motor.load = -1;
            motor.voltage = -1;
            motor.id = -1;
            motor.temp = -1;
            motor.name = "none";
            motor.status = "none";
            motor.max = -1;
            motor.min = -1;
            motor.init = -1;
            motor_list.push_back(motor);
        }

        ui.lst_motors->clear();
        ui.lbl_motorcount->setText(QString::number(msg->motorfeedbacks.size()));
    }

    for ( int i = 0 ; i < msg->motorfeedbacks.size() ; i++ )
    {
        motor_list.at(i).speed = msg->motorfeedbacks[i].speed;
        motor_list.at(i).position = msg->motorfeedbacks[i].position;
        motor_list.at(i).load = msg->motorfeedbacks[i].load;
        motor_list.at(i).voltage = msg->motorfeedbacks[i].voltage;
        motor_list.at(i).id = msg->motorfeedbacks[i].id;
        motor_list.at(i).temp = msg->motorfeedbacks[i].temp;
        motor_list.at(i).name = msg->motorfeedbacks[i].name;
        motor_list.at(i).status = msg->motorfeedbacks[i].status;
        motor_list.at(i).min = msg->motorfeedbacks[i].min;
        motor_list.at(i).max = msg->motorfeedbacks[i].max;
        motor_list.at(i).init = msg->motorfeedbacks[i].init;


        QString ID = QString::number( motor_list.at(i).id);
        QString it = "MotorID :" + ID;

        if ( motor_init == false)
            ui.lst_motors->addItem(it);


    }

    motor_init = true;
}

void CameraCalibView::callbackRawImage_face(const sensor_msgs::Image::ConstPtr& msg)
{
    m_mutex.lock();
    try
    {
        cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::RGB8);
        imageRaw_face = cv_ptr->image;
    }
    catch (cv_bridge::Exception& e)
    {
        try
        {
            cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg);
            if (msg->encoding == "CV_8UC3") {
                imageRaw_face = cv_ptr->image;
            } else {
                qWarning("ImageView.callback_image() could not convert image from '%s' to 'rgb8' (%s)", msg->encoding.c_str(), e.what());
                ui.img_face->setImage(QImage());
                m_mutex.unlock();
                return;
            }
        } catch (cv_bridge::Exception& e)
        {
            qWarning("ImageView.callback_image() while trying to convert image from '%s' to 'rgb8' an exception was thrown (%s)", msg->encoding.c_str(), e.what());
            ui.img_face->setImage(QImage());
            m_mutex.unlock();
            return;
        }
    }



    ui.img_face->setImage(QImage());
    QImage qImage(imageRaw_face.data,imageRaw_face.cols,imageRaw_face.rows, imageRaw_face.step[0], QImage::Format_RGB888);
    ui.img_face->setImage(qImage);
    m_mutex.unlock();
}
void CameraCalibView::callbackRawImage_skeleton(const sensor_msgs::Image::ConstPtr& msg)
{
    m_mutex.lock();
    try
    {
        cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::RGB8);
        imageRaw_skeleton = cv_ptr->image;
    }
    catch (cv_bridge::Exception& e)
    {
        try
        {
            cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg);
            if (msg->encoding == "CV_8UC3") {
                imageRaw_skeleton = cv_ptr->image;
            } else {
                qWarning("ImageView.callback_image() could not convert image from '%s' to 'rgb8' (%s)", msg->encoding.c_str(), e.what());
                ui.img_skeleton->setImage(QImage());
                m_mutex.unlock();
                return;
            }
        } catch (cv_bridge::Exception& e)
        {
            qWarning("ImageView.callback_image() while trying to convert image from '%s' to 'rgb8' an exception was thrown (%s)", msg->encoding.c_str(), e.what());
            ui.img_skeleton->setImage(QImage());
            m_mutex.unlock();
            return;
        }
    }



    ui.img_skeleton->setImage(QImage());
    QImage qImage(imageRaw_skeleton.data,imageRaw_skeleton.cols,imageRaw_skeleton.rows, imageRaw_skeleton.step[0], QImage::Format_RGB888);
    ui.img_skeleton->setImage(qImage);
    m_mutex.unlock();
}



cv::Mat depth_image;
void CameraCalibView::chatterCallback_depth(const sensor_msgs::PointCloud2::ConstPtr &msg) {

    m_mutex.lock();

    int w = msg->width;
    int h = msg->height;

    int row_step = msg->row_step;

    pcl::PointCloud<pcl::PointXYZ> cloud;
    pcl::fromROSMsg(*msg, cloud);

    //===============================================================================

    //imageRaw_kinectdepth = imageRaw_kinectrgb;

    for (int i = 0; i < 480 ; i++) {
        for (int j = 0 ; j < 640 ; j++) {

            int a = (int)(cloud.points[i * imageRaw_kinectdepth.cols + j].z * 100); //cm

            if ( std::isnan(a) || a < 0) {
                a = 0;
            }


            imageRaw_kinectdepth.at<cv::Vec3b>(i,j)[0] = 0;
            imageRaw_kinectdepth.at<cv::Vec3b>(i,j)[1] = (float)a / 400 * 256;
            imageRaw_kinectdepth.at<cv::Vec3b>(i,j)[2] = 0;

        }
    }

    ui.img_kinectdepth->setImage(QImage());
    QImage qImage(imageRaw_kinectdepth.data,imageRaw_kinectrgb.cols,imageRaw_kinectrgb.rows, imageRaw_kinectrgb.step[0], QImage::Format_RGB888);
    ui.img_kinectdepth->setImage(qImage);
    m_mutex.unlock();


}

void CameraCalibView::callbackRawImage_kinectrgb(const sensor_msgs::Image::ConstPtr& msg)
{

    m_mutex.lock();
    try
    {
        cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::RGB8);
        imageRaw_kinectrgb = cv_ptr->image;
    }
    catch (cv_bridge::Exception& e)
    {
        try
        {
            cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg);
            if (msg->encoding == "CV_8UC3") {
                imageRaw_kinectrgb = cv_ptr->image;
            } else {
                qWarning("ImageView.callback_image() could not convert image from '%s' to 'rgb8' (%s)", msg->encoding.c_str(), e.what());
                ui.img_kinectrgb->setImage(QImage());
                m_mutex.unlock();
                return;
            }
        } catch (cv_bridge::Exception& e)
        {
            qWarning("ImageView.callback_image() while trying to convert image from '%s' to 'rgb8' an exception was thrown (%s)", msg->encoding.c_str(), e.what());
            ui.img_kinectrgb->setImage(QImage());
            m_mutex.unlock();
            return;
        }
    }



    ui.img_kinectrgb->setImage(QImage());
    QImage qImage(imageRaw_kinectrgb.data,imageRaw_kinectrgb.cols,imageRaw_kinectrgb.rows, imageRaw_kinectrgb.step[0], QImage::Format_RGB888);
    ui.img_kinectrgb->setImage(qImage);
    m_mutex.unlock();
}

void CameraCalibView::motor_update_spinner_right()
{
    ui.slider_right_shoulder_yaw->setValue(ui.spin_r_shoulder_yaw->value());
    ui.slider_right_shoulder_pitch->setValue(ui.spin_r_shoulder_pitch->value());
    ui.slider_right_shoulder_roll->setValue(ui.spin_r_shoulder_roll->value());
    ui.slider_right_elbow_pitch->setValue(ui.spin_r_elbow_pitch->value());
    ui.slider_right_elbow_roll->setValue(ui.spin_r_elbow_roll->value());
    ui.slider_right_wrist_pitch->setValue(ui.spin_r_wrist_pitch->value());
    ui.slider_right_wrist_roll->setValue(ui.spin_r_wrist_roll->value());
    ui.slider_right_gripper->setValue(ui.spin_r_gripper->value());
}

void CameraCalibView::motor_update_spinner_left()
{
    ui.slider_left_shoulder_yaw->setValue(ui.spin_l_shoulder_yaw->value());
    ui.slider_left_shoulder_pitch->setValue(ui.spin_l_shoulder_pitch->value());
    ui.slider_left_shoulder_roll->setValue(ui.spin_l_shoulder_roll->value());
    ui.slider_left_elbow_pitch->setValue(ui.spin_l_elbow_pitch->value());
    ui.slider_left_elbow_roll->setValue(ui.spin_l_elbow_roll->value());
    ui.slider_left_wrist_pitch->setValue(ui.spin_l_wrist_pitch->value());
    ui.slider_left_wrist_roll->setValue(ui.spin_l_wrist_roll->value());
    ui.slider_left_gripper->setValue(ui.spin_l_gripper->value());
}

void CameraCalibView::motor_update_spinner_head()
{
    ui.slider_head_yaw->setValue(ui.spin_head_yaw->value());
    ui.slider_head_pitch->setValue(ui.spin_head_pitch->value());
}

void CameraCalibView::motor_update_right()
{
    if ( can_motor_update )
    {
        upperbodycore_msgs::upperbodymotors motor_msg;

        //=============================================================== SPINNER UPDATE
        ui.spin_r_shoulder_yaw->setValue(ui.slider_right_shoulder_yaw->value());
        ui.spin_r_shoulder_pitch->setValue(ui.slider_right_shoulder_pitch->value());
        ui.spin_r_shoulder_roll->setValue(ui.slider_right_shoulder_roll->value());
        ui.spin_r_elbow_pitch->setValue(ui.slider_right_elbow_pitch->value());
        ui.spin_r_elbow_roll->setValue(ui.slider_right_elbow_roll->value());
        ui.spin_r_wrist_pitch->setValue(ui.slider_right_wrist_pitch->value());
        ui.spin_r_wrist_roll->setValue(ui.slider_right_wrist_roll->value());
        ui.spin_r_gripper->setValue(ui.slider_right_gripper->value());
        //===============================================================

        motor_msg.shoulder_yawm_position = ui.slider_right_shoulder_yaw->value();
        motor_msg.shoulder_pitchm_position = ui.slider_right_shoulder_pitch->value();
        motor_msg.shoulder_roll_position = ui.slider_right_shoulder_roll->value();
        motor_msg.elbow_pitch_position = ui.slider_right_elbow_pitch->value();
        motor_msg.elbow_roll_position = ui.slider_right_elbow_roll->value();
        motor_msg.wrist_pitch_position = ui.slider_right_wrist_pitch->value();
        motor_msg.wrist_roll_position = ui.slider_right_wrist_roll->value();
        motor_msg.gripper_position = ui.slider_right_gripper->value();

        motor_msg.shoulder_yawm_speed = ui.spin_r_shoulder_yaw_speed->value();
        motor_msg.shoulder_pitchm_speed = ui.spin_r_shoulder_pitch_speed->value();
        motor_msg.shoulder_roll_speed = ui.spin_r_shoulder_roll_speed->value();
        motor_msg.elbow_pitch_speed = ui.spin_r_elbow_pitch_speed->value();
        motor_msg.elbow_roll_speed = ui.spin_r_elbow_roll_speed->value();
        motor_msg.wrist_pitch_speed = ui.spin_r_wrist_pitch_speed->value();
        motor_msg.wrist_roll_speed = ui.spin_r_wrist_roll_speed->value();
        motor_msg.gripper_speed = ui.spin_r_gripper_speed->value();

        chatter_pub_motor_right.publish(motor_msg);
    }
    else
    {
        can_motor_update_counter++;

        if ( can_motor_update_counter > 10 )
        {
            can_motor_update = true;
        }
    }
}

void CameraCalibView::motor_update_left()
{
    if ( can_motor_update )
    {
        upperbodycore_msgs::upperbodymotors motor_msg;

        //=============================================================== SPINNER UPDATE
        ui.spin_l_shoulder_yaw->setValue(ui.slider_left_shoulder_yaw->value());
        ui.spin_l_shoulder_pitch->setValue(ui.slider_left_shoulder_pitch->value());
        ui.spin_l_shoulder_roll->setValue(ui.slider_left_shoulder_roll->value());
        ui.spin_l_elbow_pitch->setValue(ui.slider_left_elbow_pitch->value());
        ui.spin_l_elbow_roll->setValue(ui.slider_left_elbow_roll->value());
        ui.spin_l_wrist_pitch->setValue(ui.slider_left_wrist_pitch->value());
        ui.spin_l_wrist_roll->setValue(ui.slider_left_wrist_roll->value());
        ui.spin_l_gripper->setValue(ui.slider_left_gripper->value());
        //===============================================================

        motor_msg.shoulder_yawm_position = ui.slider_left_shoulder_yaw->value();
        motor_msg.shoulder_pitchm_position = ui.slider_left_shoulder_pitch->value();
        motor_msg.shoulder_roll_position = ui.slider_left_shoulder_roll->value();
        motor_msg.elbow_pitch_position = ui.slider_left_elbow_pitch->value();
        motor_msg.elbow_roll_position = ui.slider_left_elbow_roll->value();
        motor_msg.wrist_pitch_position = ui.slider_left_wrist_pitch->value();
        motor_msg.wrist_roll_position = ui.slider_left_wrist_roll->value();
        motor_msg.gripper_position = ui.slider_left_gripper->value();

        motor_msg.shoulder_yawm_speed = ui.spin_l_shoulder_yaw_speed->value();
        motor_msg.shoulder_pitchm_speed = ui.spin_l_shoulder_pitch_speed->value();
        motor_msg.shoulder_roll_speed = ui.spin_l_shoulder_roll_speed->value();
        motor_msg.elbow_pitch_speed = ui.spin_l_elbow_pitch_speed->value();
        motor_msg.elbow_roll_speed = ui.spin_l_elbow_roll_speed->value();
        motor_msg.wrist_pitch_speed = ui.spin_l_wrist_pitch_speed->value();
        motor_msg.wrist_roll_speed = ui.spin_l_wrist_roll_speed->value();
        motor_msg.gripper_speed = ui.spin_l_gripper_speed->value();

        chatter_pub_motor_left.publish(motor_msg);
    }
    else
    {
        can_motor_update_counter++;

        if ( can_motor_update_counter > 10 )
        {
            can_motor_update = true;
        }
    }

}

void CameraCalibView::motor_update_head()
{
    if ( can_motor_update )
    {
        upperbodycore_msgs::upperbodymotors motor_msg;

        //=============================================================== SPINNER UPDATE
        ui.spin_head_yaw->setValue(ui.slider_head_yaw->value());
        ui.spin_head_pitch->setValue(ui.slider_head_pitch->value());
        //===============================================================

        motor_msg.head_yaw_position = ui.slider_head_yaw->value();
        motor_msg.head_pitch_position = ui.slider_head_pitch->value();

        motor_msg.head_yaw_speed = ui.spin_head_yaw_speed->value();
        motor_msg.head_pitch_speed = ui.spin_head_pitch_speed->value();

        chatter_pub_motor_head.publish(motor_msg);
    }
    else
    {
        can_motor_update_counter++;

        if ( can_motor_update_counter > 10 )
        {
            can_motor_update = true;
        }
    }

}

void CameraCalibView::update()
{

    ui.txt_nearestFace_x->setText(QString::number(nearest_x));
    ui.txt_nearestFace_y->setText(QString::number(nearest_y));
    ui.txt_nearestFace_z->setText(QString::number(nearest_z));
    ui.txt_nearestFace_id->setText(QString::number(nearest_id));

    if ( selected_joint != -1)
    {
        geometry_msgs::Vector3 myvec = joint_positions.at(selected_joint);
        geometry_msgs::Quaternion myvecq = joint_orientations.at(selected_joint);

        ui.txt_x->setText(QString::number(myvec.x));
        ui.txt_y->setText(QString::number(myvec.y));
        ui.txt_z->setText(QString::number(myvec.z));
    }

    if ( selected_face != -1)
    {
        ui.txt_nearestFace_x_2->setText(QString::number(face_list.at(selected_face).x));
        ui.txt_nearestFace_y_2->setText(QString::number(face_list.at(selected_face).y));
        ui.txt_nearestFace_z_2->setText(QString::number(face_list.at(selected_face).z));
        ui.txt_nearestFace_id_2->setText(QString::number(selected_face));
    }

    ui.txt_righthand->setText(qright_hand.c_str());
    ui.txt_lefthand->setText(qleft_hand.c_str());
    ui.txt_rightleg->setText(qright_leg.c_str());
    ui.txt_leftleg->setText(qleft_leg.c_str());
    ui.txt_wave_lefthand->setText(wave_left_hand_str.c_str());
    ui.txt_wave_righthand->setText(wave_right_hand_str.c_str());

    if ( motor_list.size() == 0 ) return;

    if ( selected_motor != -1)
    {
        motor_data gdata = motor_list.at(selected_motor);
        ui.txt_id->setText(QString::number(gdata.id));
        ui.txt_name->setText(gdata.name.c_str());
        ui.txt_speed->setText(QString::number(gdata.speed));
        ui.txt_voltage->setText(QString::number(gdata.voltage));
        ui.txt_temp->setText(QString::number(gdata.temp));
        ui.txt_load->setText(QString::number(gdata.load));
        ui.txt_position->setText(QString::number(gdata.position));
        ui.txt_status->setText(gdata.status.c_str());
    }



    if ( first_update == false )
    {
        motor_data item;
        QString info;

        item = motor_list.at(0);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_r_shoulder_yaw->setText(info);
            ui.slider_right_shoulder_yaw->setMinimum(item.min);
            ui.slider_right_shoulder_yaw->setMaximum(item.max);
            ui.slider_right_shoulder_yaw->setValue(item.init);
            ui.spin_r_shoulder_yaw->setMinimum(item.min);
            ui.spin_r_shoulder_yaw->setMaximum(item.max);
            ui.spin_r_shoulder_yaw->setValue(item.init);
        }
        else
        {
            ui.txt_info_r_shoulder_yaw->setText("not found");
            ui.slider_right_shoulder_yaw->setMinimum(-1);
            ui.slider_right_shoulder_yaw->setMaximum(-1);
            ui.slider_right_shoulder_yaw->setValue(-1);
            ui.spin_r_shoulder_yaw->setMinimum(-1);
            ui.spin_r_shoulder_yaw->setMaximum(-1);
            ui.spin_r_shoulder_yaw->setValue(-1);
        }


        item = motor_list.at(2);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_r_shoulder_pitch->setText(info);
            ui.slider_right_shoulder_pitch->setMinimum(item.min);
            ui.slider_right_shoulder_pitch->setMaximum(item.max);
            ui.slider_right_shoulder_pitch->setValue(item.init);
            ui.spin_r_shoulder_pitch->setMinimum(item.min);
            ui.spin_r_shoulder_pitch->setMaximum(item.max);
            ui.spin_r_shoulder_pitch->setValue(item.init);
        }
        else
        {
            ui.txt_info_r_shoulder_pitch->setText("not found");
            ui.slider_right_shoulder_pitch->setMinimum(-1);
            ui.slider_right_shoulder_pitch->setMaximum(-1);
            ui.slider_right_shoulder_pitch->setValue(-1);
            ui.spin_r_shoulder_pitch->setMinimum(-1);
            ui.spin_r_shoulder_pitch->setMaximum(-1);
            ui.spin_r_shoulder_pitch->setValue(-1);
        }

        item = motor_list.at(4);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_r_shoulder_roll->setText(info);
            ui.slider_right_shoulder_roll->setMinimum(item.min);
            ui.slider_right_shoulder_roll->setMaximum(item.max);
            ui.slider_right_shoulder_roll->setValue(item.init);
            ui.spin_r_shoulder_roll->setMinimum(item.min);
            ui.spin_r_shoulder_roll->setMaximum(item.max);
            ui.spin_r_shoulder_roll->setValue(item.init);
        }
        else
        {
            ui.txt_info_r_shoulder_roll->setText("not found");
            ui.slider_right_shoulder_roll->setMinimum(-1);
            ui.slider_right_shoulder_roll->setMaximum(-1);
            ui.slider_right_shoulder_roll->setValue(-1);
            ui.spin_r_shoulder_roll->setMinimum(-1);
            ui.spin_r_shoulder_roll->setMaximum(-1);
            ui.spin_r_shoulder_roll->setValue(-1);
        }

        item = motor_list.at(5);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_r_elbow_pitch->setText(info);
            ui.slider_right_elbow_pitch->setMinimum(item.min);
            ui.slider_right_elbow_pitch->setMaximum(item.max);
            ui.slider_right_elbow_pitch->setValue(item.init);
            ui.spin_r_elbow_pitch->setMinimum(item.min);
            ui.spin_r_elbow_pitch->setMaximum(item.max);
            ui.spin_r_elbow_pitch->setValue(item.init);
        }
        else
        {
            ui.txt_info_r_elbow_pitch->setText("not found");
            ui.slider_right_elbow_pitch->setMinimum(-1);
            ui.slider_right_elbow_pitch->setMaximum(-1);
            ui.slider_right_elbow_pitch->setValue(-1);
            ui.spin_r_elbow_pitch->setMinimum(-1);
            ui.spin_r_elbow_pitch->setMaximum(-1);
            ui.spin_r_elbow_pitch->setValue(-1);
        }

        item = motor_list.at(6);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_r_elbow_roll->setText(info);
            ui.slider_right_elbow_roll->setMinimum(item.min);
            ui.slider_right_elbow_roll->setMaximum(item.max);
            ui.slider_right_elbow_roll->setValue(item.init);
            ui.spin_r_elbow_roll->setMinimum(item.min);
            ui.spin_r_elbow_roll->setMaximum(item.max);
            ui.spin_r_elbow_roll->setValue(item.init);
        }
        else
        {
            ui.txt_info_r_elbow_roll->setText("not found");
            ui.slider_right_elbow_roll->setMinimum(-1);
            ui.slider_right_elbow_roll->setMaximum(-1);
            ui.slider_right_elbow_roll->setValue(-1);
            ui.spin_r_elbow_roll->setMinimum(-1);
            ui.spin_r_elbow_roll->setMaximum(-1);
            ui.spin_r_elbow_roll->setValue(-1);
        }

        item = motor_list.at(7);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_r_wrist_pitch->setText(info);
            ui.slider_right_wrist_pitch->setMinimum(item.min);
            ui.slider_right_wrist_pitch->setMaximum(item.max);
            ui.slider_right_wrist_pitch->setValue(item.init);
            ui.spin_r_wrist_pitch->setMinimum(item.min);
            ui.spin_r_wrist_pitch->setMaximum(item.max);
            ui.spin_r_wrist_pitch->setValue(item.init);
        }
        else
        {
            ui.txt_info_r_wrist_pitch->setText("not found");
            ui.slider_right_wrist_pitch->setMinimum(-1);
            ui.slider_right_wrist_pitch->setMaximum(-1);
            ui.slider_right_wrist_pitch->setValue(-1);
            ui.spin_r_wrist_pitch->setMinimum(-1);
            ui.spin_r_wrist_pitch->setMaximum(-1);
            ui.spin_r_wrist_pitch->setValue(-1);
        }

        item = motor_list.at(8);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_r_wrist_roll->setText(info);
            ui.slider_right_wrist_roll->setMinimum(item.min);
            ui.slider_right_wrist_roll->setMaximum(item.max);
            ui.slider_right_wrist_roll->setValue(item.init);
            ui.spin_r_wrist_roll->setMinimum(item.min);
            ui.spin_r_wrist_roll->setMaximum(item.max);
            ui.spin_r_wrist_roll->setValue(item.init);
        }
        else
        {
            ui.txt_info_r_wrist_roll->setText("not found");
            ui.slider_right_wrist_roll->setMinimum(-1);
            ui.slider_right_wrist_roll->setMaximum(-1);
            ui.slider_right_wrist_roll->setValue(-1);
            ui.spin_r_wrist_roll->setMinimum(-1);
            ui.spin_r_wrist_roll->setMaximum(-1);
            ui.spin_r_wrist_roll->setValue(-1);
        }

        item = motor_list.at(9);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_r_gripper->setText(info);
            ui.slider_right_gripper->setMinimum(item.min);
            ui.slider_right_gripper->setMaximum(item.max);
            ui.slider_right_gripper->setValue(item.init);
            ui.spin_r_gripper->setMinimum(item.min);
            ui.spin_r_gripper->setMaximum(item.max);
            ui.spin_r_gripper->setValue(item.init);
        }
        else
        {
            ui.txt_info_r_gripper->setText("not found");
            ui.slider_right_gripper->setMinimum(-1);
            ui.slider_right_gripper->setMaximum(-1);
            ui.slider_right_gripper->setValue(-1);
            ui.spin_r_gripper->setMinimum(-1);
            ui.spin_r_gripper->setMaximum(-1);
            ui.spin_r_gripper->setValue(-1);
        }
        //===================================================
        item = motor_list.at(10);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_l_shoulder_yaw->setText(info);
            ui.slider_left_shoulder_yaw->setMinimum(item.min);
            ui.slider_left_shoulder_yaw->setMaximum(item.max);
            ui.slider_left_shoulder_yaw->setValue(item.init);
            ui.spin_l_shoulder_yaw->setMinimum(item.min);
            ui.spin_l_shoulder_yaw->setMaximum(item.max);
            ui.spin_l_shoulder_yaw->setValue(item.init);
        }
        else
        {
            ui.txt_info_l_shoulder_yaw->setText("not found");
            ui.slider_left_shoulder_yaw->setMinimum(-1);
            ui.slider_left_shoulder_yaw->setMaximum(-1);
            ui.slider_left_shoulder_yaw->setValue(-1);
            ui.spin_l_shoulder_yaw->setMinimum(-1);
            ui.spin_l_shoulder_yaw->setMaximum(-1);
            ui.spin_l_shoulder_yaw->setValue(-1);
        }


        item = motor_list.at(12);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_l_shoulder_pitch->setText(info);
            ui.slider_left_shoulder_pitch->setMinimum(item.min);
            ui.slider_left_shoulder_pitch->setMaximum(item.max);
            ui.slider_left_shoulder_pitch->setValue(item.init);
            ui.spin_l_shoulder_pitch->setMinimum(item.min);
            ui.spin_l_shoulder_pitch->setMaximum(item.max);
            ui.spin_l_shoulder_pitch->setValue(item.init);
        }
        else
        {
            ui.txt_info_l_shoulder_pitch->setText("not found");
            ui.slider_left_shoulder_pitch->setMinimum(-1);
            ui.slider_left_shoulder_pitch->setMaximum(-1);
            ui.slider_left_shoulder_pitch->setValue(-1);
            ui.spin_l_shoulder_pitch->setMinimum(-1);
            ui.spin_l_shoulder_pitch->setMaximum(-1);
            ui.spin_l_shoulder_pitch->setValue(-1);
        }

        item = motor_list.at(14);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_l_shoulder_roll->setText(info);
            ui.slider_left_shoulder_roll->setMinimum(item.min);
            ui.slider_left_shoulder_roll->setMaximum(item.max);
            ui.slider_left_shoulder_roll->setValue(item.init);
            ui.spin_l_shoulder_roll->setMinimum(item.min);
            ui.spin_l_shoulder_roll->setMaximum(item.max);
            ui.spin_l_shoulder_roll->setValue(item.init);
        }
        else
        {
            ui.txt_info_l_shoulder_roll->setText("not found");
            ui.slider_left_shoulder_roll->setMinimum(-1);
            ui.slider_left_shoulder_roll->setMaximum(-1);
            ui.slider_left_shoulder_roll->setValue(-1);
            ui.spin_l_shoulder_roll->setMinimum(-1);
            ui.spin_l_shoulder_roll->setMaximum(-1);
            ui.spin_l_shoulder_roll->setValue(-1);
        }

        item = motor_list.at(15);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_l_elbow_pitch->setText(info);
            ui.slider_left_elbow_pitch->setMinimum(item.min);
            ui.slider_left_elbow_pitch->setMaximum(item.max);
            ui.slider_left_elbow_pitch->setValue(item.init);
            ui.spin_l_elbow_pitch->setMinimum(item.min);
            ui.spin_l_elbow_pitch->setMaximum(item.max);
            ui.spin_l_elbow_pitch->setValue(item.init);
        }
        else
        {
            ui.txt_info_l_elbow_pitch->setText("not found");
            ui.slider_left_elbow_pitch->setMinimum(-1);
            ui.slider_left_elbow_pitch->setMaximum(-1);
            ui.slider_left_elbow_pitch->setValue(-1);
            ui.spin_l_elbow_pitch->setMinimum(-1);
            ui.spin_l_elbow_pitch->setMaximum(-1);
            ui.spin_l_elbow_pitch->setValue(-1);
        }

        item = motor_list.at(16);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_l_elbow_roll->setText(info);
            ui.slider_left_elbow_roll->setMinimum(item.min);
            ui.slider_left_elbow_roll->setMaximum(item.max);
            ui.slider_left_elbow_roll->setValue(item.init);
            ui.spin_l_elbow_roll->setMinimum(item.min);
            ui.spin_l_elbow_roll->setMaximum(item.max);
            ui.spin_l_elbow_roll->setValue(item.init);
        }
        else
        {
            ui.txt_info_l_elbow_roll->setText("not found");
            ui.slider_left_elbow_roll->setMinimum(-1);
            ui.slider_left_elbow_roll->setMaximum(-1);
            ui.slider_left_elbow_roll->setValue(-1);
            ui.spin_l_elbow_roll->setMinimum(-1);
            ui.spin_l_elbow_roll->setMaximum(-1);
            ui.spin_l_elbow_roll->setValue(-1);
        }

        item = motor_list.at(17);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_l_wrist_pitch->setText(info);
            ui.slider_left_wrist_pitch->setMinimum(item.min);
            ui.slider_left_wrist_pitch->setMaximum(item.max);
            ui.slider_left_wrist_pitch->setValue(item.init);
            ui.spin_l_wrist_pitch->setMinimum(item.min);
            ui.spin_l_wrist_pitch->setMaximum(item.max);
            ui.spin_l_wrist_pitch->setValue(item.init);
        }
        else
        {
            ui.txt_info_l_wrist_pitch->setText("not found");
            ui.slider_left_wrist_pitch->setMinimum(-1);
            ui.slider_left_wrist_pitch->setMaximum(-1);
            ui.slider_left_wrist_pitch->setValue(-1);
            ui.spin_l_wrist_pitch->setMinimum(-1);
            ui.spin_l_wrist_pitch->setMaximum(-1);
            ui.spin_l_wrist_pitch->setValue(-1);
        }

        item = motor_list.at(18);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_l_wrist_roll->setText(info);
            ui.slider_left_wrist_roll->setMinimum(item.min);
            ui.slider_left_wrist_roll->setMaximum(item.max);
            ui.slider_left_wrist_roll->setValue(item.init);
            ui.spin_l_wrist_roll->setMinimum(item.min);
            ui.spin_l_wrist_roll->setMaximum(item.max);
            ui.spin_l_wrist_roll->setValue(item.init);
        }
        else
        {
            ui.txt_info_l_wrist_roll->setText("not found");
            ui.slider_left_wrist_roll->setMinimum(-1);
            ui.slider_left_wrist_roll->setMaximum(-1);
            ui.slider_left_wrist_roll->setValue(-1);
            ui.spin_l_wrist_roll->setMinimum(-1);
            ui.spin_l_wrist_roll->setMaximum(-1);
            ui.spin_l_wrist_roll->setValue(-1);
        }

        item = motor_list.at(19);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_l_gripper->setText(info);
            ui.slider_left_gripper->setMinimum(item.min);
            ui.slider_left_gripper->setMaximum(item.max);
            ui.slider_left_gripper->setValue(item.init);
            ui.spin_l_gripper->setMinimum(item.min);
            ui.spin_l_gripper->setMaximum(item.max);
            ui.spin_l_gripper->setValue(item.init);
        }
        else
        {
            ui.txt_info_l_gripper->setText("not found");
            ui.slider_left_gripper->setMinimum(-1);
            ui.slider_left_gripper->setMaximum(-1);
            ui.slider_left_gripper->setValue(-1);
            ui.spin_l_gripper->setMinimum(-1);
            ui.spin_l_gripper->setMaximum(-1);
            ui.spin_l_gripper->setValue(-1);
        }
        //===================================================

        item = motor_list.at(20);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_head_yaw->setText(info);
            ui.slider_head_yaw->setMinimum(item.min);
            ui.slider_head_yaw->setMaximum(item.max);
            ui.slider_head_yaw->setValue(item.init);
            ui.spin_head_yaw->setMinimum(item.min);
            ui.spin_head_yaw->setMaximum(item.max);
            ui.spin_head_yaw->setValue(item.init);
        }
        else
        {
            ui.txt_info_head_yaw->setText("not found");
            ui.slider_head_yaw->setMinimum(-1);
            ui.slider_head_yaw->setMaximum(-1);
            ui.slider_head_yaw->setValue(-1);
            ui.spin_head_yaw->setMinimum(-1);
            ui.spin_head_yaw->setMaximum(-1);
            ui.spin_head_yaw->setValue(-1);
        }


        item = motor_list.at(21);
        if ( item.status != "not found" )
        {

            info = QString::number(item.min) + "," + QString::number(item.init) + "," + QString::number(item.max);
            ui.txt_info_head_pitch->setText(info);
            ui.slider_head_pitch->setMinimum(item.min);
            ui.slider_head_pitch->setMaximum(item.max);
            ui.slider_head_pitch->setValue(item.init);
            ui.spin_head_pitch->setMinimum(item.min);
            ui.spin_head_pitch->setMaximum(item.max);
            ui.spin_head_pitch->setValue(item.init);
        }
        else
        {
            ui.txt_info_head_pitch->setText("not found");
            ui.slider_head_pitch->setMinimum(-1);
            ui.slider_head_pitch->setMaximum(-1);
            ui.slider_head_pitch->setValue(-1);
            ui.spin_head_pitch->setMinimum(-1);
            ui.spin_head_pitch->setMaximum(-1);
            ui.spin_head_pitch->setValue(-1);
        }
        //===================================================
        first_update = true;
    }

    ui.txt_r_shoulder_yaw->setText(QString::number(ui.slider_right_shoulder_yaw->value()));
    ui.txt_r_shoulder_pitch->setText(QString::number(ui.slider_right_shoulder_pitch->value()));
    ui.txt_r_shoulder_roll->setText(QString::number(ui.slider_right_shoulder_roll->value()));
    ui.txt_r_elbow_pitch->setText(QString::number(ui.slider_right_elbow_pitch->value()));
    ui.txt_r_elbow_roll->setText(QString::number(ui.slider_right_elbow_roll->value()));
    ui.txt_r_wrist_pitch->setText(QString::number(ui.slider_right_wrist_pitch->value()));
    ui.txt_r_wrist_roll->setText(QString::number(ui.slider_right_wrist_roll->value()));
    ui.txt_r_gripper->setText(QString::number(ui.slider_right_gripper->value()));
    ui.txt_l_shoulder_yaw->setText(QString::number(ui.slider_left_shoulder_yaw->value()));
    ui.txt_l_shoulder_pitch->setText(QString::number(ui.slider_left_shoulder_pitch->value()));
    ui.txt_l_shoulder_roll->setText(QString::number(ui.slider_left_shoulder_roll->value()));
    ui.txt_l_elbow_pitch->setText(QString::number(ui.slider_left_elbow_pitch->value()));
    ui.txt_l_elbow_roll->setText(QString::number(ui.slider_left_elbow_roll->value()));
    ui.txt_l_wrist_pitch->setText(QString::number(ui.slider_left_wrist_pitch->value()));
    ui.txt_l_wrist_roll->setText(QString::number(ui.slider_left_wrist_roll->value()));
    ui.txt_l_gripper->setText(QString::number(ui.slider_left_gripper->value()));
    ui.txt_head_yaw->setText(QString::number(ui.slider_head_yaw->value()));
    ui.txt_head_pitch->setText(QString::number(ui.slider_head_pitch->value()));
}

void CameraCalibView::motor_selected()
{
    int index = ui.lst_motors->currentRow();
    selected_motor = index;
}

//===============================================================

void CameraCalibView::right_shoulder_yaw_reset()
{
    motor_data item = motor_list.at(0);
    if ( item.status == "not found" )return;
    ui.slider_right_shoulder_yaw->setValue(item.init);

}

void CameraCalibView::right_shoulder_pitch_reset()
{
    motor_data item = motor_list.at(2);
    if ( item.status == "not found" )return;
    ui.slider_right_shoulder_pitch->setValue(item.init);
}

void CameraCalibView::right_shoulder_roll_reset()
{
    motor_data item = motor_list.at(4);
    if ( item.status == "not found" )return;
    ui.slider_right_shoulder_roll->setValue(item.init);
}

void CameraCalibView::right_elbow_pitch_reset()
{
    motor_data item = motor_list.at(5);
    if ( item.status == "not found" )return;
    ui.slider_right_elbow_pitch->setValue(item.init);
}

void CameraCalibView::right_elbow_roll_reset()
{
    motor_data item = motor_list.at(6);
    if ( item.status == "not found" )return;
    ui.slider_right_elbow_roll->setValue(item.init);
}

void CameraCalibView::right_wrist_pitch_reset()
{
    motor_data item = motor_list.at(7);
    if ( item.status == "not found" )return;
    ui.slider_right_wrist_pitch->setValue(item.init);
}

void CameraCalibView::right_wrist_roll_reset()
{
    motor_data item = motor_list.at(8);
    if ( item.status == "not found" )return;
    ui.slider_right_wrist_roll->setValue(item.init);
}

void CameraCalibView::right_gripper_reset()
{
    motor_data item = motor_list.at(9);
    if ( item.status == "not found" )return;
    ui.slider_right_gripper->setValue(item.init);
}

void CameraCalibView::right_reset()
{
    right_shoulder_yaw_reset();
    right_shoulder_pitch_reset();
    right_shoulder_roll_reset();
    right_elbow_pitch_reset();
    right_elbow_roll_reset();
    right_wrist_pitch_reset();
    right_wrist_roll_reset();
    right_gripper_reset();
}

//==================================================================

void CameraCalibView::left_shoulder_yaw_reset()
{
    motor_data item = motor_list.at(10);
    if ( item.status == "not found" )return;
    ui.slider_left_shoulder_yaw->setValue(item.init);
}

void CameraCalibView::left_shoulder_pitch_reset()
{
    motor_data item = motor_list.at(12);
    if ( item.status == "not found" )return;
    ui.slider_left_shoulder_pitch->setValue(item.init);
}

void CameraCalibView::left_shoulder_roll_reset()
{
    motor_data item = motor_list.at(14);
    if ( item.status == "not found" )return;
    ui.slider_left_shoulder_roll->setValue(item.init);
}

void CameraCalibView::left_elbow_pitch_reset()
{
    motor_data item = motor_list.at(15);
    if ( item.status == "not found" )return;
    ui.slider_left_elbow_pitch->setValue(item.init);
}

void CameraCalibView::left_elbow_roll_reset()
{
    motor_data item = motor_list.at(16);
    if ( item.status == "not found" )return;
    ui.slider_left_elbow_roll->setValue(item.init);
}

void CameraCalibView::left_wrist_pitch_reset()
{
    motor_data item = motor_list.at(17);
    if ( item.status == "not found" )return;
    ui.slider_left_wrist_pitch->setValue(item.init);
}

void CameraCalibView::left_wrist_roll_reset()
{
    motor_data item = motor_list.at(18);
    if ( item.status == "not found" )return;
    ui.slider_left_wrist_roll->setValue(item.init);
}

void CameraCalibView::left_gripper_reset()
{
    motor_data item = motor_list.at(19);
    if ( item.status == "not found" )return;
    ui.slider_left_gripper->setValue(item.init);
}

void CameraCalibView::left_reset()
{
    left_shoulder_yaw_reset();
    left_shoulder_pitch_reset();
    left_shoulder_roll_reset();
    left_elbow_pitch_reset();
    left_elbow_roll_reset();
    left_wrist_pitch_reset();
    left_wrist_roll_reset();
    left_gripper_reset();
}

//==================================================================
void CameraCalibView::head_yaw_reset()
{
    motor_data item = motor_list.at(20);
    if ( item.status == "not found" )return;
    ui.slider_head_yaw->setValue(item.init);
}

void CameraCalibView::head_pitch_reset()
{
    motor_data item = motor_list.at(21);
    if ( item.status == "not found" )return;
    ui.slider_head_pitch->setValue(item.init);
}

void CameraCalibView::head_reset()
{
    head_yaw_reset();
    head_pitch_reset();

}

bool motor_torque_status = true;

void CameraCalibView::torque_toggle()
{
    upperbodycore_msgs::motortorque t_srv;
    motor_torque_status = !motor_torque_status;
    t_srv.request.status = motor_torque_status;
    service_torquemotor.call(t_srv);
}

void CameraCalibView::save_path()
{
    QString fn = QFileDialog::getSaveFileName(widget, tr("Save as..."),
                                              QString(), tr("Text-Files (*.txt);;All Files (*)"));
    if (fn.isEmpty())
        return;

    if (! (fn.endsWith(".txt", Qt::CaseInsensitive) ) )
        fn += ".txt";

    ui.txt_savePath->setText(fn);
    record_path = fn.toUtf8().constData();
}

void CameraCalibView::load_path()
{
    QString fn = QFileDialog::getOpenFileName(widget, tr("Open Directory..."),
                                              QString(), tr("Text-Files (*.txt);;All Files (*)"));
    ui.txt_loadPath->setText(fn);
    playBack_path = fn.toUtf8().constData();
}

void CameraCalibView::record()
{
    if ( record_path != "")
    {
        if ( ui.btn_record->text() == "Record")
        {
            upperbodycore_msgs::recordSrv srv_rec;
            srv_rec.request.path = record_path;
            srv_rec.request.command = "record_start";
            ui.btn_record->setText("Stop");
            bool r = service_record.call(srv_rec);
            if ( r == false)
            {
                QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
            }
        }
        else
        {
            upperbodycore_msgs::recordSrv srv_rec;
            //srv_rec.request.path = record_path;
            srv_rec.request.command = "record_stop";
            ui.btn_record->setText("Record");
            bool r = service_record.call(srv_rec);
            if ( r == false)
            {
                QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
            }

        }
    }
    else
    {
        QMessageBox::warning(widget,tr("Path error..."),tr("Please select a valid file path"));
    }

}

void CameraCalibView::playBack()
{
    if ( playBack_path != "" )
    {
        upperbodycore_msgs::recordSrv srv_rec;
        srv_rec.request.command = "play";
        srv_rec.request.path = playBack_path;
        bool r = service_record.call(srv_rec);
        if ( r == false)
        {
            QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
        }
    }
    else
    {
        QMessageBox::warning(widget,tr("Path error..."),tr("Please select a valid file path"));
    }
}

void CameraCalibView::loadPath_sound()
{
    QString fn = QFileDialog::getOpenFileName(widget, tr("Open File..."),
                                              QString(), tr("MP3-Files (*.mp3);;All Files (*)"));
    ui.txt_loadPath_sound->setText(fn);
    playBack_sound_path = fn.toUtf8().constData();

}
void CameraCalibView::load_directory_sound()
{
    QString directory = QFileDialog::getExistingDirectory(widget, tr("Open Directory"),
          "",
         QFileDialog::ShowDirsOnly
         | QFileDialog::DontResolveSymlinks);

    ui.txt_setPath_sound->setText(directory);
    playBack_sound_path = directory.toUtf8().constData();

    upperbodycore_msgs::sound srv_sound;
    srv_sound.request.command = "set_default_path";
    bool r = service_sound.call(srv_sound);
    if ( r == false)
    {
        QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
    }
}

void CameraCalibView::playBack_sound()
{
    if ( playBack_sound_path != "")
    {
        upperbodycore_msgs::sound srv_sound;
        srv_sound.request.command = "play";
        srv_sound.request.path = playBack_sound_path;
        bool r = service_sound.call(srv_sound);
        if ( r == false)
        {
            QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
        }
    }
    else
    {
        QMessageBox::warning(widget,tr("Path error..."),tr("Please select a valid file path"));
    }
}

void CameraCalibView::Pause_sound()
{
    upperbodycore_msgs::sound srv_sound;
    srv_sound.request.command = "pause";
    bool r = service_sound.call(srv_sound);
    if ( r == false)
    {
        QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
    }
}

void CameraCalibView::Resume_sound()
{
    upperbodycore_msgs::sound srv_sound;
    srv_sound.request.command = "resume";
    bool r = service_sound.call(srv_sound);
    if ( r == false)
    {
        QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
    }
}

void CameraCalibView::Stop_sound()
{
    upperbodycore_msgs::sound srv_sound;
    srv_sound.request.command = "stop";
    bool r = service_sound.call(srv_sound);
    if ( r == false)
    {
        QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
    }
}

void CameraCalibView::wave_detection()
{
    upperbodycore_msgs::waveSrv srv_wave;
    srv_wave.request.command = "wave_start";
    bool r = service_wave.call(srv_wave);
    if ( r == false)
    {
        QMessageBox::warning(widget,tr("Service error..."),tr("Are you sure the wave program is running?"));
    }
}

void CameraCalibView::set_default_path()
{
    upperbodycore_msgs::sound srv_sound;
    srv_sound.request.command = "set_default_path";
    bool r = service_sound.call(srv_sound);
    if ( r == false)
    {
        QMessageBox::warning(widget,tr("Service error..."),tr("Service call failed \n 1) Check URL for invalid spaces \n 2) Ensure the service node is run"));
    }
}

bool face_status = false;
void CameraCalibView::facetoggle()
{
    upperbodycore_msgs::FaceDetectionSrv srv_face;
    face_status = !face_status;
    srv_face.request.request_de = face_status;
    service_face.call(srv_face);
}

bool facetrack_status = false;
void CameraCalibView::facetracktoggle()
{
    upperbodycore_msgs::FaceTrackingSrv srv_facetrack;
    facetrack_status = !facetrack_status;
    srv_facetrack.request.request_tr = facetrack_status;


    if ( ui.radio_nearest->isChecked() )
    {
        srv_facetrack.request.nearest = true;
    }
    else
    {
        srv_facetrack.request.nearest = false;
    }

    if ( ui.radio_byid->isChecked() )
    {
        srv_facetrack.request.id_tr_flag = true;
        srv_facetrack.request.id_tr =  ui.txt_trackid->toPlainText().toInt();
    }
    else
    {
        srv_facetrack.request.id_tr_flag = false;
        srv_facetrack.request.id_tr =  0;
    }


    service_facetrack.call(srv_facetrack);
}
bool headtracker_status;
void CameraCalibView::face_headtracker()
{
    upperbodycore_msgs::face_headtrackerSrv srv_headtrack;
    headtracker_status = !headtracker_status;
    srv_headtrack.request.head_tracker = headtracker_status;

    service_headtracker.call(srv_headtrack);
}

//==================================================================

void CameraCalibView::face_config()
{
    upperbodycore_msgs::set_FaceDetectionSrv faceconfig_srv;
   faceconfig_srv.request.minsize = ui.txt_minsize->toPlainText().toInt();
   faceconfig_srv.request.scalefactor =  ui.txt_scalefactor->toPlainText().toFloat();
   faceconfig_srv.request.minNeighbores =  ui.txt_minneighbors->toPlainText().toInt();
    service_faceconfig.call(faceconfig_srv);
}

void CameraCalibView::initPlugin(qt_gui_cpp::PluginContext& context)
{

    imageRaw_kinectdepth = cv::Mat::zeros(480,640, CV_8UC3);

    QStringList argv = context.argv();
    widget = new QWidget();
    ui.setupUi(widget);
    context.addWidget(widget);

    ui.spin_r_shoulder_yaw_speed->setValue(5);
    ui.spin_r_shoulder_pitch_speed->setValue(5);
    ui.spin_r_shoulder_roll_speed->setValue(5);
    ui.spin_r_elbow_pitch_speed->setValue(5);
    ui.spin_r_elbow_roll_speed->setValue(5);
    ui.spin_r_wrist_pitch_speed->setValue(5);
    ui.spin_r_wrist_roll_speed->setValue(5);
    ui.spin_r_gripper_speed->setValue(5);

    ui.spin_l_shoulder_yaw_speed->setValue(5);
    ui.spin_l_shoulder_pitch_speed->setValue(5);
    ui.spin_l_shoulder_roll_speed->setValue(5);
    ui.spin_l_elbow_pitch_speed->setValue(5);
    ui.spin_l_elbow_roll_speed->setValue(5);
    ui.spin_l_wrist_pitch_speed->setValue(5);
    ui.spin_l_wrist_roll_speed->setValue(5);
    ui.spin_l_gripper_speed->setValue(5);

    ui.spin_head_yaw_speed->setValue(5);
    ui.spin_head_pitch_speed->setValue(5);

    connect(ui.lst_motors,SIGNAL(currentRowChanged(int)),this,SLOT(motor_selected()));

    connect(ui.slider_right_shoulder_yaw,SIGNAL(valueChanged(int)),this,SLOT(motor_update_right()));
    connect(ui.slider_right_shoulder_pitch,SIGNAL(valueChanged(int)),this,SLOT(motor_update_right()));
    connect(ui.slider_right_shoulder_roll,SIGNAL(valueChanged(int)),this,SLOT(motor_update_right()));
    connect(ui.slider_right_elbow_pitch,SIGNAL(valueChanged(int)),this,SLOT(motor_update_right()));
    connect(ui.slider_right_elbow_roll,SIGNAL(valueChanged(int)),this,SLOT(motor_update_right()));
    connect(ui.slider_right_wrist_pitch,SIGNAL(valueChanged(int)),this,SLOT(motor_update_right()));
    connect(ui.slider_right_wrist_roll,SIGNAL(valueChanged(int)),this,SLOT(motor_update_right()));
    connect(ui.slider_right_gripper,SIGNAL(valueChanged(int)),this,SLOT(motor_update_right()));

    connect(ui.btn_reset_r_all,SIGNAL(clicked()),this,SLOT(right_reset()));
    connect(ui.btn_reset_r_shoulder_yaw,SIGNAL(clicked()),this,SLOT(right_shoulder_yaw_reset()));
    connect(ui.btn_reset_r_shoulder_pitch,SIGNAL(clicked()),this,SLOT(right_shoulder_pitch_reset()));
    connect(ui.btn_reset_r_shoulder_roll,SIGNAL(clicked()),this,SLOT(right_shoulder_roll_reset()));
    connect(ui.btn_reset_r_elbow_pitch,SIGNAL(clicked()),this,SLOT(right_elbow_pitch_reset()));
    connect(ui.btn_reset_r_elbow_roll,SIGNAL(clicked()),this,SLOT(right_elbow_roll_reset()));
    connect(ui.btn_reset_r_wrist_pitch,SIGNAL(clicked()),this,SLOT(right_wrist_pitch_reset()));
    connect(ui.btn_reset_r_wrist_roll,SIGNAL(clicked()),this,SLOT(right_wrist_roll_reset()));
    connect(ui.btn_reset_r_gripper,SIGNAL(clicked()),this,SLOT(right_gripper_reset()));

    connect(ui.spin_r_shoulder_yaw,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_right()));
    connect(ui.spin_r_shoulder_pitch,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_right()));
    connect(ui.spin_r_shoulder_roll,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_right()));
    connect(ui.spin_r_elbow_pitch,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_right()));
    connect(ui.spin_r_elbow_roll,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_right()));
    connect(ui.spin_r_wrist_pitch,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_right()));
    connect(ui.spin_r_wrist_roll,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_right()));
    connect(ui.spin_r_gripper,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_right()));

    //=========================================================================================================

    connect(ui.slider_left_shoulder_yaw,SIGNAL(valueChanged(int)),this,SLOT(motor_update_left()));
    connect(ui.slider_left_shoulder_pitch,SIGNAL(valueChanged(int)),this,SLOT(motor_update_left()));
    connect(ui.slider_left_shoulder_roll,SIGNAL(valueChanged(int)),this,SLOT(motor_update_left()));
    connect(ui.slider_left_elbow_pitch,SIGNAL(valueChanged(int)),this,SLOT(motor_update_left()));
    connect(ui.slider_left_elbow_roll,SIGNAL(valueChanged(int)),this,SLOT(motor_update_left()));
    connect(ui.slider_left_wrist_pitch,SIGNAL(valueChanged(int)),this,SLOT(motor_update_left()));
    connect(ui.slider_left_wrist_roll,SIGNAL(valueChanged(int)),this,SLOT(motor_update_left()));
    connect(ui.slider_left_gripper,SIGNAL(valueChanged(int)),this,SLOT(motor_update_left()));

    connect(ui.btn_reset_l_all,SIGNAL(clicked()),this,SLOT(left_reset()));
    connect(ui.btn_reset_l_shoulder_yaw,SIGNAL(clicked()),this,SLOT(left_shoulder_yaw_reset()));
    connect(ui.btn_reset_l_shoulder_pitch,SIGNAL(clicked()),this,SLOT(left_shoulder_pitch_reset()));
    connect(ui.btn_reset_l_shoulder_roll,SIGNAL(clicked()),this,SLOT(left_shoulder_roll_reset()));
    connect(ui.btn_reset_l_elbow_pitch,SIGNAL(clicked()),this,SLOT(left_elbow_pitch_reset()));
    connect(ui.btn_reset_l_elbow_roll,SIGNAL(clicked()),this,SLOT(left_elbow_roll_reset()));
    connect(ui.btn_reset_l_wrist_pitch,SIGNAL(clicked()),this,SLOT(left_wrist_pitch_reset()));
    connect(ui.btn_reset_l_wrist_roll,SIGNAL(clicked()),this,SLOT(left_wrist_roll_reset()));
    connect(ui.btn_reset_l_gripper,SIGNAL(clicked()),this,SLOT(left_gripper_reset()));

    connect(ui.spin_l_shoulder_yaw,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_left()));
    connect(ui.spin_l_shoulder_pitch,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_left()));
    connect(ui.spin_l_shoulder_roll,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_left()));
    connect(ui.spin_l_elbow_pitch,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_left()));
    connect(ui.spin_l_elbow_roll,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_left()));
    connect(ui.spin_l_wrist_pitch,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_left()));
    connect(ui.spin_l_wrist_roll,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_left()));
    connect(ui.spin_l_gripper,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_left()));

    //========================================================================================================

    connect(ui.slider_head_yaw,SIGNAL(valueChanged(int)),this,SLOT(motor_update_head()));
    connect(ui.slider_head_pitch,SIGNAL(valueChanged(int)),this,SLOT(motor_update_head()));

    connect(ui.btn_reset_head_all,SIGNAL(clicked()),this,SLOT(head_reset()));
    connect(ui.btn_reset_head_yaw,SIGNAL(clicked()),this,SLOT(head_yaw_reset()));
    connect(ui.btn_reset_head_pitch,SIGNAL(clicked()),this,SLOT(head_pitch_reset()));

    connect(ui.spin_head_yaw,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_head()));
    connect(ui.spin_head_pitch,SIGNAL(editingFinished()),this,SLOT(motor_update_spinner_head()));

    //=========================================================================================================
    connect(ui.btn_facetoggle,SIGNAL(clicked()),this,SLOT(facetoggle()));
    connect(ui.btn_torquetoggle,SIGNAL(clicked()),this,SLOT(torque_toggle()));

    connect(ui.btn_savePath,SIGNAL(clicked()),this,SLOT(save_path()));
    connect(ui.btn_loadPath,SIGNAL(clicked()),this,SLOT(load_path()));
    connect(ui.btn_record,SIGNAL(clicked()),this,SLOT(record()));
    connect(ui.btn_playBack,SIGNAL(clicked()),this,SLOT(playBack()));

    connect(ui.btn_loadPath_sound,SIGNAL(clicked()),this,SLOT(loadPath_sound()));
    connect(ui.btn_playBack_sound,SIGNAL(clicked()),this,SLOT(playBack_sound()));
    connect(ui.btn_pause_sound,SIGNAL(clicked()),this,SLOT(Pause_sound()));
    connect(ui.btn_resume_sound,SIGNAL(clicked()),this,SLOT(Resume_sound()));
    connect(ui.btn_stop_sound,SIGNAL(clicked()),this,SLOT(Stop_sound()));
    connect(ui.btn_set_defult_path,SIGNAL(clicked()),this,SLOT(load_directory_sound()));

    connect(ui.lst_joints,SIGNAL(currentRowChanged(int)),this,SLOT(joint_select()));
    connect(ui.lst_allfaces,SIGNAL(currentRowChanged(int)),this,SLOT(face_select()));
    connect(ui.btn_faceset,SIGNAL(clicked()),this,SLOT(face_config()));

    connect(ui.btn_wavestart,SIGNAL(clicked()),this,SLOT(wave_detection()));
    connect(ui.btn_tracktoggle,SIGNAL(clicked()),this,SLOT(facetracktoggle()));
    connect(ui.btn_headtracker,SIGNAL(clicked()),this,SLOT(face_headtracker()));
    sub_motors = getNodeHandle().subscribe("/upperbodycoreout_feedback", 1, &CameraCalibView::callback_motors,this);
    sub_joints = getNodeHandle().subscribe("/skeletonout_jointPO", 1, &CameraCalibView::callback_joints,this);
    sub_gestures = getNodeHandle().subscribe("/skeletonout_gestureDetect",1, &CameraCalibView::callback_gestures,this);
    sub_wave = getNodeHandle().subscribe("/pgitic_wave_detect",1,&CameraCalibView::callback_wave,this);
    ros::NodeHandle node_handles[50];

    image_transport::ImageTransport it(getNodeHandle());
    try
    {
        imageSubscriber_kinectrgb = it.subscribe("/camera/rgb/image_color", 1, &CameraCalibView::callbackRawImage_kinectrgb, this);
        imageSubscriber_skeleton = it.subscribe("/pgitic_skeleton_image", 1, &CameraCalibView::callbackRawImage_skeleton, this);
        imageSubscriber_face = it.subscribe("/FACEOUT_image", 1, &CameraCalibView::callbackRawImage_face, this);
    }
    catch (image_transport::TransportLoadException& e)
    {
        QMessageBox::warning(widget, tr("Loading image transport plugin failed"), e.what());
    }

    sub_depth = getNodeHandle().subscribe("/camera/depth/points", 1, &CameraCalibView::chatterCallback_depth,this);
    sub_nearestface = getNodeHandle().subscribe("/FACEOUT_nearestfacePosition", 1, &CameraCalibView::callback_nearestface,this);
    sub_allfaces = getNodeHandle().subscribe("/FACEOUT_faceposition", 1, &CameraCalibView::callback_allfaces,this);

    chatter_pub_motor_right = node_handles[0].advertise<upperbodycore_msgs::upperbodymotors>("/upperbodycorein_right_motors", 10);
    chatter_pub_motor_left = node_handles[1].advertise<upperbodycore_msgs::upperbodymotors>("/upperbodycorein_left_motors", 10);
    chatter_pub_motor_head = node_handles[2].advertise<upperbodycore_msgs::upperbodymotors>("/upperbodycorein_head_motors", 10);
    service_torquemotor = node_handles[3].serviceClient<upperbodycore_msgs::motortorque>("upperbodycorein_torquemotor");

    service_record = node_handles[4].serviceClient<upperbodycore_msgs::recordSrv>("pgitic_record_motor_file");
    service_sound = node_handles[6].serviceClient<upperbodycore_msgs::sound>("pgitic_sound");
    service_face = node_handles[7].serviceClient<upperbodycore_msgs::FaceDetectionSrv>("FACEIN_facedetection");
    service_facetrack = node_handles[8].serviceClient<upperbodycore_msgs::FaceTrackingSrv>("FACEIN_facetrack");
    service_headtracker = node_handles[9].serviceClient<upperbodycore_msgs::face_headtrackerSrv>("FACEIN_headtracker");
    service_faceconfig =  node_handles[10].serviceClient<upperbodycore_msgs::set_FaceDetectionSrv>("FACEIN_setface");
    service_wave = node_handles[11].serviceClient<upperbodycore_msgs::waveSrv>("pgitic_wave_request");
    mtimer = new QTimer(this);
    connect(mtimer, SIGNAL(timeout()), this, SLOT(update()));
    mtimer->start(100);

    ui.txt_minsize->setText("60");
    ui.txt_scalefactor->setText("1.1");
    ui.txt_minneighbors->setText("3");
}

void CameraCalibView::shutdownPlugin()
{
    mtimer->stop();
    sub_motors.shutdown();
    sub_joints.shutdown();
    sub_gestures.shutdown();
    sub_allfaces.shutdown();
    sub_nearestface.shutdown();
    //===========================================
    imageSubscriber_kinectrgb.shutdown();
    imageSubscriber_skeleton.shutdown();
    imageSubscriber_face.shutdown();
    sub_depth.shutdown();
    //===========================================
}

void CameraCalibView::saveSettings(qt_gui_cpp::Settings& plugin_settings, qt_gui_cpp::Settings& instance_settings) const
{
}

void CameraCalibView::restoreSettings(const qt_gui_cpp::Settings& plugin_settings, const qt_gui_cpp::Settings& instance_settings)
{
}

} // namespace
PLUGINLIB_DECLARE_CLASS(pgitic_gui, CameraCalibView, pgitic_gui::CameraCalibView, rqt_gui_cpp::Plugin)

