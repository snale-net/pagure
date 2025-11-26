#!/bin/bash

echo $"${args["$index"]}" | xargs meson setup builddir/ -Dprefix=\"$prefix/${dirinstall["$index"]}\" 2>&1 >&3 | tee -a $LOGFILE && leave
meson compile -C buildir/  2>&1 | tee -a $LOGFILE && leave
meson install -C buildir/  2>&1 | tee -a $LOGFILE && leave
