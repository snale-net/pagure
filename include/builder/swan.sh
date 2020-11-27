#!/bin/bash

make mpi 2>&1 >&3 | tee -a $LOGFILE && leave 1
chmod +x swanrun 2>&1 >&3 | tee -a $LOGFILE && leave 1
