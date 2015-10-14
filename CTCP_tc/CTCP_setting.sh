
# CTCP setting, three value bw, inital, scale

bandwidth = $1
initial = $2
scale = $3

#/sbin/sysctl -w net.ipv4.tcp_congestion_control="ctcp"
echo $bandwidth > /sys/module/tcp_ctcp/parameters/bw
echo $initial > /sys/module/tcp_ctcp/parameters/initial

