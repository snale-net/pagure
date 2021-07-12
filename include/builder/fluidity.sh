#!/bin/bash

echo $"${args["$index"]}" | xargs ./configure --prefix=$prefix/${dirinstall["$index"]} --libdir=$prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
make -j clean  2>&1 >&3 | tee -a $LOGFILE && leave
make -j 2>&1 >&3 | tee -a $LOGFILE && leave
make -j fltools 2>&1 >&3 | tee -a $LOGFILE && leave
make -j install 2>&1 >&3 | tee -a $LOGFILE && leave
make test 2>&1 >&3 | tee -a $LOGFILE && leave

