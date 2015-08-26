################################################################################################################################
# Calculate aggregate size average throughput from csv file which is gernerated by LDM log file
# Author: Xiang Ji
# Usage: python ratevstime.py [filename]
################################################################################################################################

import sys
import csv

inputfile = sys.argv[1]

outputfile = 'Throughput' + inputfile

writer = csv.writer(open(outputfile, 'wb', buffering=0))
writer.writerows([('AggregateID', 'Throughput(kbps)')])

f = open(inputfile, 'r')
sizelist = []
latencylist = []

## read the csv file [0] is size, [1] is latency
for line in f:
    currentlist = line.split(',')
    if currentlist[0].isdigit():
        sizelist.append(int(currentlist[0]))
        latencylist.append(int(currentlist[1]))

product_num = len(sizelist)
print sizelist[product_num - 1]
print latencylist[product_num - 1]


i = 0 # product counter

aggregateNum = 0
sizeSum = 0
delaySum = 0
## read each line and get a counter for sum aggregate size
for i in range (0, product_num - 1):
    if sizeSum <= 200 * 1000000:
        sizeSum = sizeSum + sizelist[i]
        delaySum = delaySum + latencylist[i]
    else:
        aggregateNum = aggregateNum + 1
        writer.writerows([(aggregateNum, sizeSum * 8 / float(delaySum))])
        sizeSum = 0
        delaySum = 0

# write the last group
writer.writerows([(aggregateNum, sizeSum * 8 / float(delaySum))])


## output each aggreate s / t to a csv file, column is aggregate sequence and throughput
## be careful to clear the last one, may be smaller than 200Mib
