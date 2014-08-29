cmake_minimum_required(VERSION 2.8.3)

project(upperbodygui)
# Load catkin and all dependencies required for this package
find_package(catkin REQUIRED COMPONENTS rqt_gui rqt_gui_cpp image_transport sensor_msgs cv_bridge upperbodycore_msgs pcl_conversions pcl_ros)
find_package(PCL 1.2 REQUIRED)
find_package(Qt4 COMPONENTS QtCore QtGui REQUIRED)

include(${QT_USE_FILE})
include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

set(upperbodygui_SRCS
  src/upperbodygui/CameraCalibView.cpp
  src/upperbodygui/ratio_layouted_frame.cpp
)

set(upperbodygui_HDRS
  include/upperbodygui/CameraCalibView.h
  include/upperbodygui/ratio_layouted_frame.h
)

set(upperbodygui_UIS
  resources/camera_calib_view.ui
)

set(upperbodygui_INCLUDE_DIRECTORIES
  include
  ${CMAKE_CURRENT_BINARY_DIR}
  $ENV{AUTMAN_BASE_DIR}
)

catkin_package(
  INCLUDE_DIRS ${upperbodygui_INCLUDE_DIRECTORIES}
  LIBRARIES ${PROJECT_NAME}
  CATKIN_DEPENDS rqt_gui rqt_gui_cpp image_transport sensor_msgs cv_bridge upperbodycore_msgs 
)
catkin_python_setup()

qt4_wrap_cpp(upperbodygui_MOCS ${upperbodygui_HDRS})
qt4_wrap_ui(upperbodygui_UIS_H ${upperbodygui_UIS})

include_directories(${upperbodygui_INCLUDE_DIRECTORIES} ${catkin_INCLUDE_DIRS}) 
add_library(${PROJECT_NAME} ${upperbodygui_SRCS} ${upperbodygui_MOCS} ${upperbodygui_UIS_H})
target_link_libraries(${PROJECT_NAME} ${catkin_LIBRARIES} ${QT_QTCORE_LIBRARY} ${QT_QTGUI_LIBRARY})
add_dependencies(${PROJECT_NAME} upperbodycore_msgs_generate_messages_cpp)

find_package(class_loader)
class_loader_hide_library_symbols(${PROJECT_NAME})

install(FILES plugin.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(TARGETS ${PROJECT_NAME}
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION}
)

install(PROGRAMS scripts/upperbodygui
  DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION}
)
install(PROGRAMS scripts/upperbodygui
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)
