#include "upperbodyclient.h"

bool appExit = false;
upperbodyclient *gClinet;

void logic()
{
    while( !appExit )
    {
      boost::this_thread::sleep(boost::posix_time::milliseconds(1000));
      if ( gClinet == NULL ) continue;
      //Your Code Here :
      //set joint position and speed

      gClinet->setMotor_rightShoulderYaw(1100,5);
      boost::this_thread::sleep(boost::posix_time::milliseconds(3000));
      gClinet->setMotor_rightShoulderYaw(3100,5);
      gClinet->setMotor_rightWristPitch(386,5);
      gClinet->setMotor_rightWristRoll(700,5);
      gClinet->setMotor_rightElbowRoll(554,5);
      gClinet->setMotor_rightElbowPitch(2391,5);



      gClinet->setMotor_leftWristPitch(499,5);
      gClinet->setMotor_leftWristRoll(523,5);
      gClinet->setMotor_leftElbowRoll(508,5);
      gClinet->setMotor_leftElbowPitch(2830,5);


      boost::this_thread::sleep(boost::posix_time::milliseconds(3000));

      gClinet->setMotor_leftGripper(100,20);
      boost::this_thread::sleep(boost::posix_time::milliseconds(1000));

      gClinet->resetMotor_leftGripper();
      boost::this_thread::sleep(boost::posix_time::milliseconds(1000));

      gClinet->resetMotor_rightArm();
      gClinet->resetMotor_leftArm();
      boost::this_thread::sleep(boost::posix_time::milliseconds(5000));

    }
}

int main(int argc, char **argv)
{
    boost::thread _thread_logic(&logic);

    ros::init(argc, argv, "upperbody_client");
    std::cout<<"upperbody client started"<<std::endl;

    ros::Time::init();
    ros::Rate loop_rate(20);
    
    upperbodyclient Client;
    gClinet = &Client;

    while (ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();

        //your code here
        //get motor feedback

        if ( gClinet->rightArmMotors.size() != 0 )
        {
            std::cout<<gClinet->rightArmMotors.at(0).load<<std::endl;
        }
        else
            std::cout<<"no motors"<<std::endl;
    }

    appExit = true;
    _thread_logic.interrupt();
    _thread_logic.join();
  
    return 0;
}
