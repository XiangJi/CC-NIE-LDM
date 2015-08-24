#!/bin/bash

##### Network Analysis Script by Joseph Slezak ###
##### Email : jjs358@scarletmail.rutgers.edu #####
 
# This script will capture packets from a specified interface and port defined
# below using tcpdump. The packets will then be analyized using tcptrace, and
# will have output directed into a .txt file. The time duration for packet
# capture should be specified, in seconds, following the -G arguement. Be sure 
# the sleep in looper.sh matches the time in -G.
# Also be sure to change to the desired interface,
# and the corresponding port number to be tested.

date '+%X' >> log_temp.txt
#echo "Logger tcpdump Started:" >> log.txt
sudo tcpdump -s 70 -i em1 port 388 -w temporary.pcap &>> log_temp.txt &
pid=$!
sleep 300 
sudo kill -s SIGINT $pid &>> log_temp.txt
#echo "Logger tcpdump Complete" >> log.txt
# Output will be in log.txt

#/usr/sbin/tshark -r temporary.pcap -q -z io,stat,10,"COUNT(tcp.analysis.retransmission)tcp.analysis.retransmission","COUNT(tcp.analysis.out_of_order)tcp.analysis.out_of_order"  >> rexmt_log.txt

date '+%X' >> log_tcptrace.txt 
#echo "Logger tcptrace Begins:" >> log.txt
sudo tcptrace -l temporary.pcap | grep "host\|total packets\|rexmt data pkts\|outoforder\|actual data bytes" >> log_tcptrace.txt
#echo "Logger tcptrace Completed" >> log.txt

	
sudo rm -f temporary.pcap

# End of script
