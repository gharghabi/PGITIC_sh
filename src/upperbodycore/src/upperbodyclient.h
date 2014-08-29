
#include <ros/ros.h>
#include <stdio.h>
#include <stdlib.h>

#include <upperbodycore_msgs/upperbodymotors.h>
#include <upperbodycore_msgs/upperbodymotorsfeedback.h>
#include <upperbodycore_msgs/motorfeedback.h>
#include <upperbodycore_msgs/motor.h>
#include <upperbodycore_msgs/motorreset.h>

#include <boost/thread.hpp>
#include <boost/algorithm/string.hpp>
#include <boost/lexical_cast.hpp>

class upperbodyclient 
{

private:


    ros::NodeHandle node_handles[100];
    ros::Subscriber sub_handles[50];
    ros::Subscriber sub_motors;

    ros::Publisher  chatter_pub_motor_right[8];
    ros::Publisher  chatter_pub_motor_left[8];
    ros::Publisher  chatter_pub_motor_head[2];

    ros::Publisher chatter_pub_allmotors_right;
    ros::Publisher chatter_pub_allmotors_left;
    ros::Publisher chatter_pub_allmotors_head;

    ros::ServiceClient service_reset_motor;
    upperbodycore_msgs::motorreset reset;

    bool motor_init;
    void init();

public:

    struct motor_data
    {
      public :
        int speed;
        int position;
        float load;
        int voltage;
        int temp;
        int id;
        std::string name;
        std::string status;
        int max;
        int min;
        int init;

    };

std::vector<motor_data> rightArmMotors;

void setMotor_rightShoulderYaw(int position,int speed);
void setMotor_rightShoulderPitch(int position,int speed);
void setMotor_rightShoulderRoll(int position,int speed);
void setMotor_rightElbowPitch(int position,int speed);
void setMotor_rightElbowRoll(int position,int speed);
void setMotor_rightWristPitch(int position,int speed);
void setMotor_rightWristRoll(int position,int speed);
void setMotor_rightGripper(int position,int speed);

void resetMotor_rightShoulderYaw();
void resetMotor_rightShoulderPitch();
void resetMotor_rightShoulderRoll();
void resetMotor_rightElbowPitch();
void resetMotor_rightElbowRoll();
void resetMotor_rightWristPitch();
void resetMotor_rightWristRoll();
void resetMotor_rightGripper();
void resetMotor_rightArm();

void setMotor_leftShoulderYaw(int position,int speed);
void setMotor_leftShoulderPitch(int position,int speed);
void setMotor_leftShoulderRoll(int position,int speed);
void setMotor_leftElbowPitch(int position,int speed);
void setMotor_leftElbowRoll(int position,int speed);
void setMotor_leftWristPitch(int position,int speed);
void setMotor_leftWristRoll(int position,int speed);
void setMotor_leftGripper(int position,int speed);

void resetMotor_leftShoulderYaw();
void resetMotor_leftShoulderPitch();
void resetMotor_leftShoulderRoll();
void resetMotor_leftElbowPitch();
void resetMotor_leftElbowRoll();
void resetMotor_leftWristPitch();
void resetMotor_leftWristRoll();
void resetMotor_leftGripper();
void resetMotor_leftArm();

void setMotor_headYaw(int position,int speed);
void setMotor_headPitch(int position,int speed);

void resetMotor_headYaw();
void resetMotor_headPitch();

void setMotors_rightArm(int positions[8],int speeds[8]);
void setMotors_leftArm(int positions[8],int speeds[8]);
void setMotors_head(int positions[2],int speeds[2]);

void callback_motors(const upperbodycore_msgs::upperbodymotorsfeedback::ConstPtr &msg);

upperbodyclient()
{
    motor_init = false;
    init();
}

~upperbodyclient()
{

}

};
