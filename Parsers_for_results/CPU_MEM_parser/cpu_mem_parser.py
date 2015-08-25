######################## LDM CPU/MEM Usage calculator  ##############################
# Usage: python inputfile.txt 
# Example: python xxx.txt
# Author:Xiang Ji
# Email: xj4hm@virginia.edu
################################################################################
import sys

inputfile = sys.argv[1]

f = open(inputfile, 'r')

counter = 0
cpusum = 0
memsum = 0

for line in f:
    counter = counter + 1
    currentlist = line.split()
    cpusum += float(currentlist[0])
    memsum += float(currentlist[1])

print sys.argv[1]
print counter
print cpusum / float (counter)
print memsum / float (counter) 
    

