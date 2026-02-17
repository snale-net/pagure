#!/bin/bash
#MIT License
#Copyright (c) 2024 [SNALE - French SAS Company - RCS 951 724 616]
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#################################################################
#Group 12 : Model Hydro
group=12
groupname[$group]="Models hydro"

# refdif1 2.5
index=1
name["$group-$index"]=refdif1
version["$group-$index"]=2.5
details["$group-$index"]=""
url["$group-$index"]=https://www1.udel.edu/kirby/programs/refdif/code/refdif1v25.tar.gz
filename["$group-$index"]=refdif1v25.tar.gz
dirname["$group-$index"]=V2.5
patch_01["$group-$index"]="--- refdif1v25_original.f	1995-04-13 16:11:33.000000000 +0200
+++ refdif1v25.f	2022-04-05 15:18:27.356146168 +0200
@@ -600,12 +600,12 @@
       edens(ifreq)=sqrt(edens(ifreq)/a1)
       nn=31
       ii=(nn-1)/2+1
-      seed=rand(seed)
+      seed=rand(Int(seed))
       
 C  Compute randomly distributed $\Delta\theta$'s.   
       sum0=0.
       do 12 i=1,nn
-      seed=rand(seed)
+      seed=rand(Int(seed))
       dthi(i)=seed
       sum0=sum0+seed
 12    continue
@@ -623,7 +623,7 @@
 4     continue
       do 5 i=1,nn
       ip1=i+1
-      seed=rand(seed)
+      seed=rand(Int(seed))
       dir(ifreq,ip1)=2.*pi*seed/100.
 5     continue
       do 7 j=1,n
"
patchfile_01["$group-$index"]="refdif1v25.f"
builder["$group-$index"]="refdif"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]=${name["$group-$index"]}/$compilo/${version["$group-$index"]}
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
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

