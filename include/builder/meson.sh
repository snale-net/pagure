#!/bin/bash

echo $"${args["$index"]}" | xargs meson builddir --prefix $prefix/${dirinstall["$index"]} --libdir $prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
cd builddir
ninja install 2>&1 | tee -a $LOGFILE && leave
