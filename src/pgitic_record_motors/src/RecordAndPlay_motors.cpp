#include "RecordAndPlay_motors.h"

RecordAndPlay_motors::RecordAndPlay_motors()
{
	resumeF  = false;
	stopF    = false;
	pauseF   = false;
	record_stopF = false;
	record_startF = false;
	playF = false;
	filename = "Null";
	sub = n_motors.subscribe("upperbodycoreout_feedback", 1, &RecordAndPlay_motors::right_hand_motor_CB,this);
    right_hand_pub = nh_[0].advertise<upperbodycore_msgs::upperbodymotors>("upperbodycorein_right_motors", 1);
    boost::thread play_process(&RecordAndPlay_motors::playFunction,this);
    // play_process.join();

}
RecordAndPlay_motors::~RecordAndPlay_motors()
{
	

}
void RecordAndPlay_motors::right_hand_motor_CB(const upperbodycore_msgs::upperbodymotorsfeedback::ConstPtr& msg)
{
	cout<<"hey"<<endl;
   		motor_position.clear();
      for ( int i = 0 ; i < msg->motorfeedbacks.size() ; i++ )
        motor_position.push_back(msg->motorfeedbacks[i].position);
    
	    if(record_startF)
	    {
	       while(!record_stopF)
		  {
		  	cout<<"sala,"<<endl;
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
		              }
		            }
		          else 
		            cout << "Unable to open file";
		        }
		        else
		          cout<<"invalid url"<<endl;
		  }
    }

}
void RecordAndPlay_motors::pause()
{
	pauseF = true;
}

void RecordAndPlay_motors::stop()
{
	stopF = true;
}
void RecordAndPlay_motors::resume()
{
	pauseF = false;
}

void RecordAndPlay_motors::record_start(string filename)
{
   	cout<<"132"<<endl;	
    motors_info.open(filename.c_str());
    tic = cv::getTickCount();
    toc = (cv::getTickCount() - tic) / cv::getTickFrequency();
    motor_position.clear();
    record_startF = true;
    cout<<"done";
}
void RecordAndPlay_motors::play(string path)
{
	motors_file.open(path.c_str(), ios_base::in);
	playF =  true;
}
void RecordAndPlay_motors::playFunction()
{
     while ( ros::ok())
    {
      if(playF)
      {
        float timeprev = 0;
        float timePub = 0;
        int right_motor_data[8] = {0}; 
        if (motors_file.is_open())
        {
            for (std::string line; std::getline(motors_file, line); )   //read stream line by line
            {
            	cout<<line<<endl;
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
void RecordAndPlay_motors::record_stop()
{
	record_stopF = true;
	motors_info.close();
}

void RecordAndPlay_motors::arm_move_right(int right_motor_data[])
{
	right_hand_motors.shoulder_yawm_position = right_motor_data[0];
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
 