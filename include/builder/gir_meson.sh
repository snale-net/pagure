#!/bin/bash

echo $"${args["$index"]}" | xargs meson builddir --prefix $prefix/${dirinstall["$index"]} --libdir $prefix/${dirinstall["$index"]}/lib 2>&1 >&3 | tee -a $LOGFILE && leave
cd builddir
ninja install 2>&1 | tee -a $LOGFILE && leave
cp -f $prefix/${dirinstall["$index"]}/share/gir-1.0/* $prefix/gobject-introspection/$compilo/1.68.0/share/gir-1.0/. 2>&1 | tee -a $LOGFILE && leave
