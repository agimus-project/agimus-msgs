# MpcDebug.msg
# This message represents debug data of the mpc.

# Id that corresponds to the id of the trajectory point at the first node of this solver iteration.
int32 trajectory_point_id

# states predictions of the solver
# Size should be state dimension multiplied by the number of nodes
std_msgs/Float64MultiArray states_predictions

# control predictions of the solver
# Size should be control dimension multiplied by the number of nodes - 1
std_msgs/Float64MultiArray control_predictions

# list of residual values
agimus_msgs/Residual[] residuals

# list of references values
agimus_msgs/Residual[] references

# KKT norm condition of the solver
float64 kkt_norm

# Number of iteration of the solver
int64 nb_iter

#  Number of QP iteration of the solver
int64 nb_qp_iter
