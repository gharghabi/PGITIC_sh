#ifndef CAMERA_CALIB_VIEW_H
#define CAMERA_CALIB_VIEW_H

#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>

#include <rqt_gui_cpp/plugin.h>
#include "ui_camera_calib_view.h"

#include <QWidget>
#include <QMessageBox>
#include <vector>
#include <QMutex>

#include <upperbodycore_msgs/arm.h>
#include <upperbodycore_msgs/omnidata.h>
#include <upperbodycore_msgs/head.h>
#include <upperbodycore_msgs/irsensor.h>
#include <upperbodycore_msgs/motortorques.h>
#include <std_msgs/Int32.h>
#include <std_msgs/String.h>

#include <qt4/QtNetwork/QTcpServer>
#include <qt4/QtNetwork/QTcpSocket>

#include <upperbodycore_msgs/stop.h>

#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>

#include <dynamixel_msgs/MotorStateList.h>
#include <dynamixel_msgs/JointState.h>

#include <dynamixel_controllers/SetComplianceSlope.h>
#include <dynamixel_controllers/SetCompliancePunch.h>

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
#include <std_msgs/Int32.h>
#include <QTimer>
#include <QDebug>
#include <QFile>

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
#include "upperbodycore_msgs/skeletonSrv.h"

#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>

#include <upperbodycore_msgs/upperbodymotors.h>
#include <upperbodycore_msgs/upperbodymotorsfeedback.h>
#include <upperbodycore_msgs/motorfeedback.h>
#include <upperbodycore_msgs/jointPO.h>
#include <upperbodycore_msgs/GestureDetect.h>
#include <upperbodycore_msgs/FaceDetectionSrv.h>
#include <upperbodycore_msgs/FaceTrackingSrv.h>
#include <upperbodycore_msgs/facepos.h>
#include <upperbodycore_msgs/faceposition.h>
#include <upperbodycore_msgs/nearestfacepos.h>
#include <upperbodycore_msgs/set_FaceDetectionSrv.h>
#include <upperbodycore_msgs/waveSrv.h>
#include <upperbodycore_msgs/wave_hand.h>

#include <image_transport/image_transport.h>
#include <sensor_msgs/Image.h>
#include <opencv2/core/core.hpp>
#include <sensor_msgs/PointCloud2.h>

namespace pgitic_gui {

class CameraCalibView
  : public rqt_gui_cpp::Plugin
{
  Q_OBJECT
public:
  CameraCalibView();
  virtual void initPlugin(qt_gui_cpp::PluginContext& context);
  virtual void shutdownPlugin();
  virtual void saveSettings(qt_gui_cpp::Settings& plugin_settings, qt_gui_cpp::Settings& instance_settings) const;
  virtual void restoreSettings(const qt_gui_cpp::Settings& plugin_settings, const qt_gui_cpp::Settings& instance_settings);
  
  ros::ServiceClient service_faceconfig;


public slots:
  void z_update();
  void motor_update_right();
  void motor_update_spinner_right();

  void motor_update_left();
  void motor_update_spinner_left();

  void motor_update_head();
  void motor_update_spinner_head();

  void motor_selected();
  void update();
  void init_config();

  void right_shoulder_yaw_reset();
  void right_shoulder_pitch_reset();
  void right_shoulder_roll_reset();
  void right_elbow_pitch_reset();
  void right_elbow_roll_reset();
  void right_wrist_pitch_reset();
  void right_wrist_roll_reset();
  void right_gripper_reset();
  void right_reset();

  void left_shoulder_yaw_reset();
  void left_shoulder_pitch_reset();
  void left_shoulder_roll_reset();
  void left_elbow_pitch_reset();
  void left_elbow_roll_reset();
  void left_wrist_pitch_reset();
  void left_wrist_roll_reset();
  void left_gripper_reset();
  void left_reset();

  void head_yaw_reset();
  void head_pitch_reset();
  void head_reset();

  void torque_toggle();
  void save_path();
  void load_path();
  void record();
  void playBack();

  void load_directory_sound();
  void loadPath_sound();
  void playBack_sound();
  void Pause_sound();
  void Resume_sound();
  void Stop_sound();
  void set_default_path();

  void wave_detection();

  void facetoggle();
  void facetracktoggle();
  void joint_select();
  void face_select();
  void face_config();
  void face_headtracker();

  std::string get_motorname(int id);
  int get_motorindex(int id);
  //ros::ServiceClient service_gesture_enable;
  //ros::ServiceClient service_skeleton_enable;
  //upperbodycore_msgs::skeletonSrv skelsrv;


private:
  Ui::CameraCalibViewWidget ui;
  QWidget* widget;

 ros::Subscriber sub_motors;
 ros::Subscriber sub_joints;
 ros::Subscriber sub_gestures;
 ros::Subscriber sub_depth;
 ros::Subscriber sub_nearestface;
 ros::Subscriber sub_allfaces;
 ros::Subscriber sub_wave;

 image_transport::Subscriber imageSubscriber_kinectrgb;
 cv::Mat imageRaw_kinectrgb;
 cv::Mat imageRaw_kinectdepth;
 image_transport::Subscriber imageSubscriber_skeleton;
 cv::Mat imageRaw_skeleton;
 image_transport::Subscriber imageSubscriber_face;
 cv::Mat imageRaw_face;

  QMutex m_mutex;
  virtual void callbackRawImage_kinectrgb(const sensor_msgs::Image::ConstPtr& msg);
  virtual void chatterCallback_depth(const sensor_msgs::PointCloud2::ConstPtr &msg);
  virtual void callbackRawImage_skeleton(const sensor_msgs::Image::ConstPtr& msg);
  virtual void callbackRawImage_face(const sensor_msgs::Image::ConstPtr& msg);

  virtual void callback_allfaces(const upperbodycore_msgs::faceposition::ConstPtr &msg);
  virtual void callback_nearestface(const upperbodycore_msgs::nearestfacepos::ConstPtr &msg);
  virtual void callback_motors(const upperbodycore_msgs::upperbodymotorsfeedback::ConstPtr &msg);
  virtual void callback_joints(const upperbodycore_msgs::jointPO::ConstPtr &msg);
  virtual void callback_gestures(const upperbodycore_msgs::GestureDetect::ConstPtr &msg);
  virtual void callback_wave(const upperbodycore_msgs::wave_hand::ConstPtr &msg);
};
} // namespace
#endif // my_namespace_my_plugin_H
