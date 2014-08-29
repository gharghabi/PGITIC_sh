#include "ros/ros.h"
#include <stdio.h>
#include <stdlib.h>
#include "std_msgs/Int32.h"
#include "std_msgs/String.h"
#include <boost/thread.hpp>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/core/core.hpp>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <opencv2/objdetect/objdetect.hpp>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <ros/package.h>
#include <pcl/io/openni_grabber.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/io/pcd_io.h>
#include <pcl/io/png_io.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_ros/point_cloud.h>
#include <sensor_msgs/CameraInfo.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/Image.h>
#include <stereo_msgs/DisparityImage.h>
#include <sensor_msgs/PointCloud2.h>
using namespace std;
using namespace cv;


Mat globalImage;
pcl::PointCloud<pcl::PointXYZRGB> globalcloud;

struct position
{
    float x;
    float y;
    float z;
};

position DetectColor(string color);
void rosImage_CB(const sensor_msgs::ImageConstPtr &msg);
void PointCloud_CB(const sensor_msgs::PointCloud2::ConstPtr &msg);
void  get_HSV_range_color(int (&range)[6]);
position calcPosition (std::vector<cv::Point> contours);

int main(int argc, char **argv)
{
    ros::init(argc, argv, "ramp_detection");

    ros::NodeHandle n_[12];
    usleep(10000);

    image_transport::ImageTransport imageTransport(n_[0]);
    image_transport::Subscriber imageSubscriber;
    imageSubscriber = imageTransport.subscribe( "/camera/rgb/image_color", 1, rosImage_CB);
    ros::Subscriber PCSubscriber = n_[1].subscribe("/camera/depth_registered/points", 1, PointCloud_CB);
    ros::spin();

    return 0;
}
void get_HSV_range_color(int (&range)[6])
{
			Mat imgHSV;
	        cvtColor(globalImage, imgHSV, COLOR_BGR2HSV); //Convert the captured frame from BGR to HSV
            cv::Vec3i pixel;
            Point3_<uchar>* p;
            int minx = 10000;
            int miny = 10000;
            int minz = 10000;
            int maxx = 0;
            int maxy = 0;
            int maxz = 0;
            for (int w = 0; w<imgHSV.size().width; ++w)
            {
                for (int h = 0; h<imgHSV.size().height;++h )
                {
                    p = imgHSV.ptr<Point3_<uchar> >(h,w);
                   // std::cout<<p->x<<" 0 "<<p->y<<" 1 "<<p->z<<" 2"<< std::endl;
                    if ((p->x)<minx)
                        minx = p->x;
                    if ((p->y)<miny)
                        miny = p->y;
                    if ((p->z)<minz)
                        minz = p->z;
                    if ((p->x)>maxx)
                        maxx = p->x;
                    if ((p->y)>maxy)
                        maxy = p->y;
                    if ((p->z)>maxz)
                        maxz = p->z;
                    // std::cout<<int(p->x)<<" h "<<int(p->y)<<" s "<<int(p->z)<<" v "<<std::endl;
                }
            }
            range[0] = minx;
            range[1] = miny;
            range[2] = minz;
            range[3] = maxx;
            range[4] = maxy;
            range[5] = maxz;
      
        // std::cout<<"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"<<minx<<" mix "<<miny<<" miy "<<minz<<" miz "<<maxx<<" max" <<maxy<<" may "<<maxz<<" maz "<<std::endl;
        // waitKey(0);
        // ros::shutdown();

}
position DetectColor(string color, int sizeC)
{
  //  std::cout << "detector_Color" << std::endl;
    std::vector<std::vector<cv::Point> > contours;
    position coordinate;
    coordinate.x = 0;
    coordinate.z = 0;
    RNG rng(12345);
    std::vector<cv::Vec4i> hierarchy;
    Point2f MaxRegCenter;
    Mat temimg;
    globalImage.copyTo(temimg);

    if (temimg.size().width != 0)
    {
        int iLowH, iLowS, iLowV, iHighH, iHighS, iHighV;
        if (color == "red")
        {
            iLowH = 0;
            iLowS = 177;
            iLowV = 237;
            iHighH = 0;
            iHighS = 255;
            iHighV = 255;
        }
        else if (color == "blue")
        {
            //abi roshan
            // ROS_INFO("blue");
            // iLowH = 98;
            // iLowS = 50;
            // iLowV = 80;
            // iHighH = 137;
            // iHighS = 255;
            // iHighV = 255;

            //abi tire
            iLowH = 98;
            iLowS = 100;
            iLowV = 175;
            iHighH = 111;
            iHighS = 199;
            iHighV = 254;


            // //abi tire
            // iLowH = 103;
            // iLowS = 120;
            // iLowV = 175;
            // iHighH = 111;
            // iHighS = 199;
            // iHighV = 254;
            //??????????

            // iLowH = 98;
            // iLowS = 50;
            // iLowV = 80;
            // iHighH = 111;
            // iHighS = 255;
            // iHighV = 254;

        }
        else if (color == "yellow")
        {
            ROS_INFO("yelloqw");
            iLowH = 25;
            iLowS = 34;
            iLowV = 101;
            iHighH = 40;
            iHighS = 254;
            iHighV = 254;
        }
        else if ((color == "black"))
        {
            iLowH = 104;
            iLowS = 0;
            iLowV = 0;
            iHighH = 104;
            iHighS = 9;
            iHighV = 80;
        }
        else if ((color == "green"))
        {

        //sabze roshan
            // iLowH = 41;
            // iLowS = 52;
            // iLowV = 170;
            // iHighH = 85;
            // iHighS = 225;
            // iHighV = 224;
        //sabze tire
            iLowH = 41;
            iLowS = 41;
            iLowV = 98;
            iHighH = 102;
            iHighS = 253;
            iHighV = 203;
        //sabz
            // iLowH = 41;
            // iLowS = 41;
            // iLowV = 98;
            // iHighH = 102;
            // iHighS = 253;
            // iHighV = 223;
        }

        Mat imgHSV;

        Mat imgThresholded = Mat::zeros( globalImage.size(), CV_8UC3 );

        ROS_INFO("detectcolo4");
        int thresh = 100;
        int max_thresh = 255;
        cvtColor(temimg, imgHSV, COLOR_BGR2HSV); //Convert the captured frame from BGR to HSV
        ROS_INFO("slam2");


        inRange(imgHSV, Scalar(iLowH, iLowS, iLowV), Scalar(iHighH, iHighS, iHighV), imgThresholded); //Threshold the image
        //morphological opening (removes small objects from the foreground)


        Mat medianImg;
        medianBlur(imgThresholded, medianImg, 21);

        imshow("medianImg", medianImg);
        waitKey(10);

        Canny( medianImg, medianImg, thresh, thresh * 2, 3 );

        cv::findContours( medianImg, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, cv::Point(0, 0) );
        //  cv::drawContours(globalImage, contours, -1, Scalar::all(255), CV_FILLED);
        // ROS_INFO("570");
        // std::cout<<globalImage.size().width<<" width "<<globalImage.size().height<<" height "<<imgThresholded.size().width<<" width "<<imgThresholded.size().height<<" heith "<<std::endl;
        // Mat resultimg = globalImage & imgThresholded;
        // cvNamedWindow( "object_position", 1);
        // cv::imshow("object_position",imgThresholded);



        ////////////////////>>>>>>>>>>> accecing contours <<<<<<<<<<<<<<<<<<<<<<

        //// >>>>>>>> find centers
        /// Get the moments
        if (contours.size() != 0)
        {

            vector<Moments> mu(contours.size() );
            for ( int i = 0; i < contours.size(); i++ )
            {
                mu[i] = moments( contours[i], false );
            }

            ///  Get the mass centers:
            vector<Point2f> centers( contours.size() ); // mc -> centers
            for ( int i = 0; i < contours.size(); i++ )
            {
                centers[i] = Point2f( mu[i].m10 / mu[i].m00 , mu[i].m01 / mu[i].m00 );
            }

            /// Draw contours
            Mat drawing = Mat::zeros( imgThresholded.size(), CV_8UC3 );

            /// Calculate the area with the moments 00 and compare with the result of the OpenCV function

            const float bad_point = std::numeric_limits<float>::quiet_NaN();
            float MaxArea = -1;
            int MaxAreaIdx = -1;
            for ( int i = 0; i < contours.size(); i++ )
            {
                //printf(" * Contour[%d] - Area (M_00) = %.2f - Area OpenCV: %.2f - Length: %.2f \n", i, mu[i].m00, contourArea(contours[i]), arcLength( contours[i], true ) );
                // if (contourArea(contours[i]) > 100)
                // {
                if ( contourArea(contours[i]) > MaxArea)
                {
                    MaxArea = contourArea(contours[i]);
                    MaxAreaIdx = i;
     
                    // Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255) );
                    // drawContours( imgThresholded, contours, i, color, 2, 8, hierarchy, 0, Point() );
                    // circle( imgThresholded, centers[i], 4, color, -1, 8, 0 );
                }

                //}
            }
            //Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0,255), rng.uniform(0,255) );
            //drawContours( drawing, contours, i, color, 2, 8, hierarchy, 0, Point() );
            //circle( drawing, mc[i], 4, color, -1, 8, 0 );
                    //?
            if (MaxArea != -1)
            {
                  MaxRegCenter = centers[MaxArea];
                //?MaxRegCenter = centers[MaxArea];
            }
            if (MaxAreaIdx != -1)
            {
                if (contours[MaxAreaIdx].size() > sizeC)
                {

                    ROS_INFO("contoursize %d",sizeC);
                    // Mat drawing = Mat::zeros(imgThresholded.size(), CV_8UC3 );
                    Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255) );
                    drawContours( drawing, contours, MaxAreaIdx, color, 2, 8, hierarchy, 0, Point() );
                    circle( drawing, centers[MaxAreaIdx], 4, color, -1, 8, 0 );
                    coordinate = calcPosition(contours[MaxAreaIdx]);
                    std::cout<<coordinate.x<<" coordinatex "<<coordinate.y<<" coordinatey "<<coordinate.z<<" coordinate.z "<<endl;
                }
            }

            if (drawing.size().width != 0)
            {
                imshow( "Contours2", drawing );
                waitKey(10);
            }
            boost::this_thread::sleep(boost::posix_time::milliseconds(1000));
            cout << "fshow_countours2" << endl;
        }
    }
    return coordinate;

}
position calcPosition (std::vector<cv::Point> contours)
{
    position World_Pose;
    int cnt_z = 0;
    int cnt_y = 0;
    int cnt_x = 0;
    pcl::PointXYZ p1;

    if (globalcloud.size() != 0)
    {
        for ( int b = 0; b < contours.size();  b++ )
        {
            p1.x = globalcloud.at(contours[b].x, contours[b].y).x;
            p1.y = globalcloud.at(contours[b].x, contours[b].y).y;
            p1.z = globalcloud.at(contours[b].x, contours[b].y).z;

            if ( !isnan(p1.x))
            {
                World_Pose.x += p1.x;
                cnt_x++;
            }
            if ( !isnan(p1.y))
            {
                World_Pose.y += p1.y;
                cnt_y++;
            }
            if ( !isnan(p1.z) && (p1.z > 0))
            {
                World_Pose.z += p1.z;
                cnt_z++;
            }
        }
        if ((cnt_x != 0) && (cnt_y != 0) && (cnt_z != 0))
        {
            World_Pose.x = World_Pose.x / cnt_x;
            World_Pose.y = World_Pose.y / cnt_y;
            World_Pose.z = World_Pose.z / cnt_z;
        }
        // printf(" [%f, %f] ", World_Pose.x, World_Pose.z );
    }
    return World_Pose;
}

void rosImage_CB(const sensor_msgs::ImageConstPtr &msg)
{
    cv_bridge::CvImagePtr imagePointer;
    try
    {
        imagePointer = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception &e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }
        globalImage = imagePointer->image;
        // imshow("windowerror", imageG);
        // waitKey(3);  

    //DetectColor("yellow");
    //DetectFaceForBlob();
}
void PointCloud_CB(const sensor_msgs::PointCloud2::ConstPtr &msg)
{
    pcl::fromROSMsg(*msg, globalcloud);
}