cmake_minimum_required(VERSION 2.8.3)
project(pgitic_record_motors)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  sensor_msgs
  cv_bridge
  roscpp
  rospy
  std_msgs
  genmsg
  pcl_conversions
  pcl_ros
  image_transport
  message_generation
  actionlib
  actionlib_msgs
  upperbodycore_msgs
)

## Find catkin and any catkin packages

find_package(Boost COMPONENTS system thread date_time REQUIRED)
find_package(PkgConfig REQUIRED)
find_package(PCL REQUIRED)
find_package(OpenCV 2.2 REQUIRED)
find_package(Boost REQUIRED COMPONENTS system thread)
pkg_check_modules(EIGEN REQUIRED eigen3)


## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)


## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## To declare and build messages, services or actions from within this
## package, follow these steps:
## * Let MSG_DEP_SET be the set of packages whose message types you use in
##   your messages/services/actions (e.g. std_msgs, actionlib_msgs, ...).
## * In the file package.xml:
##   * add a build_depend and a run_depend tag for each package in MSG_DEP_SET
##   * If MSG_DEP_SET isn't empty the following dependencies might have been
##     pulled in transitively but can be declared for certainty nonetheless:
##     * add a build_depend tag for "message_generation"
##     * add a run_depend tag for "message_runtime"
## * In this file (CMakeLists.txt):
##   * add "message_generation" and every package in MSG_DEP_SET to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * add "message_runtime" and every package in MSG_DEP_SET to
##     catkin_package(CATKIN_DEPENDS ...)
##   * uncomment the add_*_files sections below as needed
##     and list every .msg/.srv/.action file to be processed
##   * uncomment the generate_messages entry below
##   * add every package in MSG_DEP_SET to generate_messages(DEPENDENCIES ...)

##Generate messages in the 'msg' folder
# add_action_files(
 # DIRECTORY action
  #FILES Fibonacci.action
#)

#add_message_files(
 #  	FILES
#	upperbodycore_msgs/jointPO.msg
#	upperbodycore_msgs/GestureDetect.msg
# )

 
## Generate services in the 'srv' folder
# add_service_files(
 #  FILES
  # AddTwoInts.srv
 #)

## Generate actions in the 'action' folder
#add_action_files(
#   DIRECTORY action
#   FILES
#   whatDidYouSay.action
# )

#generate_messages(DEPENDENCIES std_msgs actionlib_msgs)
## Generate added messages and services with any dependencies listed here


###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
)
#  INCLUDE_DIRS include
#  LIBRARIES beginner_turorials
#  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib


###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(include  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS})

  
 add_library(pgitic_record_motor_lib
 src/RecordAndPlay_motors.cpp
 )
 
 target_link_libraries(pgitic_record_motor_lib ${OpenCV_LIBS} ${catkin_LIBRARIES})

 



add_executable(record_motor src/record_motor.cpp)
target_link_libraries(record_motor  ${catkin_LIBRARIES})
add_dependencies(record_motor  upperbodycore_msgs_generate_messages_cpp)


add_executable(sample_recordmotor src/sample_recordmotor.cpp)
target_link_libraries(sample_recordmotor  ${catkin_LIBRARIES} pgitic_record_motor_lib)
add_dependencies(sample_recordmotor  upperbodycore_msgs_generate_messages_cpp)


add_executable(record_motor_core src/record_motor_core.cpp)
target_link_libraries(record_motor_core  ${catkin_LIBRARIES} pgitic_record_motor_lib)
add_dependencies(record_motor_core  upperbodycore_msgs_generate_messages_cpp)


#add_executable(speech src/speech.cpp)
#target_link_libraries(speech ${catkin_LIBRARIES})
#add_dependencies(speech athomerobot_msgs_generate_messages_cpp)

# %EndTag(FULLTEXT)%
