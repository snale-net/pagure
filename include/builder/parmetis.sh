#!/bin/bash

echo $"${args["$index"]}" | xargs make config shared=1 prefix=$prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
make install 2>&1 >&3 | tee -a $LOGFILE && leave
