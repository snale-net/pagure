#!/bin/bash

mkdir build 2>&1 >&3 | tee -a $LOGFILE && leave 1
cd build 2>&1 >&3 | tee -a $LOGFILE && leave 1

if [[ ! -z "${configfilename["$index"]}" ]] ; then 
	mv ../${configfilename["$index"]} . 2>&1 >&3 | tee -a $LOGFILE && leave 1 ; 
fi

cmake -DCMAKE_INSTALL_PREFIX=$prefix/${dirinstall["$index"]}  -DCMAKE_INSTALL_LIBDIR=$prefix/${dirinstall["$index"]}/lib ${args["$index"]} ../ 2>&1 >&3 | tee -a $LOGFILE && leave 1
make 2>&1 >&3 | tee -a $LOGFILE && leave 1
make install 2>&1 >&3 | tee -a $LOGFILE && leave 1
