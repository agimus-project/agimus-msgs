# MpcDebug.msg
# This message represents the residual value of a particular item of the cost or constraint

# Name of the cost/constraint item
string name

# Residual values.
# The size should be residual size times the number of nodes.
std_msgs/Float64MultiArray data
