export ROS_DISTRO=humble
source /opt/ros/$ROS_DISTRO/setup.bash


alias rclw='cd ~/catkin_ws'  # Go to your ROS workspace
alias rclb='cd ~/catkin_ws && colcon build' # Build your workspace
alias rcls='source ~/catkin_ws/install/setup.bash' # Source your workspace
