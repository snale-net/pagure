#!/bin/bash

cd src
make libscotch esmumps 2>&1 >&3 | tee -a $LOGFILE && leave			
make prefix=$prefix/${dirinstall["$index"]} install 2>&1 >&3 | tee -a $LOGFILE && leave
