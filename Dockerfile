FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

# Choose ROS & ROS2 distributions
ENV ROS_DISTRO noetic
ENV ROS2_DISTRO foxy


# Setting locale
RUN apt-get update && apt-get install -y locales && \
    dpkg-reconfigure locales && \
    locale-gen ja_JP ja_JP.UTF-8 && \
    update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8
ENV LC_ALL   ja_JP.UTF-8
ENV LANG     ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8

# Setting apt source list
RUN echo "-----UPDATE & Install apt sources-----"
RUN apt-get update && \
    apt-get install -y curl gnupg2 lsb-release git vim wget unzip net-tools

# Install Python
RUN echo "-----Install Python-----"
RUN apt install python3-pip -y && \
    apt install libgl1-mesa-dev -y && \
    pip3 install opencv-python && \
    pip3 install mysql-connector-python 

# Install ROS1
RUN echo "-----Install ROS-----"
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-get update && apt-get install -y ros-$ROS_DISTRO-desktop 
    

# ROS2パッケージのインストール
RUN echo "-----Install ROS2-----"
RUN sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    apt-get update && apt-get install -y ros-$ROS2_DISTRO-desktop

# Install ROS plugins 
RUN apt-get install -y python3-catkin-tools python3-colcon-common-extensions python3-rosdep python3-argcomplete
    

## 環境設定
#RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

RUN git clone https://github.com/ros2/ros1_bridge.git


# x serverの導入
RUN apt-get update && \
    apt-get install -y xserver-xorg x11-apps

# 開始ディレクトリ
WORKDIR /root/ros2_ws