#include <ros/ros.h>
#include <fstream>
#include <opencv2/imgproc/imgproc.hpp>
#include <boost/thread.hpp>
#include <upperbodycore_msgs/upperbodymotors.h>
#include <upperbodycore_msgs/upperbodymotorsfeedback.h>
#include "upperbodycore_msgs/recordSrv.h"

using namespace std; 

class RecordAndPlay_motors
{
	private:

		std::vector<int> motor_position;
		float tic,toc;

		ofstream motors_info;
		string filename;

		ifstream motors_file;

		bool resumeF,stopF,pauseF,playF,record_stopF,record_startF;
		upperbodycore_msgs::upperbodymotors right_hand_motors;
		ros::Publisher right_hand_pub;
		ros::NodeHandle nh_[2];
  		ros::NodeHandle n_motors,n_service;
  		ros::Subscriber sub;
  		ros::ServiceServer service_record_motor;

		void playFunction();
		void arm_move_right(int right_motor_data[]);
		void right_hand_motor_CB(const upperbodycore_msgs::upperbodymotorsfeedback::ConstPtr& msg); 

	public:
	    RecordAndPlay_motors();
	   	~RecordAndPlay_motors();
	    
	    void record_start(string filename);
		void pause();
		void stop();
		void resume();
		void record_stop();
		void play(string path);

};