

################################################
# Create data for rate vs time from log file
# Author: Xiang Ji
# Usage: python ratevstime.py [filename]
################################################
import csv
import sys

inputfile = sys.argv[1]


outputfile = 'rate' + inputfile 

writer = csv.writer(open(outputfile, 'wb', buffering=0))
writer.writerows([('rate', 'minutes')])

f = open(inputfile, 'r')
sizelist = []
timelist = []

for line in f:
    currentlist = line.split(',')
    if currentlist[0].isdigit():
        sizelist.append(int(currentlist[0]))
        timelist.append(int(currentlist[1]))


product_num = len(sizelist)

print sizelist[product_num - 1]
print timelist[product_num - 1]

i = 0 # minute counter
j = 0 # index counter


while i < 1440:
    accum = 0
    while timelist[j] >= 60000 * i and timelist[j] < 60000 * (i + 1):
        if j == product_num - 1:
            break
        else:
            accum = accum + sizelist[j]
            j = j + 1
        #print accum
    writer.writerows([(accum * 8 /float((60 * 1000000)), i)])
    i = i + 1
f.close()

