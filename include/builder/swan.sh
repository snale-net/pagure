#!/bin/bash

make mpi 2>&1 >&3 | tee -a $LOGFILE && leave
chmod +x swanrun 2>&1 >&3 | tee -a $LOGFILE && leave

mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp *.exe swanrun* machinefile $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
