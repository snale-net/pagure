#!/bin/bash

mv Makefile.regular Makefile 2>&1 >&3 | tee -a $LOGFILE && leave
make all 2>&1 >&3 | tee -a $LOGFILE && leave

# Install to dir
mkdir -p $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave
cp refdif1 datgen surface $prefix/${dirinstall["$index"]}/bin/. 2>&1 >&3 | tee -a $LOGFILE && leave
