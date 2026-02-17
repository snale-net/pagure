#!/bin/bash

./contrib/download_prerequisites 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir objdir
cd objdir
echo $"${args["$index"]}" | xargs ../configure --prefix=$prefix/${dirinstall["$index"]} --libdir=$prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
make -j 2 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 | tee -a $LOGFILE && leave
