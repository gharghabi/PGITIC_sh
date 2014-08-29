#!/bin/bash


cmd=""
tab="--tab-with-profile=Default"

#kinect


cmd+=($tab -e "bash -c 'roslaunch openni_launch openni.launch depth_registration:=true'; bash" -t "Core")
cmd+=($tab -e "bash -c 'sleep 6; pkill skeleton_markers'; bash" -t "close_skeleton")


gnome-terminal --working-directory ~/catkin_ws "${cmd[@]}"
