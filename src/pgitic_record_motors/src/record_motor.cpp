#include "ros/ros.h"
#include <fstream>
#include <opencv2/imgproc/imgproc.hpp>
#include <boost/thread.hpp>



#include <upperbodycore_msgs/upperbodymotors.h>
#include <upperbodycore_msgs/upperbodymotorsfeedback.h>
#include "upperbodycore_msgs/recordSrv.h"

using namespace std; 

float timePub;
std::vector<int> motor_position;
float tic,toc;
ofstream motors_info;
string filename="Null";

bool resumeF = false;
bool stopF = false;
bool pauseF = false;
bool playF = false;
bool recordF = false;
string path = "Null";
ifstream motors_file;
upperbodycore_msgs::upperbodymotors right_hand_motors;

 ros::Publisher right_hand_pub;
void record();
void play();
bool check_record_request(upperbodycore_msgs::recordSrv::Request  &req, upperbodycore_msgs::recordSrv::Response &res); 
void right_hand_motor_CB(const upperbodycore_msgs::upperbodymotorsfeedback::ConstPtr& msg); 
void arm_move_right(int right_motor_data[]);

int main(int argc, char **argv)
{
  ros::init(argc, argv, "writing_to_file");
  ros::Time::init();
  ros::Rate loop_rate(20);

	printf("Normalization Time: %f milliseconds\n",toc );
  ros::NodeHandle nh_[2];
  ros::NodeHandle n_motors,n_service;
  ros::Subscriber sub = n_motors.subscribe("upperbodycoreout_feedback", 1, right_hand_motor_CB);
  ros::ServiceServer service_record_motor = n_service.advertiseService("pgitic_record_motor_file", check_record_request);
  right_hand_pub = nh_[0].advertise<upperbodycore_msgs::upperbodymotors>("upperbodycorein_right_motors", 1);
  boost::thread record_process(&record);
  boost::thread play_process(&play);
  ros::spin();
  record_process.interrupt();
  record_process.join();
  play_process.interrupt();
  play_process.join();
  return 0;    
}

bool check_record_request(upperbodycore_msgs::recordSrv::Request  &req, upperbodycore_msgs::recordSrv::Response &res)
 {
    if (req.command == "record_start")
    {
        filename = req.path;
        motors_info.open(filename.c_str());
        tic = cv::getTickCount();
        toc = (cv::getTickCount() - tic) / cv::getTickFrequency();
        motor_position.clear();
        recordF = true;
    }
    else if(req.command == "record_stop")
    {
      recordF = false;
      motors_info.close();
    }
    else if(req.command == "play")
    {
     stopF = false;
     path = req.path;
     motors_file.open(path.c_str(), ios_base::in);
     playF = true;
    }
    else if(req.command == "pause")
    {
      stopF = false;
      pauseF = true;
    }
    else if(req.command == "stop")
    {
      playF = false;
      stopF = true;
      motors_file.close();
    }
    else if(req.command == "resume")
    {
      pauseF = false;
    }
          return true;
 }


void record()
{
  while(ros::ok())
  {
    if(recordF)
    {
      if(filename!="Null")
        {
          if (motors_info.is_open())
            {
              toc = (cv::getTickCount() - tic) / cv::getTickFrequency();
              if(motor_position.size()!=0)
              {
                motors_info <<toc;
                cout<<motor_position.size()<<" size"<<endl;
                for ( int i = 0 ; i < motor_position.size() ;++i)
                {
                  if((i!=1)&&(i!=3)&&(i!=10)&&(i!=11))
                   motors_info <<" "<<motor_position[i];  
                }
                motors_info<<"\n";  
                motor_position.clear();
              }
            }
          else 
            cout << "Unable to open file";
        }
        else
          cout<<"invalid url"<<endl;
      }
      else
      {
        boost::this_thread::sleep(boost::posix_time::milliseconds(1000));     
      }
  }
}

void play()
{
    while ( ros::ok())
    {
      if(playF)
      {
        float timeprev = 0;
        int right_motor_data[8] = {0}; 
        if (motors_file.is_open())
        {
            for (std::string line; std::getline(motors_file, line); )   //read stream line by line
            {
               while(pauseF)
               {
                 boost::this_thread::sleep(boost::posix_time::milliseconds(1000));     
               }
               if(stopF)
               {
                  break;
               }
                if(ros::ok())
                {
                    std::istringstream in(line);      //make a stream for the line itself
                    in >> timePub >> right_motor_data[0] >> right_motor_data[1] >> right_motor_data[2] >> right_motor_data[3] >> right_motor_data[4] >> right_motor_data[5]  >> right_motor_data[6]>>right_motor_data[7];
                    cout<<timePub<<endl;
                    if (right_motor_data[0] != 0)
                    {
                        usleep((timePub - timeprev) * 1000000);
                        arm_move_right(right_motor_data);
                        cout<<right_hand_motors.shoulder_yawm_position<<" shoulder"<<endl;
                        right_hand_pub.publish(right_hand_motors);
                        timeprev = timePub;
                    }
                }
            }
            playF = false;
            motors_file.close();
            cout<<"finish"<<endl;
        }
      }
      else
         boost::this_thread::sleep(boost::posix_time::milliseconds(1000));     
     }
}

    
 void right_hand_motor_CB(const upperbodycore_msgs::upperbodymotorsfeedback::ConstPtr& msg)
{
      motor_position.clear();
      for ( int i = 0 ; i < msg->motorfeedbacks.size() ; i++ )
        motor_position.push_back(msg->motorfeedbacks[i].position); 

}
void arm_move_right(int right_motor_data[])
{
  right_hand_motors.shoulder_yawm_position = right_motor_data[0];
                       cout<<right_motor_data[0]<<"right motor data"<<endl;
 
  right_hand_motors.shoulder_pitchm_position= right_motor_data[1];
  right_hand_motors.shoulder_roll_position = right_motor_data[2];
  right_hand_motors.elbow_pitch_position=right_motor_data[3];
  right_hand_motors.elbow_roll_position = right_motor_data[4];
  right_hand_motors.wrist_pitch_position = right_motor_data[5];
  right_hand_motors.wrist_roll_position = right_motor_data[6];
  right_hand_motors.gripper_position = right_motor_data[7];
  right_hand_motors.shoulder_yawm_speed = 5;
  right_hand_motors.shoulder_pitchm_speed = 5;
  right_hand_motors.shoulder_roll_speed = 5;
  right_hand_motors.elbow_pitch_speed = 5;
  right_hand_motors.elbow_roll_speed = 5;
  right_hand_motors.wrist_pitch_speed = 5;
  right_hand_motors.wrist_roll_speed = 5;
  right_hand_motors.gripper_speed = 5;
}

