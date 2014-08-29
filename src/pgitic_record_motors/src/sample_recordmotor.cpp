#include <iostream>
#include <string>
#include <upperbodycore_msgs/sound.h>
#include <boost/thread.hpp>
#include "RecordAndPlay_motors.h"
using namespace std;
int main(int argc, char **argv)
{
    ros::init(argc, argv, "record_client");
    std::cout<<"record_motor client started"<<std::endl;

    ros::Time::init();
    ros::Rate loop_rate(20);
    RecordAndPlay_motors RecordAndPlayclient;
    // boost::this_thread::sleep(boost::posix_time::milliseconds(1000));
    // RecordAndPlayclient.play("/home/athome/catkin_ws/src/pgitic_record_motors/src/files/test20.txt");
    // boost::this_thread::sleep(boost::posix_time::milliseconds(1000));
    // RecordAndPlayclient.pause();
    // boost::this_thread::sleep(boost::posix_time::milliseconds(1000));
    // RecordAndPlayclient.stop();
     // RecordAndPlayclient.record_start("/home/athome/catkin_ws/src/pgitic_record_motors/src/files/test13.txt");
    // RecordAndPlayclient.pause();
        RecordAndPlayclient.play("/home/athome/catkin_ws/src/pgitic_record_motors/src/files/test18.txt");
    cout<<"record start"<<endl;
    // boost::this_thread::sleep(boost::posix_time::milliseconds(2000));
    // RecordAndPlayclient.record_stop();
    cout<<"stop"<<endl;
    // RecordAndPlayclient.stop();

        RecordAndPlayclient.pause();
            cout<<"record stop"<<endl;
                boost::this_thread::sleep(boost::posix_time::milliseconds(2000));
        RecordAndPlayclient.resume();
            cout<<"record resume"<<endl;

                boost::this_thread::sleep(boost::posix_time::milliseconds(2000));

    RecordAndPlayclient.stop();


    ros::spin();
    return 0;
}