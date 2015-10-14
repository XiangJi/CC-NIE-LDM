#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""@package batch_job
Copyright (C) 2015 University of Virginia. All rights reserved.

file      batch_job.py
author    Shawn Chen <sc7cq@virginia.edu>
version   1.0
date      August 23, 2015

LICENSE
This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or（at your option）
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
more details at http://www.gnu.org/copyleft/gpl.html

brief     Launches batch jobs for a list of hosts.
"""

import logging
import sys
from fabric.api import env, run

# prevent a known caveat in fabric, which is caused by SSH banner missing.
logging.basicConfig()
paramiko_logger = logging.getLogger("paramiko.transport")
paramiko_logger.disabled = True

def read_hosts():
    """
    Reads host IP from sys.stdin line by line, expecting one per line.
    Appends a username for each IP so that it makes a complete login.
    Ignores the line starting with '#', which is considered as a comment.
    """
    env.hosts = []
    for line in sys.stdin.readlines():
        host = line.strip()
        if host and not host.startswith("#"):
            host = 'root@' + host
            env.hosts.append(host)

def simple_task():
    """
    Executes the actual command.
    """
    # executes a short command
    run("uptime")
    # executes a long-running command, dumps the prints from stdout by
    # setting pty to False.
    # But you should also make the script running detached in background
    # and redirecting outputs to /dev/null or some place else.
    run('uptime', pty=False)

def ldmCreate():
    """
    Create the ldm account
    """
    run("useradd ldm")

def ldmPasswd():
    """
    Change ldm password
    """
    run("echo 123456 | passwd ldm --stdin")

def yumInstall():
    """
    System action based on definition
    """
    run("yum -y install kernel-devel-2.6.32-573.1.1.el6.x86_64")

def runNTP():
    """
    Run NTP
    """
    run("service ntpd start")
def suLDM():
    """
    Switch to ldm account
    """
    run("su - ldm")

def downloadFile():
    """
    Download to ldm account
    """
    run("wget http://www.ece.virginia.edu/cheetah/software/ctcp/CTCP.tar.gz")

def tarFile():
    run("tar -xvf CTCP.tar.gz")

def makeCTCP():
    run('make', pty=False)

def insertCTCP():
    run("insmod ./tcp_ctcp.ko")

def setCTCP():
    run("sysctl -w net.ipv4.tcp_congestion_control=ctcp")
