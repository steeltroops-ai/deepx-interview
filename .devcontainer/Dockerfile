# Use the official ROS 2 Humble image as a base
FROM osrf/ros:humble-desktop

# Set up a non-root user
ARG USERNAME=rosuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install additional dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    vim \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install any additional ROS 2 packages you need
RUN apt-get update && apt-get install -y \
    ros-humble-demo-nodes-cpp \
    ros-humble-demo-nodes-py \
    && rm -rf /var/lib/apt/lists/*

# Set up the workspace
WORKDIR /home/$USERNAME/ros2_ws
RUN mkdir src

# Switch to the non-root user
USER $USERNAME

# Source the ROS 2 setup file
RUN echo "source /opt/ros/humble/setup.bash" >> /home/$USERNAME/.bashrc

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "source /opt/ros/humble/setup.bash && exec bash"]