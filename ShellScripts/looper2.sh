#!/bin/bash

#Time offset between two parallel tcpdumps/tcptraces
sleep 300

for i in `seq 1 43`; do 
	bash /home/ldm/ldm_performance/logger2.sh &
	sleep 600
done


