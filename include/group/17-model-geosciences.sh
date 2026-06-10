#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 17 : Model Geosciences
group=17
groupname[$group]="Models geosciences"

# phreeqc 3.8.6
index=1
name["$group-$index"]=phreeqc
version["$group-$index"]=3.8.6
details["$group-$index"]=""
url["$group-$index"]=https://water.usgs.gov/water-resources/software/PHREEQC/phreeqc-3.8.6-17100.tar.gz
filename["$group-$index"]=phreeqc-3.8.6-17100.tar.gz
dirname["$group-$index"]=phreeqc-3.8.6-17100
builder["$group-$index"]="configure"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/__COMPILO__/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/__COMPILO__"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"

