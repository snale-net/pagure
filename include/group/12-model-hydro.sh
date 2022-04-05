#!/bin/bash

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

