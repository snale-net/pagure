#!/bin/bash

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}
$pythonInterpreter setup.py install --user 2>&1 >&3 | tee -a $LOGFILE && leave 1
cp -r include/pybind11 $prefix/${dirinstall["$index"]}/include/$pythonInterpreter 2>&1 >&3 | tee -a $LOGFILE && leave 1			

