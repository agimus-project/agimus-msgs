cmake_minimum_required(VERSION 3.22.1)
project(agimus_msgs)

# Find required packages
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(std_msgs REQUIRED)

# Define message files
rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/MpcInput.msg" "msg/MpcDebug.msg"
  DEPENDENCIES geometry_msgs std_msgs
)

ament_package()
