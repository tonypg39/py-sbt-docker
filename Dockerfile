# Use Ubuntu 20.04 LTS as the base image
# FROM tonypg39/rac-sim:latest

FROM ros:noetic-ros-base-focal


# Set non-interactive installation to avoid prompts hanging the build
ARG DEBIAN_FRONTEND=noninteractive

# Update the package repository and install updates
RUN apt-get update && apt-get upgrade -y 
# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-robot=1.5.0-1* git\
     ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control ros-noetic-catkin ros-noetic-interactive-markers \
     xterm nano \
    && rm -rf /var/lib/apt/lists/*


# Install any necessary dependencies or tools you need
# For example, if you need Git and Vim, you would add:
# RUN apt-get install -y git vim

# Set any environment variable you might need
# ENV TURTLEBOT3_MODEL=burger
RUN git clone https://github.com/tonypg39/manipulator_testing_phys_cov.git ~/manipulator_testing_phys_cov

# COPY ./manipulator_testing_phys_cov /root/catkin_ws/src/manipulator_testing_phys_cov

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
WORKDIR /root/catkin_ws/src
# RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; catkin_init_workspace /root/catkin_ws/src'

WORKDIR /root/catkin_ws
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd /root/catkin_ws; catkin_make'
RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Set the working directory inside the container
WORKDIR /root/catkin_ws/

# Run any command you need to initialize
# RUN some_command_to_run
# RUN "source /opt/ros/noetic/setup.bash"
# RUN "source ~/catkin_ws/devel/setup.bash"

# Command to run when the container starts
# CMD ["command_to_run"]