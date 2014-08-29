#include "ros/ros.h"
#include <fstream>
#include <boost/thread.hpp>
#include "upperbodycore_msgs/recordSrv.h"
#include "RecordAndPlay_motors.h"

RecordAndPlay_motors *record_motor_client;
bool check_record_request(upperbodycore_msgs::recordSrv::Request  &req, upperbodycore_msgs::recordSrv::Response &res);

int main(int argc, char **argv)
{
  ros::init(argc, argv, "recorde_motor_core");
  ros::Rate loop_rate(20);
  ros::NodeHandle n_service;
  ros::ServiceServer service_record_motor = n_service.advertiseService("pgitic_record_motor_file", check_record_request);
  record_motor_client = new RecordAndPlay_motors();
  ros::spin();
  return 0;    
} 


bool check_record_request(upperbodycore_msgs::recordSrv::Request  &req, upperbodycore_msgs::recordSrv::Response &res)
 {
    if (req.command == "record_start")
    {
        record_motor_client->record_start(req.path);
    }
    else if(req.command == "record_stop")
    {
        record_motor_client->record_stop();
    }
    else if(req.command == "play")
    {
    	record_motor_client->play(req.path);
    }
    else if(req.command == "pause")
    {
    	record_motor_client->pause();
    }
    else if(req.command == "stop")
    {
    	record_motor_client->stop();
    }
    else if(req.command == "resume")
    {
    	record_motor_client->resume();
    }
          return true;
 }

