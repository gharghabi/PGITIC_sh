
#include "skeletonclient.h"
#include <boost/thread.hpp>


//========================================================
/*
   Project description : PGITIC_SKELETON 
     1- person detect 
        2- joints position and orientation
        3- Posture of hands and legs
        4- wave detect
*/
//==========================================================   

int main(int argc, char **argv)
{
    ros::init(argc, argv, "skeleton_client");
    std::cout<<"skeleton client started"<<std::endl;

    ros::Time::init();
    ros::Rate loop_rate(20);
    
    skeletonclient Client;
    Client.skeleton_enable(true); // Enable gusture detect 

    while (ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();
        std::cout<<"user_id "<<Client.get_user_id()<<std::endl;
        std::cout<<"right_hand "<<Client.get_right_hand_posture()<<std::endl;
        // std::cout<<"left_leg "<<Client.get_left_leg_posture()<<std::endl;
        // std::cout<<"left_hand "<<Client.get_left_hand_posture()<<std::endl;
        // std::cout<<"joint data 0 "<<Client.get_skeleton_data().position[0].x<<std::endl;
        // std::cout<<"joint data 1 "<<Client.get_skeleton_data().position[1].x<<std::endl;
        // std::cout<<"joint data 2 "<<Client.get_skeleton_data().position[2].x<<std::endl;
        // std::cout<<"joint data 3 "<<Client.get_skeleton_data().position[3].x<<std::endl;
        // std::cout<<"joint data 4 "<<Client.get_skeleton_data().position[4].x<<std::endl;
        // std::cout<<"joint data 5 "<<Client.get_skeleton_data().position[5].x<<std::endl;
        // std::cout<<"joint data 6 "<<Client.get_skeleton_data().position[6].x<<std::endl;
        // std::cout<<"joint data 7 "<<Client.get_skeleton_data().position[7].x<<std::endl;
        // std::cout<<"joint data 8 "<<Client.get_skeleton_data().position[8].x<<std::endl;
        // std::cout<<"joint data 9 "<<Client.get_skeleton_data().position[9].x<<std::endl;
        // std::cout<<"joint data 10 "<<Client.get_skeleton_data().position[10].x<<std::endl;
        // std::cout<<"joint data 11 "<<Client.get_skeleton_data().position[11].x<<std::endl;
        // std::cout<<"joint data 12 "<<Client.get_skeleton_data().position[12].x<<std::endl;
        // std::cout<<"joint data 13 "<<Client.get_skeleton_data().position[13].x<<std::endl;
        // std::cout<<"joint data 14 "<<Client.get_skeleton_data().position[14].x<<std::endl;
        // std::cout<<"joint data 15 "<<Client.get_skeleton_data().position[15].x<<std::endl;

        // std::cout<<"position joint head "<<Client.get_joint_position("head")<<std::endl;
        // std::cout<<"position joint neck "<<Client.get_joint_position("neck")<<std::endl;
        // std::cout<<"position joint torso "<<Client.get_joint_position("torso")<<std::endl;
        // std::cout<<"position joint head "<<Client.get_joint_orientation("head")<<std::endl;
        // std::cout<<"position joint neck "<<Client.get_joint_orientation("neck")<<std::endl;
        // std::cout<<"position joint torso"<<Client.get_joint_orientation("torso")<<std::endl;
    }

    return 0;
}

