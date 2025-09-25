# End-effector frame name
string frame_id

# Target end-effector frame pose in the urdf root frame
# Pose includes position (x, y, z) and orientation as a quaternion (x, y, z, w)
geometry_msgs/Pose pose
# Corresponding cost weights
float64[6] w_pose

# Twist includes linear velocities (x, y, z) and angular velocities (r, p, y)
geometry_msgs/Twist twist
# Corresponding cost weights
float64[6] w_twist

# Twist includes linear forces and torques
geometry_msgs/Wrench force
# Corresponding cost weights
float64[6] w_force
