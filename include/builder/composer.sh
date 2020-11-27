#!/bin/bash

php composer-setup.php 2>&1 >&3 | tee -a $LOGFILE && leave 1
mkdir -p $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave 1
cp composer.phar $prefix/${dirinstall["$index"]}/bin 2>&1 >&3 | tee -a $LOGFILE && leave 1
