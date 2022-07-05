# syntax=docker/dockerfile:1.4

ARG BASE_IMAGE
FROM $BASE_IMAGE as base

RUN apt-get update && apt-get install -y \
    ros-$ROS_DISTRO-demo-nodes-cpp \
    ros-$ROS_DISTRO-rmw-fastrtps-cpp \
    ros-$ROS_DISTRO-rmw-cyclonedds-cpp \
    ros-$ROS_DISTRO-nav2-bringup \
    ros-$ROS_DISTRO-turtlebot3* \
    libncurses5-dev

WORKDIR /opt/iceoryx_tools
COPY ./iceoryx.repos ./iceoryx.repos
WORKDIR /opt/iceoryx_tools/src
RUN vcs import --shallow --input ../iceoryx.repos && \
    find ./ -mindepth 2 -maxdepth 2 -name "iceoryx*" | xargs rm -rf && \
    rm ./iceoryx/tools/introspection/COLCON_IGNORE

WORKDIR /opt/iceoryx_tools
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build

COPY ./cyclonedds.xml /etc/cyclonedds.xml
COPY ./entrypoint.sh /ros_entrypoint.sh