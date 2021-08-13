#!/bin/bash

echo $"${args["$index"]}" | xargs ./bootstrap.sh --prefix=$prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
if [ "$mpilib" != "none" ]; then
    echo "using mpi ;" >> ./project-config.jam
fi
./b2 install 2>&1 >&3 | tee -a $LOGFILE && leave

