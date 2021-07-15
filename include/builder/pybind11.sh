#!/bin/bash

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" 2>&1 >&3 | tee -a $LOGFILE && leave; fi

$pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r include/pybind11 $prefix/${dirinstall["$index"]}/include/$pythonInterpreter 2>&1 >&3 | tee -a $LOGFILE && leave		

