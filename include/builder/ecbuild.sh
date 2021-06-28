#!/bin/bash

mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r ./* $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
