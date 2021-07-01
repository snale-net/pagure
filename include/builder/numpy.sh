#!/bin/bash

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}            
if [[  "$compiler" == "intel" ]] ; then					
	$pythonInterpreter setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
else                   
	$pythonInterpreter setup.py install --user --force 2>&1 >&3 | tee -a $LOGFILE && leave
fi
