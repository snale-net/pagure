#!/bin/bash

echo $"${args["$index"]}" | xargs ./configure --prefix=$prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
make 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave
