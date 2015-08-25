#!/bin/bash

cat log_cpu_mem_usage.txt | grep "25445" >> 1st_rec.txt
cat log_cpu_mem_usage.txt | grep "25446" >> 2nd_rec.txt
cat log_cpu_mem_usage.txt | grep "25447" >> 3rd_rec.txt
cat log_cpu_mem_usage.txt | grep "25454" >> 4th_rec.txt
cat log_cpu_mem_usage.txt | grep "25465" >> 5th_rec.txt



