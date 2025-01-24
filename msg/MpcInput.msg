# MpcInput.msg
# This message represents the state of a robot, including joint values, velocities, accelerations,
# and the target end-effector pose.

# Joint positions (rad for revolute joints or meters for prismatic joints)
# Length of the list should match the number of robot joints
float64[] q
# Corresponding cost weights
float64[] w_q

# Joint velocities (rad/s for revolute joints or m/s for prismatic joints)
# Length should match the number of robot joints
float64[] qdot
# Corresponding cost weights
float64[] w_qdot

# Joint accelerations (rad/s^2 for revolute joints or m/s^2 for prismatic joints)
# Length should match the number of robot joints
float64[] qddot
# Corresponding cost weights
float64[] w_qddot

# Joint effort
# Length should match the number of robot joints
float64[] robot_effort
# Corresponding cost weights
float64[] w_robot_effort

# Target end-effector frame pose in the urdf root frame
# Pose includes position (x, y, z) and orientation as a quaternion (x, y, z, w)
geometry_msgs/Pose pose
# Corresponding cost weights
float64[6] w_pose

# End-effector frame name
string ee_frame_name
