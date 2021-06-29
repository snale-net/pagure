#!/bin/bash

npm install --legacy-peer-deps 2>&1 >&3 | tee -a $LOGFILE && leave
npm install --global gulp-cli 2>&1 >&3 | tee -a $LOGFILE && leave
gulp build 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r ./* $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
