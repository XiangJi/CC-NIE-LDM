#!/bin/bash

#For 7 hour (+10 min buffer) test use seq 1 in 43 (44 in looper.sh, and 43 in looper2.sh) and sleep 600 here 
#and sleep 300 in tcpdump

for i in `seq 1 44`; do 
	bash /home/ldm/ldm_performance/logger.sh &
	sleep 600
done


