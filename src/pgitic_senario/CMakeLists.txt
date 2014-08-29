cmake_minimum_required(VERSION 2.8.3)
project(pgitic_senario)


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


catkin_package(
)


## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(include

  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS})

  
  #include_directories(/usr/include/vtk-5.8)
## Declare a cpp library
# add_library(beginner_turorials
#   src/${PROJECT_NAME}/beginner_turorials.cpp
# )

## Declare a cpp executable
# add_executable(beginner_turorials_node src/beginner_turorials_node.cpp)

## Add cmake target dependencies of the executable/library
## as an example, message headers may need to be generated before nodes
# add_dependencies(beginner_turorials_node athomerobot_msgs_generate_messages_cpp)

## Specify libraries to link a library or executable target against
# target_link_libraries(beginner_turorials_node
#   ${catkin_LIBRARIES}
# )

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS beginner_turorials beginner_turorials_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_beginner_turorials.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)


add_executable(senario src/senario.cpp)
target_link_libraries(senario  ${catkin_LIBRARIES} pgitic_skeleton_lib pgitic_wave_lib)
add_dependencies(senario  upperbodycore_msgs_generate_messages_cpp)




#add_executable(speech src/speech.cpp)
#target_link_libraries(speech ${catkin_LIBRARIES})
#add_dependencies(speech athomerobot_msgs_generate_messages_cpp)

# %EndTag(FULLTEXT)%
