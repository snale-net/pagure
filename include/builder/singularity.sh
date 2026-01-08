#!/bin/bash

echo $"${args["$index"]}" | xargs ./mconfig --prefix=$prefix/${dirinstall["$index"]} --libdir=$prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
make -C builddir 2>&1 >&3 | tee -a $LOGFILE && leave
make -C builddir install 2>&1 | tee -a $LOGFILE && leave
