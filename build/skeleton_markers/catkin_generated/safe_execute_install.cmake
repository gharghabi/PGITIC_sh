execute_process(COMMAND "/home/shaghayegh/catkin_ws/build/skeleton_markers/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/shaghayegh/catkin_ws/build/skeleton_markers/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
