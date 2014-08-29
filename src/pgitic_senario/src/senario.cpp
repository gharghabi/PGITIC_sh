#include "ros/ros.h"
#include <boost/thread.hpp>
#include "soundclient.h"
#include "wave.h"
#include "skeletonclient.h"


void wavedetect();
bool check_pos();
wave *wave_client;
soundclient *soundClient;
skeletonclient *Client;

using namespace std;
int dontMoveTime = 5000;
int main(int argc, char **argv)
{
    ros::init(argc, argv, "senario_clientqq");
    std::cout << "senario client started" << std::endl;
    wave_client = new wave();
    soundClient = new soundclient();
    Client = new skeletonclient();
    Client->skeleton_enable(true);

    ros::NodeHandle nh_,n_;
    boost::thread wave_process(&wavedetect);
    ros::spin();
    wave_process.interrupt();
    wave_process.join();
    return 0;
}
bool flag_detectgesture=false;
string last_right_hand_posture;
string last_left_hand_posture;
string last_right_foot_posture;
string last_left_foot_posture;

string right_hand_posture;
string left_hand_posture;
string right_leg_posture;
string left_leg_posture;
bool wave;
int counter[12] = {0}; 
void wavedetect()
{
    while (ros::ok())
    {

        
        right_hand_posture = Client->get_right_hand_posture();
        left_hand_posture = Client->get_left_hand_posture();
        wave=wave_client->right_hand_wave_detect();
      if (wave){
       
            soundClient->play("/home/athome/Desktop/robot/byby.mp3");
              cout<<"byby"<<endl;
            boost::this_thread::sleep(boost::posix_time::milliseconds(3000));
            while(wave) wave=wave_client->right_hand_wave_detect();
                boost::this_thread::sleep(boost::posix_time::milliseconds(200));
             while(wave) wave=wave_client->right_hand_wave_detect();
            
      }

        else if(right_hand_posture == "Side")
        {
           
            soundClient->play("/home/athome/Desktop/robot/right_hand_side.mp3");
             cout<<"right hand side"<<endl;
            boost::this_thread::sleep(boost::posix_time::milliseconds(3000));
            while(right_hand_posture == "Side") right_hand_posture = Client->get_right_hand_posture();
                boost::this_thread::sleep(boost::posix_time::milliseconds(200));
                while(right_hand_posture == "Side")right_hand_posture = Client->get_right_hand_posture();
            
            
          
        }
        else            if(right_hand_posture == "Front")
        {
            
            soundClient->play("/home/athome/Desktop/robot/right_hand_front.mp3");
            boost::this_thread::sleep(boost::posix_time::milliseconds(3000));
            cout<<"right hand side"<<endl;
            cout<<"end of side"<<endl;
            while(right_hand_posture == "Front")right_hand_posture = Client->get_right_hand_posture();
            boost::this_thread::sleep(boost::posix_time::milliseconds(200));
             while(right_hand_posture == "Front")right_hand_posture = Client->get_right_hand_posture();
             
        }
        else            if(left_hand_posture == "Side")
        {
            
            soundClient->play("/home/athome/Desktop/robot/left_hand_side.mp3");
            boost::this_thread::sleep(boost::posix_time::milliseconds(3000));
            cout<<"right left side"<<endl;
            cout<<"end of side"<<endl;
            while(left_hand_posture == "Side")left_hand_posture = Client->get_left_hand_posture(); 
             boost::this_thread::sleep(boost::posix_time::milliseconds(200));
             while(left_hand_posture == "Side")left_hand_posture = Client->get_left_hand_posture();
        }
        else            if(left_hand_posture == "Front")
        {
            
            soundClient->play("/home/athome/Desktop/robot/left_hand_front.mp3");
            boost::this_thread::sleep(boost::posix_time::milliseconds(3000));
            cout<<"end of side"<<endl;
            cout<<"right left side"<<endl;
             while(left_hand_posture == "Front")left_hand_posture = Client->get_left_hand_posture(); 
             boost::this_thread::sleep(boost::posix_time::milliseconds(200));
              while(left_hand_posture == "Front")left_hand_posture = Client->get_left_hand_posture(); 

        }
        
           
        
    }
}

bool check_pos()
{
    if((last_right_hand_posture!= Client->get_right_hand_posture())&&("Down"!= Client->get_right_hand_posture()))
        return false;
    else
        return true;
}
