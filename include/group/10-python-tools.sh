#!/bin/bash

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

#################################################################
#Group 10 : Python tools
group=10
groupname[$group]="Python tools"

# Pillow 8.2.0
index=1
name["$group-$index"]=PIL
version["$group-$index"]=8.2.0
details["$group-$index"]=""
url["$group-$index"]="https://files.pythonhosted.org/packages/21/23/af6bac2a601be6670064a817273d4190b79df6f74d8012926a39bc7aa77f/Pillow-8.2.0.tar.gz"
filename["$group-$index"]=Pillow-8.2.0.tar.gz
dirname["$group-$index"]=Pillow-8.2.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""


# dask 2.10.1
index=2
name["$group-$index"]=dask
version["$group-$index"]=2.10.1
details["$group-$index"]="(required by xarray)"
url["$group-$index"]="https://files.pythonhosted.org/packages/3b/4c/f8500abb07ac3144d08aeae106e467f17d942b4d9198ba1010deba89dfa0/dask-2.10.1.tar.gz"
filename["$group-$index"]=dask-2.10.1.tar.gz
dirname["$group-$index"]=dask-2.10.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# xarray 0.15.0
index=3
name["$group-$index"]=xarray
version["$group-$index"]=0.15.0
details["$group-$index"]=""
url["$group-$index"]="https://files.pythonhosted.org/packages/06/16/1f256c5bb6e47a771f97c8d5bcb3a124263bf38c2a3baf0b80ba2dcc55b2/xarray-0.15.0.tar.gz"
filename["$group-$index"]=xarray-0.15.0.tar.gz
dirname["$group-$index"]=xarray-0.15.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# airflow 2.1.1
index=4
name["$group-$index"]=airflow
version["$group-$index"]=2.1.1
details["$group-$index"]=""
url["$group-$index"]="https://github.com/apache/airflow/archive/refs/tags/2.1.1rc1.tar.gz -O airflow-2.1.1.tar.gz"
filename["$group-$index"]=airflow-2.1.1.tar.gz
dirname["$group-$index"]=airflow-2.1.1rc1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# PyInstaller 3.6
index=5
name["$group-$index"]=pyinstaller
version["$group-$index"]=3.6
details["$group-$index"]=""
url["$group-$index"]="https://files.pythonhosted.org/packages/3c/c9/c3f9bc64eb11eee6a824686deba6129884c8cbdf70e750661773b9865ee0/PyInstaller-3.6.tar.gz"
filename["$group-$index"]=PyInstaller-3.6.tar.gz
dirname["$group-$index"]=PyInstaller-3.6
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""


# staticx 0.12.2
index=6
name["$group-$index"]=staticx
version["$group-$index"]=0.12.2
details["$group-$index"]="(requires musl 1.2.0)"
url["$group-$index"]="https://github.com/JonathonReinhart/staticx/archive/refs/tags/v0.12.2.tar.gz -O staticx-0.12.2.tar.gz"
filename["$group-$index"]=staticx-0.12.2.tar.gz
dirname["$group-$index"]=staticx-0.12.2
builder["$group-$index"]="staticx"
dependencies["$group-$index"]="musl/$compilo/1.2.0 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python



