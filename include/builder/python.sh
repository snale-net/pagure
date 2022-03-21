#!/bin/bash

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" 2>&1 >&3 | tee -a $LOGFILE && leave; fi

if [ "$PYTHONUSERBASE" != "$prefix/${dirinstall["$index"]}" ] ; then      
    find ${PYTHONUSERBASE}/lib/$pythonInterpreter/site-packages -mindepth 1 -maxdepth 1 -name "*.egg" > $prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages/basic-modules.pth
    export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}
fi

cmd=`echo ${args["$index"]} | xargs -0 -i echo {} ${pythonInterpreter} setup.py install --user --force | sed -z '$ s/\n//' | xargs`
eval "$cmd" 2>&1 >&3 | tee -a $LOGFILE && leave


