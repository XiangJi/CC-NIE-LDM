#!/bin/bash
set -e
#ldmadmin stop

export PATH=/home/ldm/bin:$PATH
export MANPATH=/home/ldm/share/man:$MANPATH 

ldmadmin delqueue
ldmadmin mkqueue
ldmadmin start -v
nohup sudo bash /home/ldm/ldm_performance/master_script.sh &