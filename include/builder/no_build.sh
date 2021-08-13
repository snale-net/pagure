#!/bin/bash

mkdir -p $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r ./* $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave
