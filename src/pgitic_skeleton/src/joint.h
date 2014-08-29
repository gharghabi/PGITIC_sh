class joint
{
	public:
		static int const jointNum = 15;
		geometry_msgs::Vector3 position[jointNum];
		geometry_msgs::Quaternion orientation[jointNum];
		std::string name[jointNum];
		float confidence[jointNum];
	joint()
	{
		for(int i=0;i<jointNum;++i)
		{
			position[i].x = 0;
			position[i].y = 0;
			position[i].z = 0;
			orientation[i].x = 0;
			orientation[i].y = 0;
			orientation[i].z = 0;
			orientation[i].w = 0;
			name[i] = " ";
			confidence[i] = 0; 
		}
	}

};
