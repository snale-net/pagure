#!/bin/bash

./configure --prefix=$prefix/${dirinstall["$index"]} ${args["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave
