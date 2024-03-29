#!/bin/bash

cp spatialindex-1.8.0/ltmain.sh . 2>&1 >&3 | tee -a $LOGFILE && leave
echo $"${args["$index"]}" | xargs ./configure --prefix=$prefix/${dirinstall["$index"]} --libdir=$prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
#make -j clean  2>&1 >&3 | tee -a $LOGFILE && leave
make -j 2>&1 >&3 | tee -a $LOGFILE && leave
make -j fltools 2>&1 >&3 | tee -a $LOGFILE && leave
make -j install 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir -p ${HOME}/.diamond/schemata 2>&1 >&3 | tee -a $LOGFILE && leave
cp $prefix/${dirinstall["$index"]}/share/diamond/schemata/flml ${HOME}/.diamond/schemata/. 2>&1 >&3 | tee -a $LOGFILE && leave
#make THREADS=4 test 2>&1 >&3 | tee -a $LOGFILE && leave

