
#include <iostream>
#include <string>
#include "upperbodycore_msgs/sound.h"
#include <boost/thread.hpp>
#include "soundclient.h"
using namespace std;
int main(int argc, char **argv)
{
    ros::Time::init();
    ros::Rate loop_rate(20);
    soundclient soundClient;

    //__________________ play from defatule path sample_______________
    // soundClient.set_default_path("/home/athome/Desktop/SampleMusic"); 
    // soundClient.play("Kalimba.mp3")
    //
    
    //________________________play from direct path______________//
    soundClient.play("NO_RESIDEH.MP3");
    //_______________________________________________________________
    boost::this_thread::sleep(boost::posix_time::milliseconds(5000));
    soundClient.pause();
    boost::this_thread::sleep(boost::posix_time::milliseconds(5000));
    soundClient.resume();
    boost::this_thread::sleep(boost::posix_time::milliseconds(5000));
    soundClient.stop();

    return 0;
}
