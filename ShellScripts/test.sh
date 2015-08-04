#!/bin/bash
set -e
#ldmadmin stop
export PATH=/home/ldm/bin:$PATH
ldmadmin delqueue
ldmadmin mkqueue
ldmadmin start -v