#!/bin/bash

make 2>&1 >&3 | tee -a $LOGFILE && leave 1
mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave 1
cp -r lib $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave 1
cp -r include $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave 1
cp mod/* $prefix/${dirinstall["$index"]}/include 2>&1 >&3 | tee -a $LOGFILE && leave 1
