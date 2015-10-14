# tc setting with tbf

tc qdisc add dev eth1 root tbf rate 20mbit burst 50kb limit 1.64mbit
tc -s qdisc show dev eth1
