#!/bin/bash

# Version seq
make ser 2>&1 >&3 | tee -a $LOGFILE && leave

# Install to dir
chmod +x swashrun 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir -p $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave
cp *.exe swashrun* machinefile $prefix/${dirinstall["$index"]}/bin/. 2>&1 >&3 | tee -a $LOGFILE && leave
