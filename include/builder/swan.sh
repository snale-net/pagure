#!/bin/bash

# Version MPI
make mpi 2>&1 >&3 | tee -a $LOGFILE && leave
mv swan.exe swan_mpi.exe 2>&1 >&3 | tee -a $LOGFILE && leave

# Version OMP
make allclean
make omp 2>&1 >&3 | tee -a $LOGFILE && leave
mv swan.exe swan_omp.exe 2>&1 >&3 | tee -a $LOGFILE && leave

#
chmod +x swanrun 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp *.exe swanrun* machinefile $prefix/${dirinstall["$index"]}/bin/. 2>&1 >&3 | tee -a $LOGFILE && leave
