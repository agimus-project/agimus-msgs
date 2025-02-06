# MpcDebug.msg
# This message represents debug data of the mpc.

# states predictions of the solver
# Size should be state dimension multiplied by the number of nodes
std_msgs/Float64MultiArray states_predictions

# control predictions of the solver
# Size should be control dimension multiplied by the number of nodes - 1
std_msgs/Float64MultiArray control_predictions

# collision distance residuals predictions of the solver
# Size should be number of collision pairs multiplied by the number of nodes
std_msgs/Float64MultiArray collision_distance_residuals

# KKT norm condition of the solver
float64 kkt_norm

# Number of iteration of the solver
int64 nb_iter

#  Number of QP iteration of the solver
int64 nb_qp_iter
