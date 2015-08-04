#!/bin/bash

for i in `seq 1 288`; do 
	./rexmt_logger.sh &
 	sleep 300
done


