#!/bin/bash

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}            
if [[  "$compiler" == "intel" ]] ; then					
	$pythonInterpreter setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem install --user 2>&1 >&3 | tee -a $LOGFILE && leave 1
else                   
	$pythonInterpreter setup.py install --user 2>&1 >&3 | tee -a $LOGFILE && leave 1
fi
