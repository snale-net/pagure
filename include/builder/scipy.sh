#!/bin/bash

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}            
if [[  "$compiler" == "intel" ]] ; then					
	$pythonInterpreter setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem install --user || leave 1 
else                   
	$pythonInterpreter setup.py install --user || leave 1
fi
