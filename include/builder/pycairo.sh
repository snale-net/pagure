#!/bin/bash

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" 2>&1 >&3 | tee -a $LOGFILE && leave; fi

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}
echo $PYTHONPATH | sed 's/:/\n/g' > $PYTHONUSERBASE/module-extra.pth

if [[ "$compiler" == "intel" ]] ; then
	LDSHARED="icc -shared" $pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
else
	$pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
fi	

cp $prefix/${dirinstall["$index"]}/lib/python${pythonVersion}/site-packages/pycairo-1.20.1-py3.7-linux-x86_64.egg/cairo/include/py3cairo.h $prefix/${dirinstall["$index"]}/include/python${pythonVersion}/. 2>&1 | tee -a $LOGFILE && leave

rm -f $PYTHONUSERBASE/module-extra.pth
unset PYTHONUSERBASE
