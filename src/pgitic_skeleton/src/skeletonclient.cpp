#include "skeletonclient.h"
 
using namespace std;
skeletonclient::skeletonclient()
 {	
    sub_[0] = nh_[0].subscribe("skeleton", 1, &skeletonclient::SkeletonData_CB,this);
    sub_[1] = nh_[1].subscribe("pgitic_user_count",1,&skeletonclient::user_count_CB,this);  
    PAOS = false;
    GDS = false;
	SkData.user_id = -1;
	confidence = 0.3;
    
    right_hand_posture = "NotSet";
    left_hand_posture = "NotSet";
    right_leg_posture = "NotSet";
    left_leg_posture = "NotSet";
    JointsNameA[0]="head";
    JointsNameA[1]="neck";
    JointsNameA[2] = "torso";
    JointsNameA[3] = "left_shoulder";
	JointsNameA[4] = "left_elbow";
	JointsNameA[5] = "left_hand";
	JointsNameA[6] = "right_shoulder";
	JointsNameA[7] = "right_elbow";
	JointsNameA[8] = "right_hand";
	JointsNameA[9] = "left_hip";
	JointsNameA[10]= "left_knee";
	JointsNameA[11]= "left_foot";
	JointsNameA[12]= "right_hip";
	JointsNameA[13]= "right_knee";
	JointsNameA[14]= "right_foot";
 }
 skeletonclient::~skeletonclient()
 {
 	
 }
 int skeletonclient::get_user_id()
 {
	return SkData.user_id;
 }
 void skeletonclient::skeleton_enable(bool req)
 {
    if(req)
     	GDS = true;
     else
        GDS = false;

 }
 int coutsfs=0;
void skeletonclient::SkeletonData_CB(const upperbodycore_msgs::Skeleton msg)
 {
// coutsfs++;
//     cout<<"salam "<<coutsfs<<endl;
 	SkData = msg;
    if(GDS)
      GestureDetect();  

 }
 void skeletonclient::GestureDetect()
{
	upperbodycore_msgs::Skeleton msg = SkData;
    // ***********************right hand**************************//
    if(msg.position[8].y>(msg.position[0].y+0.2*abs(msg.position[0].y-msg.position[1].y)))
    {
        if((msg.confidence[8]>confidence)&&(msg.confidence[0]>confidence))
        {
            right_hand_posture = "Up";
        }
    }
    else if(abs(msg.position[8].x-msg.position[6].x)>((1.5)*abs(msg.position[6].x-msg.position[0].x)))
    {
        if((msg.confidence[8]>confidence)&&(msg.confidence[6]>confidence))
        {
            right_hand_posture = "Side";
        }
    }
    else if(msg.position[8].z<(msg.position[0].z-1.5*abs(msg.position[1].y-msg.position[2].y)))//be jaye 0.2 tafazole y torso va neck
    {
        if((msg.confidence[8]>confidence)&&(msg.confidence[0]>confidence)&&(msg.confidence[2]>confidence)&&(msg.confidence[1]>confidence))
        {
            right_hand_posture = "Front";
        }
    }
    else if(msg.position[8].y<(msg.position[2].y))
    {
        if((msg.confidence[8]>confidence)&&(msg.confidence[2]>confidence))
        {
             right_hand_posture = "Down";
        }
    }
    //***********************left hand**************************//
    if(msg.position[5].y>(msg.position[0].y+0.20*abs(msg.position[0].y-msg.position[1].y)))
    {
        if((msg.confidence[5]>confidence)&&(msg.confidence[0]>confidence))
        {
             left_hand_posture = "Up";
        }
    }
    else if(abs(msg.position[5].x-msg.position[3].x)>1.5*abs(msg.position[3].x-msg.position[0].x))
    {
        if((msg.confidence[5]>confidence)&&(msg.confidence[3]>confidence))
        {
			   left_hand_posture = "Side";
        }
    }
    else if(msg.position[5].z<(msg.position[0].z-1.5*abs(msg.position[1].y-msg.position[2].y)))//be jaye 0.2 tafazole y torso va neck
    {
        if((msg.confidence[5]>confidence)&&(msg.confidence[0]>confidence)&&(msg.confidence[2]>confidence)&&(msg.confidence[1]>confidence))
        {
        	left_hand_posture = "Front";
        }
    }
    else if(msg.position[5].y<(msg.position[2].y))
    {
        if((msg.confidence[5]>confidence)&&(msg.confidence[2]>confidence))
        {
        	left_hand_posture = "Down";
        }
    }
    //***********************left foot**************************//
    if(msg.position[11].x<(msg.position[3].x-2*abs(msg.position[3].x-msg.position[2].x)))//paye chape man mishe paye raste in baraye dastesh in juri nabud
    {
        if((msg.confidence[11]>confidence)&&(msg.confidence[9]>confidence)&&(msg.confidence[2]>confidence))
        {
        	left_leg_posture = "Side";
        }
    }
    else if ((msg.position[11].z<msg.position[2].z)&&(abs(msg.position[11].z-msg.position[10].z)<0.4*(abs(msg.position[11].y-msg.position[10].y)))&&
    	(abs(msg.position[10].y-msg.position[9].y)<0.8*(abs(msg.position[11].y-msg.position[10].y)))) 
    {
    	 if((msg.confidence[11]>confidence)&&(msg.confidence[2]>confidence)&&(msg.confidence[10]>confidence))
        {
            left_leg_posture = "Up";
        }
    }

    else if(msg.position[11].z<(msg.position[2].z-abs(msg.position[9].x-msg.position[2].x)))//paye chape man mishe paye raste in baraye dastesh in juri nabud
    {
        if((msg.confidence[11]>confidence)&&(msg.confidence[9]>confidence)&&(msg.confidence[2]>confidence))
        {
        	left_leg_posture = "Front";
        }
    }
    else 
    {
        if((msg.confidence[11]>confidence)&&(msg.confidence[9]>confidence)&&(msg.confidence[2]>confidence)&&(msg.confidence[14]>confidence))
        {
        	left_leg_posture = "Down";
     
        }
    }
    //***********************right foot**************************//

    if(msg.position[14].x>(msg.position[6].x+2*abs(msg.position[6].x-msg.position[2].x)))//paye chape man mishe paye raste in baraye dastesh in juri nabud
    {
        if((msg.confidence[14]>confidence)&&(msg.confidence[12]>confidence)&&(msg.confidence[2]>confidence))
        {
            right_leg_posture = "Side";
        }
    }
    else if ((msg.position[14].z<msg.position[2].z)&&(abs(msg.position[14].z-msg.position[13].z)<0.4*(abs(msg.position[14].y-msg.position[13].y)))&&
    	(abs(msg.position[13].y-msg.position[12].y)<0.7*(abs(msg.position[14].y-msg.position[13].y))))
    {
    	 if((msg.confidence[14]>confidence)&&(msg.confidence[2]>confidence)&&(msg.confidence[13]>confidence))
        {
            right_leg_posture = "Up";
        }
    }
    else if(msg.position[14].z<(msg.position[2].z-abs(msg.position[12].x-msg.position[2].x)))//paye chape man mishe paye raste in baraye dastesh in juri nabud
    {
        if((msg.confidence[14]>confidence)&&(msg.confidence[9]>confidence)&&(msg.confidence[2]>confidence))
        {
            right_leg_posture = "Front";
        }
    }
    else 
    {
        if((msg.confidence[14]>confidence)&&(msg.confidence[12]>confidence)&&(msg.confidence[2]>confidence))
        {
            right_leg_posture = "Down";
        }
    }
}

 geometry_msgs::Vector3 skeletonclient::get_joint_position(std::string JointName)
 {
 		geometry_msgs::Vector3 jointP;
 		jointP.x = 0;
 		jointP.y = 0;
 		jointP.z = 0;
 		if(SkData.user_id != -1)
 		{
            if (JointName.compare("head") == 0)
            {
                    // cout<<SkData.confidence[0];
                    jointP.x= SkData.position[0].x;
                    jointP.y= SkData.position[0].y;
                    jointP.z= SkData.position[0].z;
            }else if (JointName.compare("neck") == 0)
            {
                    jointP.x= SkData.position[1].x;
                    jointP.y= SkData.position[1].y;
                    jointP.z= SkData.position[1].z;
            }

            else if (JointName.compare("torso") == 0)
            {
                    jointP.x= SkData.position[2].x;
                    jointP.y= SkData.position[2].y;
                    jointP.z= SkData.position[2].z;
            }
            else if (JointName.compare("left_shoulder") == 0)
            {
                    jointP.x= SkData.position[3].x;
                    jointP.y= SkData.position[3].y;
                    jointP.z= SkData.position[3].z;
            }
            else if (JointName.compare("left_elbow") == 0)
            {
                    jointP.x= SkData.position[4].x;
                    jointP.y= SkData.position[4].y;
                    jointP.z= SkData.position[4].z;
            }            
            else if (JointName.compare("left_hand") == 0)
            {
                    jointP.x= SkData.position[5].x;
                    jointP.y= SkData.position[5].y;
                    jointP.z= SkData.position[5].z;
            }
            else if (JointName.compare("right_shoulder") == 0)
            {
                    jointP.x= SkData.position[6].x;
                    jointP.y= SkData.position[6].y;
                    jointP.z= SkData.position[6].z;
            }
            else if (JointName.compare("right_elbow") == 0)
            {
                    jointP.x= SkData.position[7].x;
                    jointP.y= SkData.position[7].y;
                    jointP.z= SkData.position[7].z;
            }
            else if (JointName.compare("right_hand") == 0)
            {
                    jointP.x= SkData.position[8].x;
                    jointP.y= SkData.position[8].y;
                    jointP.z= SkData.position[8].z;
            }
            else if (JointName.compare("left_hip") == 0)
            {
                    jointP.x= SkData.position[9].x;
                    jointP.y= SkData.position[9].y;
                    jointP.z= SkData.position[9].z;
            }
            else if (JointName.compare("left_knee") == 0)
            {
                    jointP.x= SkData.position[10].x;
                    jointP.y= SkData.position[10].y;
                    jointP.z= SkData.position[10].z;
            }            
            else if (JointName.compare("left_foot") == 0)
            {
                    jointP.x= SkData.position[11].x;
                    jointP.y= SkData.position[11].y;
                    jointP.z= SkData.position[11].z;
            }
            else if (JointName.compare("right_hip") == 0)
            {
                    jointP.x= SkData.position[12].x;
                    jointP.y= SkData.position[12].y;
                    jointP.z= SkData.position[12].z;
            }
            else if (JointName.compare("right_knee") == 0)
            {
                    jointP.x= SkData.position[13].x;
                    jointP.y= SkData.position[13].y;
                    jointP.z= SkData.position[13].z;
            }
            else if (JointName.compare("right_foot") == 0)
            {
                    jointP.x= SkData.position[14].x;
                    jointP.y= SkData.position[14].y;
                    jointP.z= SkData.position[14].z;
            }

        }
 	return jointP;
 }

 geometry_msgs::Quaternion skeletonclient::get_joint_orientation(std::string JointName)
 {
	   geometry_msgs::Quaternion jointO;
	   jointO.x = 0;
	   jointO.y = 0;
	   jointO.z = 0;
	   jointO.w = 0;


        if(SkData.user_id != -1)
        {
            if (JointName.compare("head") == 0)
            {
                    jointO.x = SkData.orientation[0].x;
                    jointO.y = SkData.orientation[0].y;
                    jointO.z = SkData.orientation[0].z;
                    jointO.w = SkData.orientation[0].w;
            }else if (JointName.compare("neck") == 0)
            {   
                    jointO.x = SkData.orientation[1].x;
                    jointO.y = SkData.orientation[1].y;
                    jointO.z = SkData.orientation[1].z;
                    jointO.w = SkData.orientation[1].w;            }

            else if (JointName.compare("torso") == 0)
            {
                    jointO.x = SkData.orientation[2].x;
                    jointO.y = SkData.orientation[2].y;
                    jointO.z = SkData.orientation[2].z;
                    jointO.w = SkData.orientation[2].w;            }
            else if (JointName.compare("left_shoulder") == 0)
            {
                    jointO.x = SkData.orientation[3].x;
                    jointO.y = SkData.orientation[3].y;
                    jointO.z = SkData.orientation[3].z;
                    jointO.w = SkData.orientation[3].w;         
            }
            else if (JointName.compare("left_elbow") == 0)
            {
                    jointO.x = SkData.orientation[4].x;
                    jointO.y = SkData.orientation[4].y;
                    jointO.z = SkData.orientation[4].z;
                    jointO.w = SkData.orientation[4].w;
            }            
            else if (JointName.compare("left_hand") == 0)
            {
                    jointO.x = SkData.orientation[5].x;
                    jointO.y = SkData.orientation[5].y;
                    jointO.z = SkData.orientation[5].z;
                    jointO.w = SkData.orientation[5].w;
            }
            else if (JointName.compare("right_shoulder") == 0)
            {
                    jointO.x = SkData.orientation[6].x;
                    jointO.y = SkData.orientation[6].y;
                    jointO.z = SkData.orientation[6].z;
                    jointO.w = SkData.orientation[6].w;            
            }
            else if (JointName.compare("right_elbow") == 0)
            {
                    jointO.x = SkData.orientation[7].x;
                    jointO.y = SkData.orientation[7].y;
                    jointO.z = SkData.orientation[7].z;
                    jointO.w = SkData.orientation[7].w;         
            }
            else if (JointName.compare("right_hand") == 0)
            {
                    jointO.x = SkData.orientation[8].x;
                    jointO.y = SkData.orientation[8].y;
                    jointO.z = SkData.orientation[8].z;
                    jointO.w = SkData.orientation[8].w;
            }
            else if (JointName.compare("left_hip") == 0)
            {
                    jointO.x = SkData.orientation[9].x;
                    jointO.y = SkData.orientation[9].y;
                    jointO.z = SkData.orientation[9].z;
                    jointO.w = SkData.orientation[9].w; 
            }
            else if (JointName.compare("left_knee") == 0)
            {
                    jointO.x = SkData.orientation[10].x;
                    jointO.y = SkData.orientation[10].y;
                    jointO.z = SkData.orientation[10].z;
                    jointO.w = SkData.orientation[10].w;
            }            
            else if (JointName.compare("left_foot") == 0)
            {
                    jointO.x = SkData.orientation[11].x;
                    jointO.y = SkData.orientation[11].y;
                    jointO.z = SkData.orientation[11].z;
                    jointO.w = SkData.orientation[11].w;
            }
            else if (JointName.compare("right_hip") == 0)
            {
                    jointO.x = SkData.orientation[12].x;
                    jointO.y = SkData.orientation[12].y;
                    jointO.z = SkData.orientation[12].z;
                    jointO.w = SkData.orientation[12].w;
            }
            else if (JointName.compare("right_knee") == 0)
            {
                    jointO.x = SkData.orientation[13].x;
                    jointO.y = SkData.orientation[13].y;
                    jointO.z = SkData.orientation[13].z;
                    jointO.w = SkData.orientation[13].w;
            }
            else if (JointName.compare("right_foot") == 0)
            {
                    jointO.x = SkData.orientation[14].x;
                    jointO.y = SkData.orientation[14].y;
                    jointO.z = SkData.orientation[14].z;
                    jointO.w = SkData.orientation[14].w;
            }

        }
 	return jointO;
 }

 string skeletonclient::get_right_hand_posture(){
 	return right_hand_posture;
 }
 string skeletonclient::get_left_hand_posture(){
 	return left_hand_posture;
 }
 string skeletonclient::get_right_leg_posture(){
 	return right_leg_posture;
 }
 string skeletonclient::get_left_leg_posture(){
 	return left_leg_posture;
 }
 void skeletonclient::set_confidence(float confidenceIn)
 {
 	confidence = confidenceIn;
 }
 joint skeletonclient::get_skeleton_data()
 {
    geometry_msgs::Vector3 mvector;
    geometry_msgs::Quaternion nvector;
    if(SkData.user_id!=-1)
	 {
        // cout<<SkData.confidence[0]<<endl;
        // cout<<SkData.confidence[7]<<endl;
	 	for(int k =0;k<jointNum;++k)
	    {
	        mvector.x= SkData.position[k].x;
	        mvector.y= SkData.position[k].y;
	        mvector.z= SkData.position[k].z;
	        joints.position[k] = mvector;
	        
            nvector.x = SkData.orientation[k].x;
	        nvector.y = SkData.orientation[k].y;
	        nvector.z = SkData.orientation[k].z;
	        nvector.w = SkData.orientation[k].w;
	        joints.orientation[k] = nvector;
	        joints.name[k] = JointsNameA[k];
	    }
	 }
     else
     {
      for(int k =0;k<jointNum;++k)
        {
            mvector.x= 0;
            mvector.y= 0;
            mvector.z= 0;
            joints.position[k] = mvector;
            
            nvector.x = 0;
            nvector.y = 0;
            nvector.z = 0;
            nvector.w = 0;
            joints.orientation[k] = nvector;
            joints.name[k] = JointsNameA[k];
        }  
     }
	 return joints;
 }
void skeletonclient::user_count_CB(const std_msgs::Int32 msg)
{
    cout<<"Pose X"<<msg.data<<endl;
    SkData.confidence.clear();
    SkData.user_id = -1;
    SkData.orientation.clear();
    SkData.position.clear();
    SkData.name.clear();

}
