#!/bin/bash

sudo bash /home/ldm/ldm_performance/looper.sh &
sudo bash /home/ldm/ldm_performance/looper2.sh &
sudo bash /home/ldm/ldm_performance/looper_cpu_mem_usage.sh

sudo grep "AM\|PM\|packets" log_temp.txt >> log_tcpdump.txt 
sudo rm log_temp.txt
