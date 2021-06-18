#!/bin/bash

echo $"${args["$index"]}" | xargs make 2>&1 >&3 | tee -a $LOGFILE && leave
echo $"${args["$index"]}" | xargs make install INSTALL=$prefix/${dirinstall["$index"]} INSTALL_LIB=$prefix/${dirinstall["$index"]}/lib 2>&1 | tee -a $LOGFILE && leave
