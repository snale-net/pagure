#!/bin/bash

make all 2>&1 >&3 | tee -a $LOGFILE && leave
make libseqneeded 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r lib $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r libseq/libmpiseq* $prefix/${dirinstall["$index"]}/lib/. 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r include $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave	 
