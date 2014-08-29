cmake_minimum_required(VERSION 2.8.3)
project(upperbodycore)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS
  sensor_msgs
  cv_bridge
  roscpp
  rospy
  genmsg
  pcl_conversions
  pcl_ros
  tf
  std_msgs
  nav_msgs
  geometry_msgs
  image_transport
  message_generation
  actionlib
  actionlib_msgs 
  dynamixel_msgs
  upperbodycore_msgs
)

find_package(Boost COMPONENTS system thread date_time REQUIRED)
find_package(PkgConfig REQUIRED)
find_package(PCL 1.2 REQUIRED)
find_package(OpenCV 2.2 REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(EIGEN REQUIRED eigen3)

catkin_package(
      INCLUDE_DIRS include 
      CATKIN_DEPENDS message_runtime
)

add_library(libupperbody
            src/upperbodyclient.cpp
           )

include_directories(include ${catkin_INCLUDE_DIRS} ${EIGEN_INCLUDE_DIRS} ${SERIAL_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})
include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

#serial library for sepanta Hardware serial comunication
add_library(serial src/serial.cpp src/impl/unix.cpp)
target_link_libraries(serial rt libupperbody)

add_executable(upperbodycore src/upperbodycore.cpp)
target_link_libraries(upperbodycore ${catkin_LIBRARIES} ${Boost_LIBRARIES} serial )
add_dependencies(upperbodycore upperbodycore_msgs_generate_messages_cpp)

add_executable(sample src/sample.cpp)
target_link_libraries(sample ${catkin_LIBRARIES} ${Boost_LIBRARIES} serial libupperbody)
add_dependencies(sample upperbodycore_msgs_generate_messages_cpp)


