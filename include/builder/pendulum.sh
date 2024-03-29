#!/bin/bash

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" 2>&1 >&3 | tee -a $LOGFILE && leave; fi

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}
echo $PYTHONPATH | sed 's/:/\n/g' > $PYTHONUSERBASE/module-extra.pth

if [[ "$compiler" == "intel" ]] ; then
	LDSHARED="icc -shared" $pythonInterpreter build.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
else
	$pythonInterpreter build.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
fi	

rm -f $PYTHONUSERBASE/module-extra.pth
unset PYTHONUSERBASE
