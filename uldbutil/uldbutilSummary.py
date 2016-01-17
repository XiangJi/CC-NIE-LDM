#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
File:   uldbutilSummary.py
Author: Xiang Ji
Email:  xj4hm@virginia.edu
Date:   January 16, 2016
Brief:  Statistic summary for LDM uldbutil report
Usage:  python uldbutilSummary.py <textfile>
'''


# sample uldbutil report line
#12942 6 feeder awipsops.nsstc.uah.edu 20160106205353.877 TS_ENDT {{CONDUIT,  ".(awip3d|0p50).[2]$"}} primary

# for each line, do 5 feedtype summary.
import sys

inputfile = sys.argv[1]
f = open(inputfile, 'r')

CONDUIT = 0
NGRID = 0
NEXRAD2 = 0
NEXRAD3 = 0
FSL2 = 0
total = 0
for line in f:
    total += 1
    if line.find('CONDUIT') != -1:
        CONDUIT += 1
    if line.find('NGRID') != -1:
        NGRID += 1
    if line.find('NEXRAD2') != -1:
        NEXRAD2 += 1
    if line.find('NEXRAD3') != -1:
        NEXRAD3 += 1
    if line.find('FSL2') != -1:
        FSL2 += 1

print '#CONDUIT: ' + str(CONDUIT)
print '#NGRID: ' + str(NGRID)
print '#NEXRAD2: ' + str(NEXRAD2)
print '#NEXRAD3: ' + str(NEXRAD3)
print '#FSL2: ' + str(FSL2)
print 'Total number of feeders: ' + str(total)