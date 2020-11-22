#!/bin/bash

php composer-setup.php || leave 1
mkdir -p $prefix/${dirinstall["$index"]}/bin
cp composer.phar $prefix/${dirinstall["$index"]}/bin
