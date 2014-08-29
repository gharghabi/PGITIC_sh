#include "upperbodyclient.h"

void upperbodyclient::init()
{
    chatter_pub_motor_right[0] = node_handles[0].advertise<upperbodycore_msgs::motor>("upperbodycorein_right_shoulder_yaw", 10);
    chatter_pub_motor_right[1] = node_handles[1].advertise<upperbodycore_msgs::motor>("upperbodycorein_right_shoulder_pitch", 10);
    chatter_pub_motor_right[2] = node_handles[2].advertise<upperbodycore_msgs::motor>("upperbodycorein_right_shoulder_roll", 10);
    chatter_pub_motor_right[3] = node_handles[3].advertise<upperbodycore_msgs::motor>("upperbodycorein_right_elbow_pitch", 10);
    chatter_pub_motor_right[4] = node_handles[4].advertise<upperbodycore_msgs::motor>("upperbodycorein_right_elbow_roll", 10);
    chatter_pub_motor_right[5] = node_handles[5].advertise<upperbodycore_msgs::motor>("upperbodycorein_right_wrist_pitch", 10);
    chatter_pub_motor_right[6] = node_handles[6].advertise<upperbodycore_msgs::motor>("upperbodycorein_right_wrist_roll", 10);
    chatter_pub_motor_right[7] = node_handles[7].advertise<upperbodycore_msgs::motor>("upperbodycorein_right_gripper", 10);

    chatter_pub_motor_left[0] = node_handles[8].advertise<upperbodycore_msgs::motor>("upperbodycorein_left_shoulder_yaw", 10);
    chatter_pub_motor_left[1] = node_handles[9].advertise<upperbodycore_msgs::motor>("upperbodycorein_left_shoulder_pitch", 10);
    chatter_pub_motor_left[2] = node_handles[10].advertise<upperbodycore_msgs::motor>("upperbodycorein_left_shoulder_roll", 10);
    chatter_pub_motor_left[3] = node_handles[11].advertise<upperbodycore_msgs::motor>("upperbodycorein_left_elbow_pitch", 10);
    chatter_pub_motor_left[4] = node_handles[12].advertise<upperbodycore_msgs::motor>("upperbodycorein_left_elbow_roll", 10);
    chatter_pub_motor_left[5] = node_handles[13].advertise<upperbodycore_msgs::motor>("upperbodycorein_left_wrist_pitch", 10);
    chatter_pub_motor_left[6] = node_handles[14].advertise<upperbodycore_msgs::motor>("upperbodycorein_left_wrist_roll", 10);
    chatter_pub_motor_left[7] = node_handles[15].advertise<upperbodycore_msgs::motor>("upperbodycorein_left_gripper", 10);

    chatter_pub_motor_head[0] = node_handles[16].advertise<upperbodycore_msgs::motor>("upperbodycorein_head_yaw", 10);
    chatter_pub_motor_head[1] = node_handles[17].advertise<upperbodycore_msgs::motor>("upperbodycorein_head_pitch", 10);

    chatter_pub_allmotors_right = node_handles[18].advertise<upperbodycore_msgs::upperbodymotors>("/upperbodycorein_right_motors", 10);
    chatter_pub_allmotors_left = node_handles[19].advertise<upperbodycore_msgs::upperbodymotors>("/upperbodycorein_left_motors", 10);
    chatter_pub_allmotors_head = node_handles[20].advertise<upperbodycore_msgs::upperbodymotors>("/upperbodycorein_head_motors", 10);

    service_reset_motor = node_handles[21].serviceClient<upperbodycore_msgs::motorreset>("upperbodycorein_resetmotor");
    sub_motors = node_handles[22].subscribe("/upperbodycoreout_feedback", 1, &upperbodyclient::callback_motors,this);
}

void upperbodyclient::callback_motors(const upperbodycore_msgs::upperbodymotorsfeedback::ConstPtr &msg)
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
          rightArmMotors.push_back(motor);
        }
    }

    for ( int i = 0 ; i < msg->motorfeedbacks.size() ; i++ )
    {
            rightArmMotors.at(i).speed = msg->motorfeedbacks[i].speed;
            rightArmMotors.at(i).position = msg->motorfeedbacks[i].position;
            rightArmMotors.at(i).load = msg->motorfeedbacks[i].load;
            rightArmMotors.at(i).voltage = msg->motorfeedbacks[i].voltage;
            rightArmMotors.at(i).id = msg->motorfeedbacks[i].id;
            rightArmMotors.at(i).temp = msg->motorfeedbacks[i].temp;
            rightArmMotors.at(i).name = msg->motorfeedbacks[i].name;
            rightArmMotors.at(i).status = msg->motorfeedbacks[i].status;
            rightArmMotors.at(i).min = msg->motorfeedbacks[i].min;
            rightArmMotors.at(i).max = msg->motorfeedbacks[i].max;
            rightArmMotors.at(i).init = msg->motorfeedbacks[i].init;
    }

    motor_init = true;
}

void upperbodyclient::setMotor_rightShoulderYaw(int position,int speed)
{
	upperbodycore_msgs::motor msg;
	msg.position = position;
	msg.speed = speed;
    chatter_pub_motor_right[0].publish(msg);
}

void upperbodyclient::setMotor_rightShoulderPitch(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_right[1].publish(msg);
 }

void upperbodyclient::setMotor_rightShoulderRoll(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_right[2].publish(msg);
 }

void upperbodyclient::setMotor_rightElbowPitch(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_right[3].publish(msg);
 }

void upperbodyclient::setMotor_rightElbowRoll(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_right[4].publish(msg);
 }

void upperbodyclient::setMotor_rightWristPitch(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_right[5].publish(msg);
 }

void upperbodyclient::setMotor_rightWristRoll(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_right[6].publish(msg);
 }

void upperbodyclient::setMotor_rightGripper(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_right[7].publish(msg);
 }

void upperbodyclient::setMotors_rightArm(int positions[8], int speeds[8])
 {
     upperbodycore_msgs::upperbodymotors motor_msg;

     motor_msg.shoulder_yawm_position = positions[0];
     motor_msg.shoulder_pitchm_position = positions[1];
     motor_msg.shoulder_roll_position = positions[2];
     motor_msg.elbow_pitch_position = positions[3];
     motor_msg.elbow_roll_position = positions[4];
     motor_msg.wrist_pitch_position = positions[5];
     motor_msg.wrist_roll_position = positions[6];
     motor_msg.gripper_position = positions[7];

     motor_msg.shoulder_yawm_speed = speeds[0];
     motor_msg.shoulder_pitchm_speed = speeds[1];
     motor_msg.shoulder_roll_speed = speeds[2];
     motor_msg.elbow_pitch_speed = speeds[3];
     motor_msg.elbow_roll_speed = speeds[4];
     motor_msg.wrist_pitch_speed = speeds[5];
     motor_msg.wrist_roll_speed = speeds[6];
     motor_msg.gripper_speed = speeds[7];

     chatter_pub_allmotors_right.publish(motor_msg);
 }

void upperbodyclient::resetMotor_rightShoulderYaw()
{
   reset.request.id = "rightShoulderYaw";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_rightShoulderPitch()
{
   reset.request.id = "rightShoulderPitch";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_rightShoulderRoll()
{
   reset.request.id = "rightShoulderRoll";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_rightElbowPitch()
{
   reset.request.id = "rightElbowPitch";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_rightElbowRoll()
{
   reset.request.id = "rightElbowRoll";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_rightWristPitch()
{
   reset.request.id = "rightWristPitch";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_rightWristRoll()
{
   reset.request.id = "rightWristRoll";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_rightGripper()
{
   reset.request.id = "rightGripper";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_rightArm()
{
   reset.request.id = "rightArm";
   service_reset_motor.call(reset);
}

//=====================================

void upperbodyclient::setMotor_leftShoulderYaw(int position,int speed)
{
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_left[0].publish(msg);
}

void upperbodyclient::setMotor_leftShoulderPitch(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_left[1].publish(msg);
 }

void upperbodyclient::setMotor_leftShoulderRoll(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_left[2].publish(msg);
 }

void upperbodyclient::setMotor_leftElbowPitch(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_left[3].publish(msg);
 }

void upperbodyclient::setMotor_leftElbowRoll(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_left[4].publish(msg);
 }

void upperbodyclient::setMotor_leftWristPitch(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_left[5].publish(msg);
 }

void upperbodyclient::setMotor_leftWristRoll(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_left[6].publish(msg);
 }

void upperbodyclient::setMotor_leftGripper(int position,int speed)
 {
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_left[7].publish(msg);
 }

void upperbodyclient::setMotors_leftArm(int positions[8], int speeds[8])
 {
     upperbodycore_msgs::upperbodymotors motor_msg;

     motor_msg.shoulder_yawm_position = positions[0];
     motor_msg.shoulder_pitchm_position = positions[1];
     motor_msg.shoulder_roll_position = positions[2];
     motor_msg.elbow_pitch_position = positions[3];
     motor_msg.elbow_roll_position = positions[4];
     motor_msg.wrist_pitch_position = positions[5];
     motor_msg.wrist_roll_position = positions[6];
     motor_msg.gripper_position = positions[7];

     motor_msg.shoulder_yawm_speed = speeds[0];
     motor_msg.shoulder_pitchm_speed = speeds[1];
     motor_msg.shoulder_roll_speed = speeds[2];
     motor_msg.elbow_pitch_speed = speeds[3];
     motor_msg.elbow_roll_speed = speeds[4];
     motor_msg.wrist_pitch_speed = speeds[5];
     motor_msg.wrist_roll_speed = speeds[6];
     motor_msg.gripper_speed = speeds[7];

     chatter_pub_allmotors_left.publish(motor_msg);
 }

void upperbodyclient::resetMotor_leftShoulderYaw()
{
   reset.request.id = "leftShoulderYaw";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_leftShoulderPitch()
{
   reset.request.id = "leftShoulderPitch";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_leftShoulderRoll()
{
   reset.request.id = "leftShoulderRoll";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_leftElbowPitch()
{
   reset.request.id = "leftElbowPitch";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_leftElbowRoll()
{
   reset.request.id = "leftElbowRoll";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_leftWristPitch()
{
   reset.request.id = "leftWristPitch";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_leftWristRoll()
{
   reset.request.id = "leftWristRoll";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_leftGripper()
{
   reset.request.id = "leftGripper";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_leftArm()
{
   reset.request.id = "leftArm";
   service_reset_motor.call(reset);
}

//==================================
void upperbodyclient::setMotor_headYaw(int position,int speed)
{
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_head[0].publish(msg);
}

void upperbodyclient::setMotor_headPitch(int position,int speed)
{
    upperbodycore_msgs::motor msg;
    msg.position = position;
    msg.speed = speed;
    chatter_pub_motor_head[1].publish(msg);
}

void upperbodyclient::setMotors_head(int positions[2], int speeds[2])
{
     upperbodycore_msgs::upperbodymotors motor_msg;

     motor_msg.head_yaw_position = positions[0];
     motor_msg.head_pitch_position = positions[1];

     motor_msg.head_yaw_speed = speeds[0];
     motor_msg.head_pitch_speed = speeds[1];

     chatter_pub_allmotors_head.publish(motor_msg);
}

void upperbodyclient::resetMotor_headYaw()
{
   reset.request.id = "headYaw";
   service_reset_motor.call(reset);
}

void upperbodyclient::resetMotor_headPitch()
{
   reset.request.id = "headPitch";
   service_reset_motor.call(reset);
}
