#!/bin/bash

##### Retransmission Script by Joseph Slezak #####
	##### !fdt-rutgers configuration! #####
##### Email : jjs358@scarletmail.rutgers.edu #####
 
# This script will capture packets from a specified interface and port defined
# below using tcpdump. The packets will then be analyized using tcptrace, and
# will have output directed into a .txt file. The time duration for packet
# capture should be specified, in seconds, following the sleep 
# command below. Also be sure to change eth2 to the desired interface,
# and the corresponding port number to be tested.

date '+%X' >> rexmt_log.txt
sudo /usr/sbin/tcpdump -w temporary.pcap -i eth2 port 388 &	
pid=$!
sleep 240
sudo kill -s SIGINT $pid

# Output will be in rexmt_log.txt
sudo tcptrace -l temporary.pcap | grep "rexmt" >> rexmt_log.txt

#date '+%X' >> rexmt_log.txt
	
rm -f temporary.pcap

# End of script
