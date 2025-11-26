#!/bin/bash

NOCONFIGURE=defined ./autogen.sh 2>&1 >&3 | tee -a $LOGFILE && leave
echo $"${args["$index"]}" | xargs ./configure --prefix=$prefix/${dirinstall["$index"]} --libdir=$prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 | tee -a $LOGFILE && leave
