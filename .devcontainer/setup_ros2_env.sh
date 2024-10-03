#!/bin/bash

# Update and upgrade
sudo apt update && sudo apt upgrade -y

# Install additional development tools
sudo apt install -y \
    git \
    cmake \
    python3-pip \
    python3-pytest-cov \
    ros-foxy-rqt \
    ros-foxy-rqt-common-plugins \
    ros-foxy-rviz2

# Install code quality tools
pip3 install \
    flake8 \
    black \
    mypy \
    pylint

# Install ROS 2 development tools
sudo apt install -y \
    ros-foxy-ament-cmake \
    ros-foxy-ament-lint-auto \
    ros-foxy-ament-lint-common

# Setup Git configuration
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Create a catkin workspace
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws
colcon build

# Add workspace to .bashrc
echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc

# Setup ROS 2 environment variables
echo "export ROS_DOMAIN_ID=30" >> ~/.bashrc
echo "export ROS_LOCALHOST_ONLY=1" >> ~/.bashrc

# Create a .gitignore file
echo "build/
install/
log/
*.pyc
*.swp
.vscode/
" > ~/ros2_ws/.gitignore

# Setup pre-commit hooks
pip3 install pre-commit
echo "repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v3.4.0
    hooks:
    -   id: trailing-whitespace
    -   id: end-of-file-fixer
    -   id: check-yaml
    -   id: check-added-large-files
-   repo: https://github.com/psf/black
    rev: 20.8b1
    hooks:
    -   id: black
-   repo: https://gitlab.com/pycqa/flake8
    rev: 3.8.4
    hooks:
    -   id: flake8
" > ~/ros2_ws/.pre-commit-config.yaml

# Initialize pre-commit
cd ~/ros2_ws
pre-commit install

# Source the new .bashrc
source ~/.bashrc

echo "Professional ROS 2 development environment setup complete!"