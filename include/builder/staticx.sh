#!/bin/bash

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" || leave 1; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" || leave 1; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" || leave 1; fi

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}
if [[ "$compiler" == "intel" ]] ; then
	LDSHARED="icc -shared" $pythonInterpreter setup.py build || leave 1
	LDSHARED="icc -shared" $pythonInterpreter setup.py install --user || leave 1
else
	$pythonInterpreter setup.py build || leave 1
	$pythonInterpreter setup.py install --user || leave 1
fi
