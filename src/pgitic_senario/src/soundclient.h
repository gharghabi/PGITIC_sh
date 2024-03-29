#include <ros/ros.h>
#include <upperbodycore_msgs/sound.h>

class soundclient
{

	private:
		std::string default_path;
		void play_sound(std::string path)
		{
			bool response=true;
		    std::string str,str2;
		    str="xmms2 add ";
		    str2=path;
		    std::size_t found = path.find(" ");
		    if (found != std::string::npos)
		    {
		    	response = false;
		    	std::cout<<" file path shouldnt have space"<<std::endl;
		    }
		   	std::size_t foundSlash = path.find("/");
		    if (foundSlash != std::string::npos)
		    {
		    	str.append(str2);
		    }
		    else
		    {
		    	str.append(default_path);
		    	str.append("/");
		    	str.append(str2);
		    }
		    system("xmms2 clear");
		    system(str.c_str());
		    system("xmms2 play");
		}
	public:

	    soundclient()
	    {
	    	default_path = "/home/";
	    }
	    ~soundclient()
	    {
	    	system("xmms2 stop");	
	    }
	    void play(std::string path)
	    {
	    	system("xmms2 stop");	
			play_sound(path);
	    }
	    void stop()
	    {
		    system("xmms2 stop");
	    }
	    void resume()
	    {
	    	system("xmms2 play");
	    }
	    void pause()
	    {
		    system("xmms2 pause");
	    }
	    void set_default_path(std::string path)
	    {
	    	default_path = path;
	    }

};
