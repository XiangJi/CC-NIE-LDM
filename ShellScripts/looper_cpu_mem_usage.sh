#!/bin/bash

for i in `seq 1 431`; do 
        bash /home/ldm/ldm_performance/cpu_mem_usage.sh &
        sleep 60
done

