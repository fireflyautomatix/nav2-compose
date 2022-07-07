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
