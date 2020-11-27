#!/bin/bash

npm install 2>&1 >&3 | tee -a $LOGFILE && leave 1
npm install --global gulp-cli 2>&1 >&3 | tee -a $LOGFILE && leave 1
gulp build 2>&1 >&3 | tee -a $LOGFILE && leave 1
mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave 1
cp -r ./* $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave 1	 
