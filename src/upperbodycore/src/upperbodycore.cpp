#include "ros/ros.h"
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <math.h>
#include <sstream>
#include <string>
#include <iostream>
#include <cstdio>
#include <unistd.h>
#include <cmath>
#include <stdio.h>
#include <stdlib.h>
#include <tbb/atomic.h>

#include "serial/serial.h"
#include "std_msgs/Int32.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"
#include "geometry_msgs/Twist.h"
#include <sensor_msgs/LaserScan.h>

#include <dynamixel_msgs/MotorStateList.h>
#include <dynamixel_msgs/JointState.h>

#include <dynamixel_controllers/SetComplianceSlope.h>
#include <dynamixel_controllers/SetCompliancePunch.h>
#include <dynamixel_controllers/SetSpeed.h>
#include <dynamixel_controllers/TorqueEnable.h>

#include <boost/thread.hpp>
#include <boost/algorithm/string.hpp>
#include <boost/lexical_cast.hpp>

#include <upperbodycore_msgs/upperbodymotors.h>
#include <upperbodycore_msgs/upperbodymotorsfeedback.h>
#include <upperbodycore_msgs/motorfeedback.h>
#include <upperbodycore_msgs/motor.h>

#include <upperbodycore_msgs/motorreset.h>
#include <upperbodycore_msgs/motortorque.h>
#include "upperbodycorefunctions.h"

using namespace std;
using namespace boost;

bool robot_init = false;
int init_counter = 0;
bool motor_init = false;
bool enable_debug = true;
bool App_exit = false;

ros::Publisher chatter_pub_motor_right[10];
ros::Publisher chatter_pub_motor_left[10];
ros::Publisher chatter_pub_motor_head[10];

ros::Publisher chatter_pub_motors;
ros::ServiceClient service_speed_motor_right[10];
ros::ServiceClient service_speed_motor_left[10];
ros::ServiceClient service_speed_motor_head[2];

ros::ServiceClient service_torque_motor_right[10];
ros::ServiceClient service_torque_motor_left[10];
ros::ServiceClient service_torque_motor_head[2];

ros::ServiceServer service_reset_motor;
ros::ServiceServer service_torque_motor;

void init_motors()
{
    //Init Motors

    for ( int i = 0 ; i < 10 ; i++ )
    {
        g_Motor_right[i] =  motorconfig_list.at(i).init;
        sp_Motor_right[i] = motorconfig_list.at(i).speed;
    }

    for ( int i = 0 ; i < 10 ; i++ )
    {
        g_Motor_left[i] =  motorconfig_list.at(i + 10).init;
        sp_Motor_left[i] = motorconfig_list.at(i + 10).speed;
    }

    for ( int i = 0 ; i < 2 ; i++ )
    {
        g_Motor_head[i] =  motorconfig_list.at(i + 20).init;
        sp_Motor_head[i] = motorconfig_list.at(i + 20).speed;
    }

    //------------------------------------------------------------------------------------
    //Add motors list [22 motors] [empty field] [we should wait for real motors to fill this list]

    for ( int i = 0 ; i < motorconfig_list.size() ; i++ )
    {
        motor_data motor;
        motor.speed = -1;
        motor.position = -1;
        motor.load = -1;
        motor.voltage = -1;
        motor.id = motorconfig_list.at(i).id;
        motor.temp = -1;
        motor.name = motorconfig_list.at(i).name;
        motor.status = "not found";
        motor.min = motorconfig_list.at(i).min;
        motor.max = motorconfig_list.at(i).max;
        motor.init = motorconfig_list.at(i).init;
        motor_list.push_back(motor);
    }
}

void init_config()
{
    ros::NodeHandle node;
    motor_config motorconfig;
    //Right Motors
    //0
    node.getParam("/rightshoulderYawm_controller/motor/id",motorconfig.id);
    node.getParam("/rightshoulderYawm_controller/joint_name",motorconfig.name);
    node.getParam("/rightshoulderYawm_controller/motor/init",motorconfig.init);
    node.getParam("/rightshoulderYawm_controller/motor/max",motorconfig.max);
    node.getParam("/rightshoulderYawm_controller/motor/min",motorconfig.min);
    node.getParam("/rightshoulderYawm_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //1
    node.getParam("/rightshoulderYaws_controller/motor/id",motorconfig.id);     motorconfig.id = 112;
    node.getParam("/rightshoulderYaws_controller/joint_name",motorconfig.name); motorconfig.name = "slave";
    node.getParam("/rightshoulderYaws_controller/motor/init",motorconfig.init);
    node.getParam("/rightshoulderYaws_controller/motor/max",motorconfig.max);
    node.getParam("/rightshoulderYaws_controller/motor/min",motorconfig.min);
    node.getParam("/rightshoulderYaws_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //2
    node.getParam("/rightshoulderPitchm_controller/motor/id",motorconfig.id);
    node.getParam("/rightshoulderPitchm_controller/joint_name",motorconfig.name);
    node.getParam("/rightshoulderPitchm_controller/motor/init",motorconfig.init);
    node.getParam("/rightshoulderPitchm_controller/motor/max",motorconfig.max);
    node.getParam("/rightshoulderPitchm_controller/motor/min",motorconfig.min);
    node.getParam("/rightshoulderPitchm_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //3
    node.getParam("/rightshoulderPitchs_controller/motor/id",motorconfig.id);     motorconfig.id = 114;
    node.getParam("/rightshoulderPitchs_controller/joint_name",motorconfig.name); motorconfig.name = "slave";
    node.getParam("/rightshoulderPitchs_controller/motor/init",motorconfig.init);
    node.getParam("/rightshoulderPitchs_controller/motor/max",motorconfig.max);
    node.getParam("/rightshoulderPitchs_controller/motor/min",motorconfig.min);
    node.getParam("/rightshoulderPitchs_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //4
    node.getParam("/rightshoulderRoll_controller/motor/id",motorconfig.id);
    node.getParam("/rightshoulderRoll_controller/joint_name",motorconfig.name);
    node.getParam("/rightshoulderRoll_controller/motor/init",motorconfig.init);
    node.getParam("/rightshoulderRoll_controller/motor/max",motorconfig.max);
    node.getParam("/rightshoulderRoll_controller/motor/min",motorconfig.min);
    node.getParam("/rightshoulderRoll_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //5
    node.getParam("/rightelbowPitch_controller/motor/id",motorconfig.id);
    node.getParam("/rightelbowPitch_controller/joint_name",motorconfig.name);
    node.getParam("/rightelbowPitch_controller/motor/init",motorconfig.init);
    node.getParam("/rightelbowPitch_controller/motor/max",motorconfig.max);
    node.getParam("/rightelbowPitch_controller/motor/min",motorconfig.min);
    node.getParam("/rightelbowPitch_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //6
    node.getParam("/rightelbowRoll_controller/motor/id",motorconfig.id);
    node.getParam("/rightelbowRoll_controller/joint_name",motorconfig.name);
    node.getParam("/rightelbowRoll_controller/motor/init",motorconfig.init);
    node.getParam("/rightelbowRoll_controller/motor/max",motorconfig.max);
    node.getParam("/rightelbowRoll_controller/motor/min",motorconfig.min);
    node.getParam("/rightelbowRoll_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //7
    node.getParam("/rightwristPitch_controller/motor/id",motorconfig.id);
    node.getParam("/rightwristPitch_controller/joint_name",motorconfig.name);
    node.getParam("/rightwristPitch_controller/motor/init",motorconfig.init);
    node.getParam("/rightwristPitch_controller/motor/max",motorconfig.max);
    node.getParam("rightwristPitch_controller/motor/min",motorconfig.min);
    node.getParam("rightwristPitch_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //8
    node.getParam("/rightwristRoll_controller/motor/id",motorconfig.id);
    node.getParam("/rightwristRoll_controller/joint_name",motorconfig.name);
    node.getParam("/rightwristRoll_controller/motor/init",motorconfig.init);
    node.getParam("/rightwristRoll_controller/motor/max",motorconfig.max);
    node.getParam("/rightwristRoll_controller/motor/min",motorconfig.min);
    node.getParam("/rightwristRoll_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //9
    node.getParam("/rightgripper_controller/motor/id",motorconfig.id);
    node.getParam("/rightgripper_controller/joint_name",motorconfig.name);
    node.getParam("/rightgripper_controller/motor/init",motorconfig.init);
    node.getParam("/rightgripper_controller/motor/max",motorconfig.max);
    node.getParam("/rightgripper_controller/motor/min",motorconfig.min);
    node.getParam("/rightgripper_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //---------------------------------------------------------------------------
    //Left Motors
    //0
    node.getParam("/leftshoulderYawm_controller/motor/id",motorconfig.id);
    node.getParam("/leftshoulderYawm_controller/joint_name",motorconfig.name);
    node.getParam("/leftshoulderYawm_controller/motor/init",motorconfig.init);
    node.getParam("/leftshoulderYawm_controller/motor/max",motorconfig.max);
    node.getParam("/leftshoulderYawm_controller/motor/min",motorconfig.min);
    node.getParam("/leftshoulderYawm_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //1
    node.getParam("/leftshoulderYaws_controller/motor/id",motorconfig.id);motorconfig.id = 102;
    node.getParam("/leftshoulderYaws_controller/joint_name",motorconfig.name);motorconfig.name = "slave";
    node.getParam("/leftshoulderYaws_controller/motor/init",motorconfig.init);
    node.getParam("/leftshoulderYaws_controller/motor/max",motorconfig.max);
    node.getParam("/leftshoulderYaws_controller/motor/min",motorconfig.min);
    node.getParam("/leftshoulderYaws_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //2
    node.getParam("/leftshoulderPitchm_controller/motor/id",motorconfig.id);
    node.getParam("/leftshoulderPitchm_controller/joint_name",motorconfig.name);
    node.getParam("/leftshoulderPitchm_controller/motor/init",motorconfig.init);
    node.getParam("/leftshoulderPitchm_controller/motor/max",motorconfig.max);
    node.getParam("/leftshoulderPitchm_controller/motor/min",motorconfig.min);
    node.getParam("/leftshoulderPitchm_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //3
    node.getParam("/leftshoulderPitchs_controller/motor/id",motorconfig.id);motorconfig.id = 104;
    node.getParam("/leftshoulderPitchs_controller/joint_name",motorconfig.name);motorconfig.name = "slave";
    node.getParam("/leftshoulderPitchs_controller/motor/init",motorconfig.init);
    node.getParam("/leftshoulderPitchs_controller/motor/max",motorconfig.max);
    node.getParam("/leftshoulderPitchs_controller/motor/min",motorconfig.min);
    node.getParam("/leftshoulderPitchs_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //4
    node.getParam("/leftshoulderRoll_controller/motor/id",motorconfig.id);
    node.getParam("/leftshoulderRoll_controller/joint_name",motorconfig.name);
    node.getParam("/leftshoulderRoll_controller/motor/init",motorconfig.init);
    node.getParam("/leftshoulderRoll_controller/motor/max",motorconfig.max);
    node.getParam("/leftshoulderRoll_controller/motor/min",motorconfig.min);
    node.getParam("/leftshoulderRoll_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //5
    node.getParam("/leftelbowPitch_controller/motor/id",motorconfig.id);
    node.getParam("/leftelbowPitch_controller/joint_name",motorconfig.name);
    node.getParam("/leftelbowPitch_controller/motor/init",motorconfig.init);
    node.getParam("/leftelbowPitch_controller/motor/max",motorconfig.max);
    node.getParam("/leftelbowPitch_controller/motor/min",motorconfig.min);
    node.getParam("/leftelbowPitch_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //6
    node.getParam("/leftelbowRoll_controller/motor/id",motorconfig.id);
    node.getParam("/leftelbowRoll_controller/joint_name",motorconfig.name);
    node.getParam("/leftelbowRoll_controller/motor/init",motorconfig.init);
    node.getParam("/leftelbowRoll_controller/motor/max",motorconfig.max);
    node.getParam("/leftelbowRoll_controller/motor/min",motorconfig.min);
    node.getParam("/leftelbowRoll_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //7
    node.getParam("/leftwristPitch_controller/motor/id",motorconfig.id);
    node.getParam("/leftwristPitch_controller/joint_name",motorconfig.name);
    node.getParam("/leftwristPitch_controller/motor/init",motorconfig.init);
    node.getParam("/leftwristPitch_controller/motor/max",motorconfig.max);
    node.getParam("leftwristPitch_controller/motor/min",motorconfig.min);
    node.getParam("leftwristPitch_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //8
    node.getParam("/leftwristRoll_controller/motor/id",motorconfig.id);
    node.getParam("/leftwristRoll_controller/joint_name",motorconfig.name);
    node.getParam("/leftwristRoll_controller/motor/init",motorconfig.init);
    node.getParam("/leftwristRoll_controller/motor/max",motorconfig.max);
    node.getParam("/leftwristRoll_controller/motor/min",motorconfig.min);
    node.getParam("/leftwristRoll_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //9
    node.getParam("/leftgripper_controller/motor/id",motorconfig.id);
    node.getParam("/leftgripper_controller/joint_name",motorconfig.name);
    node.getParam("/leftgripper_controller/motor/init",motorconfig.init);
    node.getParam("/leftgripper_controller/motor/max",motorconfig.max);
    node.getParam("/leftgripper_controller/motor/min",motorconfig.min);
    node.getParam("/leftgripper_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //-----------------------------------------------------------------------------
    //Head Motors
    //0
    node.getParam("/headYaw_controller/motor/id",motorconfig.id);
    node.getParam("/headYaw_controller/joint_name",motorconfig.name);
    node.getParam("/headYaw_controller/motor/init",motorconfig.init);
    node.getParam("/headYaw_controller/motor/max",motorconfig.max);
    node.getParam("/headYaw_controller/motor/min",motorconfig.min);
    node.getParam("/headYaw_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //1
    node.getParam("/headPitch_controller/motor/id",motorconfig.id);
    node.getParam("/headPitch_controller/joint_name",motorconfig.name);
    node.getParam("/headPitch_controller/motor/init",motorconfig.init);
    node.getParam("/headPitch_controller/motor/max",motorconfig.max);
    node.getParam("/headPitch_controller/motor/min",motorconfig.min);
    node.getParam("/headPitch_controller/joint_speed",motorconfig.speed);
    motorconfig.speed *= 10;
    motorconfig_list.push_back(motorconfig);
    //----------------------------------------------------------------------------------
    init_motors();

}

motor_config get_motorconfig(int id)
{
    motor_config empty;
    empty.name = "none";
    empty.init = -1;
    empty.max = -1;
    empty.min = -1;
    empty.id = -1;

    for ( int i = 0 ; i < motorconfig_list.size() ; i++ )
    {
        if ( motorconfig_list.at(i).id == id )
            return motorconfig_list.at(i);
    }

    return empty;
}

motor_config get_motorconfig(string name)
{
    motor_config empty;
    empty.name = "none";
    empty.init = -1;
    empty.max = -1;
    empty.min = -1;
    empty.id = -1;

    for ( int i = 0 ; i < motorconfig_list.size() ; i++ )
    {
        if ( motorconfig_list.at(i).name == name )
            return motorconfig_list.at(i);
    }

    return empty;
}

int getindex_byid(int id)
{
    for ( int i = 0 ; i < motor_list.size() ; i++ )
    {
        if ( motor_list.at(i).id == id)
            return i;
    }

    return -1;
}

void chatterCallbackw(const dynamixel_msgs::MotorStateList::ConstPtr &msg)
{

    for ( int i = 0 ; i < msg->motor_states.size() ; i++ )
    {
        int get_id = msg->motor_states[i].id;
        int index = getindex_byid(get_id);
        if ( index == -1 ) continue;

        motor_list.at(index).speed = msg->motor_states[i].speed;
        motor_list.at(index).position = msg->motor_states[i].position;
        motor_list.at(index).load = msg->motor_states[i].load * 1000;
        motor_list.at(index).voltage = msg->motor_states[i].voltage;
        motor_list.at(index).id = msg->motor_states[i].id;
        motor_list.at(index).temp = msg->motor_states[i].temperature;
        motor_list.at(index).status = "ready";

    }

    //============================ output with same Hz

    upperbodycore_msgs::upperbodymotorsfeedback feedback_list;

    //TODO1 check for name and index
    for ( int i = 0 ; i < motor_list.size() ; i++)
    {
        upperbodycore_msgs::motorfeedback feedback;
        feedback.id = motor_list.at(i).id;
        feedback.load = motor_list.at(i).load;
        feedback.speed = motor_list.at(i).speed;
        feedback.position = motor_list.at(i).position;
        feedback.voltage = motor_list.at(i).voltage;
        feedback.temp = motor_list.at(i).temp;
        feedback.name = motor_list.at(i).name;
        feedback.status = motor_list.at(i).status;
        feedback.min = motor_list.at(i).min;
        feedback.max = motor_list.at(i).max;
        feedback.init = motor_list.at(i).init;

        feedback_list.motorfeedbacks.push_back(feedback);
    }

    chatter_pub_motors.publish(feedback_list);
}

void chatterCallback_right_motors(const upperbodycore_msgs::upperbodymotors::ConstPtr &msg)
{
    if ( enable_debug )
    {
        //        cout<<"get motors right"<<endl;

        //        cout<<msg->shoulder_yawm_position<<endl;
        //        cout<<msg->shoulder_pitchm_position<<endl;
        //        cout<<msg->shoulder_roll_position<<endl;
        //        cout<<msg->elbow_pitch_position<<endl;
        //        cout<<msg->elbow_roll_position<<endl;
        //        cout<<msg->wrist_pitch_position<<endl;
        //        cout<<msg->wrist_roll_position<<endl;
        //        cout<<msg->gripper_position<<endl;
        //        cout<<"==========================================="<<endl;
    }


    g_Motor_right[0] = msg->shoulder_yawm_position;     //right_shoulder_base1 ?
    g_Motor_right[1] = 0;     //right_shoulder_base2 ?

    g_Motor_right[2] = msg->shoulder_pitchm_position; //right_shoulder_pitchm 113
    g_Motor_right[3] = 0;    //right_shoulder_pitchs 114
    g_Motor_right[4] = msg->shoulder_roll_position; //right_shoulder_roll 115
    g_Motor_right[5] = msg->elbow_pitch_position; //right_elbow_pitch 116

    g_Motor_right[6] = msg->elbow_roll_position;  //right_elbow_roll 117
    g_Motor_right[7] = msg->wrist_pitch_position;  //right_wrist_pitch 118
    g_Motor_right[8] = msg->wrist_roll_position;  //right_wrist_roll 119
    g_Motor_right[9] = msg->gripper_position;  //gripper 120

    //==============================================

    sp_Motor_right[0] = msg->shoulder_yawm_speed;     //right_shoulder_base1 ?
    sp_Motor_right[1] = 0;     //right_shoulder_base2 ?

    sp_Motor_right[2] = msg->shoulder_pitchm_speed; //right_shoulder_pitchm 113
    sp_Motor_right[3] = 0; //right_shoulder_pitchs 114
    sp_Motor_right[4] = msg->shoulder_roll_speed; //right_shoulder_roll 115
    sp_Motor_right[5] = msg->elbow_pitch_speed; //right_elbow_pitch 116

    sp_Motor_right[6] = msg->elbow_roll_speed;  //right_elbow_roll 117
    sp_Motor_right[7] = msg->wrist_pitch_speed;  //right_wrist_pitch 118
    sp_Motor_right[8] = msg->wrist_roll_speed;  //right_wrist_roll 119
    sp_Motor_right[9] = msg->gripper_speed;  //gripper 120
}

void chatterCallback_left_motors(const upperbodycore_msgs::upperbodymotors::ConstPtr &msg)
{
    //    if ( enable_debug )
    //    {
    //        cout<<"get motors left"<<endl;

    //        cout<<msg->shoulder_yawm_position<<endl;
    //        cout<<msg->shoulder_pitchm_position<<endl;
    //        cout<<msg->shoulder_roll_position<<endl;
    //        cout<<msg->elbow_pitch_position<<endl;
    //        cout<<msg->elbow_roll_position<<endl;
    //        cout<<msg->wrist_pitch_position<<endl;
    //        cout<<msg->wrist_roll_position<<endl;
    //        cout<<msg->gripper_position<<endl;
    //    }
    //    cout<<"==========================================="<<endl;

    g_Motor_left[0] = msg->shoulder_yawm_position;     //left_shoulder_base1 ?
    g_Motor_left[1] = 0;     //left_shoulder_base2 ?

    g_Motor_left[2] = msg->shoulder_pitchm_position; //left_shoulder_pitchm 113
    g_Motor_left[3] = 0;    //left_shoulder_pitchs 114
    g_Motor_left[4] = msg->shoulder_roll_position; //left_shoulder_roll 115
    g_Motor_left[5] = msg->elbow_pitch_position; //left_elbow_pitch 116

    g_Motor_left[6] = msg->elbow_roll_position;  //left_elbow_roll 117
    g_Motor_left[7] = msg->wrist_pitch_position;  //left_wrist_pitch 118
    g_Motor_left[8] = msg->wrist_roll_position;  //left_wrist_roll 119
    g_Motor_left[9] = msg->gripper_position;  //gripper 120

    //==============================================

    sp_Motor_left[0] = msg->shoulder_yawm_speed;     //left_shoulder_base1 ?
    sp_Motor_left[1] = 0;     //left_shoulder_base2 ?

    sp_Motor_left[2] = msg->shoulder_pitchm_speed; //left_shoulder_pitchm 113
    sp_Motor_left[3] = 0; //left_shoulder_pitchs 114
    sp_Motor_left[4] = msg->shoulder_roll_speed; //left_shoulder_roll 115
    sp_Motor_left[5] = msg->elbow_pitch_speed; //left_elbow_pitch 116

    sp_Motor_left[6] = msg->elbow_roll_speed;  //left_elbow_roll 117
    sp_Motor_left[7] = msg->wrist_pitch_speed;  //left_wrist_pitch 118
    sp_Motor_left[8] = msg->wrist_roll_speed;  //left_wrist_roll 119
    sp_Motor_left[9] = msg->gripper_speed;  //gripper 120
}

void chatterCallback_head_motors(const upperbodycore_msgs::upperbodymotors::ConstPtr &msg)
{
    //    if ( enable_debug )
    //    {
            // cout<<"get motors head"<<endl;
            // cout<<msg->head_yaw_position<<endl;
            // cout<<msg->head_pitch_position<<endl;
    //    }

   //cout<<"==========================================="<<endl;

    g_Motor_head[0] = msg->head_yaw_position;     //left_shoulder_base1 ?
    g_Motor_head[1] = msg->head_pitch_position;     //left_shoulder_base2 ?

    sp_Motor_head[0] = msg->head_yaw_speed;     //left_shoulder_base1 ?
    sp_Motor_head[1] = msg->head_pitch_speed;     //left_shoulder_base2 ?
}

void Motor_Update()
{
    //-------------------------------- wait for 20 updates
    //cout<<init_counter<<endl;

    if ( init_counter < 20)
        init_counter++;
    else
        robot_init = true;

    //-----------------------------------------------------
    //right motors update

    for (int i = 0; i < right_motor_count; i++)
    {
        if (  i != 1 && i != 3 ) //slaves were not include
        {
            if ( g_Motortemp_right[i] != g_Motor_right[i] && robot_init == true)
            {
                g_Motortemp_right[i] = g_Motor_right[i];

                std_msgs::Int32 msg;
                msg.data = g_Motor_right[i];

                chatter_pub_motor_right[i].publish(msg);

                //cout<<msg.data<<endl;
            }
        }
    }

    //left motors update

    for (int i = 0; i < left_motor_count; i++)
    {
        if (  i != 1 && i != 3 ) //slaves were not include
        {
            if ( g_Motortemp_left[i] != g_Motor_left[i] && robot_init == true)
            {
                g_Motortemp_left[i] = g_Motor_left[i];

                std_msgs::Int32 msg;
                msg.data = g_Motor_left[i];

                chatter_pub_motor_left[i].publish(msg);

                //cout<<msg.data<<endl;
            }
        }
    }

    //head motors update

    for (int i = 0; i < head_motor_count; i++)
    {
        if ( g_Motortemp_head[i] != g_Motor_head[i] && robot_init == true)
        {
            g_Motortemp_head[i] = g_Motor_head[i];

            std_msgs::Int32 msg;
            msg.data = g_Motor_head[i];

            chatter_pub_motor_head[i].publish(msg);
            //send
            //cout<<"send : "<<endl;
            //cout<<msg.data<<endl;
        }
    }
}

void Motor_Update_speed()
{
    for (int i = 0; i < right_motor_count; i++)
    {
        if ( i != 1 && i != 3 ) //slaves
        {
            if ( sp_Motortemp_right[i] != sp_Motor_right[i] && robot_init == true)
            {
                sp_Motortemp_right[i] = sp_Motor_right[i];

                float value = (float)sp_Motor_right[i] / 10;
                dynamixel_controllers::SetSpeed speed;
                speed.request.speed = value;

                service_speed_motor_right[i].call(speed);
            }
        }
    }

    for (int i = 0; i < left_motor_count; i++)
    {
        if ( i != 1 && i != 3 ) //slaves
        {
            if ( sp_Motortemp_left[i] != sp_Motor_left[i] && robot_init == true)
            {
                sp_Motortemp_left[i] = sp_Motor_left[i];

                float value = (float)sp_Motor_left[i] / 10;
                dynamixel_controllers::SetSpeed speed;
                speed.request.speed = value;

                service_speed_motor_left[i].call(speed);
            }
        }
    }

    for (int i = 0; i < head_motor_count; i++)
    {
        if ( i != 1 && i != 3 ) //slaves
        {
            if ( sp_Motortemp_head[i] != sp_Motor_head[i] && robot_init == true)
            {
                sp_Motortemp_head[i] = sp_Motor_head[i];

                float value = (float)sp_Motor_head[i] / 10;
                dynamixel_controllers::SetSpeed speed;
                speed.request.speed = value;

                service_speed_motor_head[i].call(speed);
            }
        }
    }
}

void torque_toggle(bool value)
{
    for ( int i = 0 ; i < right_motor_count ; i++ )
    {
        dynamixel_controllers::TorqueEnable t_srv;
        t_srv.request.torque_enable = value;
        service_torque_motor_right[i].call(t_srv);
    }

    for ( int i = 0 ; i < left_motor_count ; i++ )
    {
        dynamixel_controllers::TorqueEnable t_srv;
        t_srv.request.torque_enable = value;
        service_torque_motor_left[i].call(t_srv);
    }

    for ( int i = 0 ; i < head_motor_count ; i++ )
    {
        dynamixel_controllers::TorqueEnable t_srv;
        t_srv.request.torque_enable = value;
        service_torque_motor_head[i].call(t_srv);
    }
}

bool callback_resetmotor(upperbodycore_msgs::motorreset::Request& request, upperbodycore_msgs::motorreset::Response& response)
{
    cout<<"get reset request for "<<request.id<<endl;

    if ( request.id  == "rightShoulderYaw" ) reset_right_shoulder_yaw();
    if ( request.id  == "rightShoulderPitch" ) reset_right_shoulder_pitch();
    if ( request.id  == "rightShoulderRoll" ) reset_right_shoulder_roll();
    if ( request.id  == "rightElbowPitch" ) reset_right_elbow_pitch();
    if ( request.id  == "rightElbowRoll") reset_right_elbow_roll();
    if ( request.id  == "rightWristPitch" ) reset_right_wrist_pitch();
    if ( request.id  == "rightWristRoll") reset_right_wrist_roll();
    if ( request.id  == "rightGripper" ) reset_right_gripper();
    if ( request.id  == "rightArm") reset_right_arm();

    if ( request.id  == "leftShoulderYaw" ) reset_left_shoulder_yaw();
    if ( request.id  == "leftShoulderPitch" ) reset_left_shoulder_pitch();
    if ( request.id  == "leftShoulderRoll" ) reset_left_shoulder_roll();
    if ( request.id  == "leftElbowPitch" ) reset_left_elbow_pitch();
    if ( request.id  == "leftElbowRoll") reset_left_elbow_roll();
    if ( request.id  == "leftWristPitch" ) reset_left_wrist_pitch();
    if ( request.id  == "leftWristRoll") reset_left_wrist_roll();
    if ( request.id  == "leftGripper" ) reset_left_gripper();
    if ( request.id  == "leftArm") reset_left_arm();

    if ( request.id  == "headShoulderYaw" ) reset_head_yaw();
    if ( request.id  == "headShoulderPitch" ) reset_head_pitch();

    return true;
}

bool callback_torquemotor(upperbodycore_msgs::motortorque::Request& request, upperbodycore_msgs::motortorque::Response& response)
{
    int a = 0;
    if ( request.status == true) a = 1;
    cout<<"get torque request for "<<a<<endl;

    torque_toggle(request.status);

    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "upperbody_core");
    cout << "upperBody core started done..." << endl;

    init_config();

    ros::NodeHandle node_handles[100];
    ros::Subscriber sub_handles[50];
    
    //-----------------------------------------------------------------------------------------

    sub_handles[0] = node_handles[10].subscribe("/motor_states/dx_port", 10, chatterCallbackw);

    sub_handles[1] = node_handles[40].subscribe("upperbodycorein_right_motors", 10, chatterCallback_right_motors); //all right motors
    sub_handles[2] = node_handles[41].subscribe("upperbodycorein_left_motors", 10, chatterCallback_left_motors); //all left motors
    sub_handles[3] = node_handles[41].subscribe("upperbodycorein_head_motors", 10, chatterCallback_head_motors); //all head motors

    sub_handles[4] = node_handles[51].subscribe("upperbodycorein_right_shoulder_yaw", 10, chatterCallback_right_shoulder_yaw);
    sub_handles[5] = node_handles[52].subscribe("upperbodycorein_right_shoulder_pitch", 10, chatterCallback_right_shoulder_pitch);
    sub_handles[6] = node_handles[53].subscribe("upperbodycorein_right_shoulder_roll", 10, chatterCallback_right_shoulder_roll);
    sub_handles[7] = node_handles[54].subscribe("upperbodycorein_right_elbow_pitch", 10, chatterCallback_right_elbow_pitch);
    sub_handles[8] = node_handles[55].subscribe("upperbodycorein_right_elbow_roll", 10, chatterCallback_right_elbow_roll);
    sub_handles[9] = node_handles[56].subscribe("upperbodycorein_right_wrist_pitch", 10, chatterCallback_right_wrist_pitch);
    sub_handles[10] = node_handles[57].subscribe("upperbodycorein_right_wrist_roll", 10, chatterCallback_right_wrist_roll);
    sub_handles[11] = node_handles[58].subscribe("upperbodycorein_right_gripper", 10, chatterCallback_right_gripper);

    sub_handles[12] = node_handles[51].subscribe("upperbodycorein_left_shoulder_yaw", 10, chatterCallback_left_shoulder_yaw);
    sub_handles[13] = node_handles[52].subscribe("upperbodycorein_left_shoulder_pitch", 10, chatterCallback_left_shoulder_pitch);
    sub_handles[14] = node_handles[53].subscribe("upperbodycorein_left_shoulder_roll", 10, chatterCallback_left_shoulder_roll);
    sub_handles[15] = node_handles[54].subscribe("upperbodycorein_left_elbow_pitch", 10, chatterCallback_left_elbow_pitch);
    sub_handles[16] = node_handles[55].subscribe("upperbodycorein_left_elbow_roll", 10, chatterCallback_left_elbow_roll);
    sub_handles[17] = node_handles[56].subscribe("upperbodycorein_left_wrist_pitch", 10, chatterCallback_left_wrist_pitch);
    sub_handles[18] = node_handles[57].subscribe("upperbodycorein_left_wrist_roll", 10, chatterCallback_left_wrist_roll);
    sub_handles[19] = node_handles[58].subscribe("upperbodycorein_left_gripper", 10, chatterCallback_left_gripper);

    sub_handles[20] = node_handles[51].subscribe("upperbodycorein_head_yaw", 10, chatterCallback_head_yaw);
    sub_handles[21] = node_handles[52].subscribe("upperbodycorein_head_pitch", 10, chatterCallback_head_pitch);

    //=================================================================================================================

    chatter_pub_motors = node_handles[30].advertise<upperbodycore_msgs::upperbodymotorsfeedback>("/upperbodycoreout_feedback", 10);

    chatter_pub_motor_right[0] = node_handles[0].advertise<std_msgs::Int32>("/rightshoulderYawm_controller/command", 10);
    chatter_pub_motor_right[1] = node_handles[1].advertise<std_msgs::Int32>("/rightshoulderYaws_controller/command", 10);
    chatter_pub_motor_right[2] = node_handles[2].advertise<std_msgs::Int32>("/rightshoulderPitchm_controller/command", 10);
    chatter_pub_motor_right[3] = node_handles[3].advertise<std_msgs::Int32>("/rightshoulderPitchs_controller/command", 10);
    chatter_pub_motor_right[4] = node_handles[4].advertise<std_msgs::Int32>("/rightshoulderRoll_controller/command", 10);
    chatter_pub_motor_right[5] = node_handles[5].advertise<std_msgs::Int32>("/rightelbowPitch_controller/command", 10);
    chatter_pub_motor_right[6] = node_handles[6].advertise<std_msgs::Int32>("/rightelbowRoll_controller/command", 10);
    chatter_pub_motor_right[7] = node_handles[7].advertise<std_msgs::Int32>("/rightwristPitch_controller/command", 10);
    chatter_pub_motor_right[8] = node_handles[8].advertise<std_msgs::Int32>("/rightwristRoll_controller/command", 10);
    chatter_pub_motor_right[9] = node_handles[9].advertise<std_msgs::Int32>("/rightgripper_controller/command", 10);

    chatter_pub_motor_left[0] = node_handles[0].advertise<std_msgs::Int32>("/leftshoulderYawm_controller/command", 10);
    chatter_pub_motor_left[1] = node_handles[1].advertise<std_msgs::Int32>("/leftshoulderYaws_controller/command", 10);
    chatter_pub_motor_left[2] = node_handles[2].advertise<std_msgs::Int32>("/leftshoulderPitchm_controller/command", 10);
    chatter_pub_motor_left[3] = node_handles[3].advertise<std_msgs::Int32>("/leftshoulderPitchs_controller/command", 10);
    chatter_pub_motor_left[4] = node_handles[4].advertise<std_msgs::Int32>("/leftshoulderRoll_controller/command", 10);
    chatter_pub_motor_left[5] = node_handles[5].advertise<std_msgs::Int32>("/leftelbowPitch_controller/command", 10);
    chatter_pub_motor_left[6] = node_handles[6].advertise<std_msgs::Int32>("/leftelbowRoll_controller/command", 10);
    chatter_pub_motor_left[7] = node_handles[7].advertise<std_msgs::Int32>("/leftwristPitch_controller/command", 10);
    chatter_pub_motor_left[8] = node_handles[8].advertise<std_msgs::Int32>("/leftwristRoll_controller/command", 10);
    chatter_pub_motor_left[9] = node_handles[9].advertise<std_msgs::Int32>("/leftgripper_controller/command", 10);

    chatter_pub_motor_head[0] = node_handles[0].advertise<std_msgs::Int32>("/headYaw_controller/command", 10);
    chatter_pub_motor_head[1] = node_handles[1].advertise<std_msgs::Int32>("/headPitch_controller/command", 10);

    //========================================================================================================
    //speed service clients

    service_speed_motor_right[0] = node_handles[20].serviceClient<dynamixel_controllers::SetSpeed>("/rightshoulderYawm_controller/set_speed");
    service_speed_motor_right[1] = node_handles[21].serviceClient<dynamixel_controllers::SetSpeed>("/rightshoulderYaws_controller/set_speed");
    service_speed_motor_right[2] = node_handles[22].serviceClient<dynamixel_controllers::SetSpeed>("/rightshoulderPitchm_controller/set_speed");
    service_speed_motor_right[3] = node_handles[23].serviceClient<dynamixel_controllers::SetSpeed>("/rightshoulderPitchs_controller/set_speed");
    service_speed_motor_right[4] = node_handles[24].serviceClient<dynamixel_controllers::SetSpeed>("/rightshoulderRoll_controller/set_speed");
    service_speed_motor_right[5] = node_handles[25].serviceClient<dynamixel_controllers::SetSpeed>("/rightelbowPitch_controller/set_speed");
    service_speed_motor_right[6] = node_handles[26].serviceClient<dynamixel_controllers::SetSpeed>("/rightelbowRoll_controller/set_speed");
    service_speed_motor_right[7] = node_handles[27].serviceClient<dynamixel_controllers::SetSpeed>("/rightwristPitch_controller/set_speed");
    service_speed_motor_right[8] = node_handles[28].serviceClient<dynamixel_controllers::SetSpeed>("/rightwristRoll_controller/set_speed");
    service_speed_motor_right[9] = node_handles[29].serviceClient<dynamixel_controllers::SetSpeed>("/rightgripper_controller/set_speed");

    service_speed_motor_left[0] = node_handles[20].serviceClient<dynamixel_controllers::SetSpeed>("/leftshoulderYawm_controller/set_speed");
    service_speed_motor_left[1] = node_handles[21].serviceClient<dynamixel_controllers::SetSpeed>("/leftshoulderYaws_controller/set_speed");
    service_speed_motor_left[2] = node_handles[22].serviceClient<dynamixel_controllers::SetSpeed>("/leftshoulderPitchm_controller/set_speed");
    service_speed_motor_left[3] = node_handles[23].serviceClient<dynamixel_controllers::SetSpeed>("/leftshoulderPitchs_controller/set_speed");
    service_speed_motor_left[4] = node_handles[24].serviceClient<dynamixel_controllers::SetSpeed>("/leftshoulderRoll_controller/set_speed");
    service_speed_motor_left[5] = node_handles[25].serviceClient<dynamixel_controllers::SetSpeed>("/leftelbowPitch_controller/set_speed");
    service_speed_motor_left[6] = node_handles[26].serviceClient<dynamixel_controllers::SetSpeed>("/leftelbowRoll_controller/set_speed");
    service_speed_motor_left[7] = node_handles[27].serviceClient<dynamixel_controllers::SetSpeed>("/leftwristPitch_controller/set_speed");
    service_speed_motor_left[8] = node_handles[28].serviceClient<dynamixel_controllers::SetSpeed>("/leftwristRoll_controller/set_speed");
    service_speed_motor_left[9] = node_handles[29].serviceClient<dynamixel_controllers::SetSpeed>("/leftgripper_controller/set_speed");

    service_speed_motor_head[0] = node_handles[20].serviceClient<dynamixel_controllers::SetSpeed>("/headYaw_controller/set_speed");
    service_speed_motor_head[1] = node_handles[21].serviceClient<dynamixel_controllers::SetSpeed>("/headPitch_controller/set_speed");

    service_torque_motor_right[0] = node_handles[20].serviceClient<dynamixel_controllers::TorqueEnable>("/rightshoulderYawm_controller/torque_enable");
    service_torque_motor_right[1] = node_handles[21].serviceClient<dynamixel_controllers::TorqueEnable>("/rightshoulderYaws_controller/torque_enable");
    service_torque_motor_right[2] = node_handles[22].serviceClient<dynamixel_controllers::TorqueEnable>("/rightshoulderPitchm_controller/torque_enable");
    service_torque_motor_right[3] = node_handles[23].serviceClient<dynamixel_controllers::TorqueEnable>("/rightshoulderPitchs_controller/torque_enable");
    service_torque_motor_right[4] = node_handles[24].serviceClient<dynamixel_controllers::TorqueEnable>("/rightshoulderRoll_controller/torque_enable");
    service_torque_motor_right[5] = node_handles[25].serviceClient<dynamixel_controllers::TorqueEnable>("/rightelbowPitch_controller/torque_enable");
    service_torque_motor_right[6] = node_handles[26].serviceClient<dynamixel_controllers::TorqueEnable>("/rightelbowRoll_controller/torque_enable");
    service_torque_motor_right[7] = node_handles[27].serviceClient<dynamixel_controllers::TorqueEnable>("/rightwristPitch_controller/torque_enable");
    service_torque_motor_right[8] = node_handles[28].serviceClient<dynamixel_controllers::TorqueEnable>("/rightwristRoll_controller/torque_enable");
    service_torque_motor_right[9] = node_handles[29].serviceClient<dynamixel_controllers::TorqueEnable>("/rightgripper_controller/torque_enable");

    service_torque_motor_left[0] = node_handles[20].serviceClient<dynamixel_controllers::TorqueEnable>("/leftshoulderYawm_controller/torque_enable");
    service_torque_motor_left[1] = node_handles[21].serviceClient<dynamixel_controllers::TorqueEnable>("/leftshoulderYaws_controller/torque_enable");
    service_torque_motor_left[2] = node_handles[22].serviceClient<dynamixel_controllers::TorqueEnable>("/leftshoulderPitchm_controller/torque_enable");
    service_torque_motor_left[3] = node_handles[23].serviceClient<dynamixel_controllers::TorqueEnable>("/leftshoulderPitchs_controller/torque_enable");
    service_torque_motor_left[4] = node_handles[24].serviceClient<dynamixel_controllers::TorqueEnable>("/leftshoulderRoll_controller/torque_enable");
    service_torque_motor_left[5] = node_handles[25].serviceClient<dynamixel_controllers::TorqueEnable>("/leftelbowPitch_controller/torque_enable");
    service_torque_motor_left[6] = node_handles[26].serviceClient<dynamixel_controllers::TorqueEnable>("/leftelbowRoll_controller/torque_enable");
    service_torque_motor_left[7] = node_handles[27].serviceClient<dynamixel_controllers::TorqueEnable>("/leftwristPitch_controller/torque_enable");
    service_torque_motor_left[8] = node_handles[28].serviceClient<dynamixel_controllers::TorqueEnable>("/leftwristRoll_controller/torque_enable");
    service_torque_motor_left[9] = node_handles[29].serviceClient<dynamixel_controllers::TorqueEnable>("/leftgripper_controller/torque_enable");

    service_torque_motor_head[0] = node_handles[20].serviceClient<dynamixel_controllers::TorqueEnable>("/headYaw_controller/torque_enable");
    service_torque_motor_head[1] = node_handles[21].serviceClient<dynamixel_controllers::TorqueEnable>("/headPitch_controller/torque_enable");

    //==========================================================================================================

    service_reset_motor = node_handles[70].advertiseService("upperbodycorein_resetmotor", callback_resetmotor);
    service_torque_motor = node_handles[71].advertiseService("upperbodycorein_torquemotor", callback_torquemotor);

    //===========================================================================================================

    ros::Rate loop_rate(20); //20 Hz

    while (ros::ok() && App_exit == false)
    {
        Motor_Update();
        Motor_Update_speed();
        ros::spinOnce();
        loop_rate.sleep();
    }

    App_exit = true;
    return 0;
}
