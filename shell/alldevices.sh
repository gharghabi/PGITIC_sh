#!/bin/bash


cmd=""
tab="--tab-with-profile=Default"

#kinect

cmd+=($tab -e "bash -c 'pkill markers.launch'; bash" -t "close_skeleton")
cmd+=($tab -e "bash -c 'sleep 6;roslaunch openni_launch openni.launch depth_registration:=true'; bash" -t "Core")


gnome-terminal --working-directory ~/catkin_ws "${cmd[@]}"
