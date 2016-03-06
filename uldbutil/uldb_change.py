#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
File:   uldb_change.py
Author: Xiang Ji / Joseph Slezak
Email:  xj4hm@virginia.edu / jjs358@scarletmail.rutgers.edu
Date:   March 1, 2016
Brief:  Statistic summary for LDM uldbutil report changes over multiple hours
Usage:  Call program from cron (hourly, 5 to 10 minutes after the hour) as: python uldb_change.py 
'''


#     sample uldbutil report line
#    12942 6 feeder awipsops.nsstc.uah.edu 20160106205353.877 TS_ENDT {{CONDUIT,  ".(awip3d|0p50).[2]$"}} primary


import csv
import datetime
import os.path

#    Sample uldb log file name:
#    uldb-2016-03-01T20_00.out

nowfile = datetime.datetime.utcnow().strftime("uldb-%Y-%m-%dT%H:00.out")
# for testing purposes
#nowfile = 'uldb-2016-03-02T02_00.out'

# Get path of the current dir, then use it to create paths:
CURRENT_DIR = os.path.dirname(__file__)
file_path = os.path.join(CURRENT_DIR, nowfile)

f = open(file_path, 'r')

# for each line, do 5 feedtype summary.
CONDUIT = 0
NGRID = 0
NEXRAD2 = 0
NEXRAD3 = 0
FSL2 = 0
TOTAL = 0
for line in f:
    TOTAL += 1
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

#For debugging purposes:
#print '#CONDUIT: ' + str(CONDUIT) 
#print '#NGRID: ' + str(NGRID)
#print '#NEXRAD2: ' + str(NEXRAD2)
#print '#NEXRAD3: ' + str(NEXRAD3)
#print '#FSL2: ' + str(FSL2)
#print 'Total number of feeders: ' + str(TOTAL)

data = [[CONDUIT,NGRID,NEXRAD2,NEXRAD3,FSL2,TOTAL]]

#Line 66 and 67 are used in lines 74 and 75 (avoids repeating the CSV header)
csvpath = os.path.join(CURRENT_DIR, 'uldb_summary.csv')
file_exists = os.path.isfile(csvpath)

with open (csvpath, 'ab') as testfile:
    names = ['CONDUIT','NGRID','NEXRAD2','NEXRAD3','FSL2','TOTAL']
    csv_writer = csv.DictWriter(testfile, delimiter=",", fieldnames=names)

    #If the file does not exist yet (first run), write a CSV header
    if not file_exists:
        csv_writer.writeheader()  
    
    csv_writer2 = csv.writer(testfile, delimiter=",")
    csv_writer2.writerows(data)
    
