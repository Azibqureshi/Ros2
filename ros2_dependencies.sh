#!/usr/bin/env bash

# Software License Agreement (BSD)
#
# @author    Salman Omar Sohail <support@mybotshop.de>
# @copyright (c) 2024, MYBOTSHOP GmbH, Inc., All rights reserved.

RED='\033[0;31m'
DGREEN='\033[0;32m'
GREEN='\033[1;32m'
WHITE='\033[0;37m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' 
YELLOW='\033[1;33m'

function color_echo () {
    echo "$(tput setaf 1)$1$(tput sgr0)"
}

function install_gazebo_citadel () {
    sudo apt-get update -y
    sudo apt-get install lsb-release wget gnupg -y
    sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
    wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
    sudo apt-get update -y
    sudo apt-get install ignition-citadel -y
    sudo apt-get install ros-jazzy-ros-ign* -y
    }

function install_ros2_dependencies () {
    color_echo "Installing build pacakges."
    sudo apt-get install openssh*\
                         chrony\
                         sshpass\
                         neofetch\
                         libpcl-dev build-essential\
                         cmake\
                         libglfw3-dev\
                         libglew-dev\
                         libjsoncpp-dev\
                         libtclap-dev\
                         libeigen3-dev\
                         libboost-all-dev\
                         libboost-date-time-dev\
                         gstreamer1.0-plugins-base\
                         gstreamer1.0-plugins-good\
                         gstreamer1.0-plugins-bad\
                         gstreamer1.0-plugins-ugly\
                         gstreamer1.0-libav\
                         gstreamer1.0-tools\
                         gstreamer1.0-x\
                         gstreamer1.0-alsa\
                         gstreamer1.0-gl\
                         gstreamer1.0-gtk3\
                         gstreamer1.0-qt5\
                         gstreamer1.0-pulseaudio\
                         gstreamer1.0-tools\
                         libgstreamer1.0-dev\
                         libgstreamer-plugins-base1.0-dev\
                         libavcodec-dev\
                         libavformat-dev\
                         libavutil-dev\
                         libswscale-dev\
                         libgtk-3-dev\
                         git\
                         libbullet-dev \
                         python3-colcon-common-extensions \
                         python3-flake8 \
                         python3-pip \
                         python3-pytest-cov \
                         python3-rosdep \
                         python3-setuptools \
                         python3-vcstool \
                         espeak-ng \
                         wget -y

    pip3 install flask
    pip3 install playsound
    color_echo "Completed build dependencies."
}

function install_ros2_core_packages () {
    color_echo "Installing ros2 pacakges."
    sudo apt-get install ros-jazzy-robot-upstart\
                         ros-jazzy-teleop-twist-keyboard\
                         ros-jazzy-teleop-twist-joy\
                         ros-jazzy-geodesy\
                         ros-jazzy-image-transport-plugins\
                         ros-jazzy-pcl-ros\
                         ros-jazzy-nmea-msgs\
                         ros-jazzy-robot-localization\
                         ros-jazzy-interactive-marker-twist-server\
                         ros-jazzy-pointcloud-to-laserscan\
                         ros-jazzy-twist-mux\
                         ros-jazzy-rmw-cyclonedds-cpp\
                         ros-jazzy-rosidl-generator-dds-idl\
                         ros-jazzy-navigation2\
                         ros-jazzy-joint-state-publisher-gui\
                         ros-jazzy-ros2-control\
                         ros-jazzy-ros2-controllers\
                         ros-jazzy-gripper-controllers\
                         ros-jazzy-moveit\
                         ros-jazzy-gazebo-ros2-control\
                         ros-jazzy-moveit-servo\
                         ros-jazzy-xacro\
                         ros-jazzy-rviz-satellite\
                         ros-jazzy-imu-tools\
                         ros-jazzy-gazebo-*\
                         ros-jazzy-rqt-*\
                         ros-jazzy-phidgets-*\
                         ros-jazzy-nav2-* -y
}






                                                                                          
echo -e "${DGREEN}"
echo -e "  _  _  _  _  ____   __  ____  ____  _  _   __  ____  "
echo -e " ( \/ )( \/ )(  _ \ /  \(_  _)/ ___)/ )( \ /  \(  _ \ "
echo -e " / \/ \ )  /  ) _ ((  O ) )(  \___ \) __ ((  O )) __/ "
echo -e " \_)(_/(__/  (____/ \__/ (__) (____/\_)(_/ \__/(__)   "
echo -e "------------------------------------------------------"
echo -e "Installing Required Libraries and ROS dependencies!   "                                                                                                                                         
echo -e "------------------------------------------------------${NC}"

install_ros2_dependencies
install_ros2_core_packages
echo -e "${DGREEN}ROS2 Dependency Installation complete ${NC}"