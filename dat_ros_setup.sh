# This is a bash script used to install the ROS Medolic and UUV Sim enviroment
# Script asumes that you are on Ubuntu 18.04 LTS and do not have an install of ROS on the system 

# Created By Matthew Cockburn

# setup ROS source list 
echo "Setting up ROS source list for apt"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' 
# set up your key
sudo apt install curl -y 

curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - 

# Installation 

sudo apt update -y

echo "Install ROS Melodic"
# Installing ROS Melodic Desktop
sudo apt install ros-melodic-desktop-full -y 

sudo apt search ros-melodic
# Adding ROS Alias
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc

echo "Installing ROS Melodic Dependiences"
# Installing ROS dependenices 
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y

sudo apt install python-rosdep -y

sudo rosdep init

rosdep update

echo "Installing Catkin Tools"
# Installing Catkin Tools
sudo apt-get install python3-catkin-tools -y

sudo apt install ros-melodic-uuv-simulator -y

cd ~

mkdir -p ~/catkin_ws/src

cd ~/catkin_ws/src
# Cloning repos
git clone https://github.com/uuvsimulator/uuv_simulator.git
git clone https://github.com/dalAUV/node_examples.git

# Adding Aliases 
echo "source /usr/share/gazebo-9/setup.sh" >> ~/.bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

source ~/.bashrc

cd ~/catkin_ws 
# Building Examples 
catkin_init

catkin build node_examples

echo "Installation Finished"
