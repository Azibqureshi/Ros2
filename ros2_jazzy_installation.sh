#!/usr/bin/env bash

# @author    Salman Omar Sohail <support@mybotshop.de>
# @copyright (c) 2024, MYBOTSHOP GmbH, Inc., All rights reserved.

RED='\033[0;31m'
YELLOW='\033[1;33m'
DGREEN='\033[0;32m'
GREEN='\033[1;32m'
WHITE='\033[0;37m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' 

echo -e "${DGREEN}"
echo -e "  _  _  _  _  ____   __  ____  ____  _  _   __  ____  "
echo -e " ( \/ )( \/ )(  _ \ /  \(_  _)/ ___)/ )( \ /  \(  _ \ "
echo -e " / \/ \ )  /  ) _ ((  O ) )(  \___ \) __ ((  O )) __/ "
echo -e " \_)(_/(__/  (____/ \__/ (__) (____/\_)(_/ \__/(__)   "
echo -e "${NC}"

function install_ubuntu_extras () {
    echo -e "${CYAN}Installing Ubuntu Extra Dependencies ${NC}"
    sudo apt-get install openssh*\
                         terminator\
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

    echo -e "${DGREEN}Ubuntu Extras Installed ${NC}"
}

function install_ros2_Jazzy() {

    echo -e "${CYAN}ROS2 Jazzy Installation ${NC}"

    echo -e "${YELLOW}Updating System ${NC}"
    sudo apt-get update -y
    locale # check for UTF-8

    echo -e "${YELLOW}Installing locales ${NC}"
    sudo apt update && sudo apt install locales
    sudo locale-gen en_US en_US.UTF-8
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
    export LANG=en_US.UTF-8

    locale # verify settings


    echo -e "${YELLOW}Installing Software Properties Common ${NC}"
    # Setup sources.list
    sudo apt install software-properties-common
    sudo add-apt-repository universe

    echo -e "${YELLOW}Installing Curl ${NC}"
    sudo apt update && sudo apt install curl -y

    echo -e "${YELLOW}Adding ROS2 Jazzy Repository ${NC}"
    sudo apt update && sudo apt install curl -y
    export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
    curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
    sudo dpkg -i /tmp/ros2-apt-source.deb
    
    echo -e "${YELLOW}Installing ROS2 Jazzy ${NC}"
    sudo apt-get update -y
    sudo apt install ros-jazzy-desktop -y

    echo -e "${YELLOW}Installing ROS2 Jazzy Development Tools ${NC}"
    sudo apt install ros-dev-tools -y

    # Replace ".bash" with your shell if you're not using bash
    echo -e "${YELLOW}Sourcing ROS2 Jazzy ${NC}"
    source /opt/ros/jazzy/setup.bash
    echo "" >>~/.bashrc
    echo "# ROS2 Jazzy" >>~/.bashrc
    echo "source /opt/ros/jazzy/setup.bash" >>~/.bashrc

    echo -e "${YELLOW}Performing ROS2 Jazzy rosdep update ${NC}"
    sudo rosdep init
    sudo rosdep update

    echo -e "${DGREEN}ROS2 Jazzy Installed ${NC}"
}

install_ubuntu_extras

install_ros2_Jazzy
