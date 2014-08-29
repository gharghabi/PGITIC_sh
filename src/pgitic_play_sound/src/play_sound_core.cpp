#include "ros/ros.h"

#include <iostream>
#include <string>
#include <upperbodycore_msgs/sound.h>
#include <boost/thread.hpp>
#include "soundclient.h"
#include <boost/thread.hpp>
using namespace std;



bool sound_request(upperbodycore_msgs::sound::Request  &req,upperbodycore_msgs::sound::Response &res);
bool play_sound(string path);
// void kinect()
// {
//     system("~/catkin_ws/src/pgitic_skeleton/shell/kinect.sh");
// }
soundclient *soundClient;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "sound_client");
    std::cout<<"sound client started"<<std::endl;

    ros::Time::init();
    ros::Rate loop_rate(20);
    
    ros::NodeHandle nh_[4];
    ros::ServiceServer service_play_sound = nh_[0].advertiseService("pgitic_sound", sound_request);
        // soundClient.play("/home/athome/Downloads/Saghi.mp3");
    soundClient = new soundclient();
    // boost::thread record_process(&kinect);    
    while (ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();
    }
  // record_process.interrupt();
  // record_process.join();

    return 0;
}

//aac mp3 ogg wav
bool play_sound(string path)
{
	bool response=true;
    string str,str2;
    str="xmms2 add ";
    str2=path;
    std::size_t found = path.find(" ");
    if (found != std::string::npos)
    {
    	response = false;
    	cout<<" file path shouldnt have space"<<endl;
    	return response;
    }
    str.append(str2); 
    system("xmms2 clear");
    system(str.c_str());
    system("xmms2 play");
    boost::this_thread::sleep(boost::posix_time::milliseconds(3000));	
    return response;
}
bool sound_request(upperbodycore_msgs::sound::Request  &req,upperbodycore_msgs::sound::Response &res)
{
	res.result = true;
	if(req.command=="play")
	{
        cout<<req.path<<endl;
        soundClient->play(req.path);
		// system("xmms2 stop");	
		// res.result = play_sound(req.path);
	}
	else if(req.command=="pause")
	{
        soundClient->pause();
	    // system("xmms2 pause");
	}
	else if(req.command=="resume")
	{
        soundClient->resume();
	    // system("xmms2 play");
	}
	else if(req.command=="stop")
	{
        soundClient->stop();
		// system("xmms2 stop");
	}
    else if(req.command=="set_default_path")
    {
        soundClient->set_default_path(req.path);
        cout<<"set shod"<<endl;
    }
	return res.result;
}
