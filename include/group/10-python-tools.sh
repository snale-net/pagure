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
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/21/23/af6bac2a601be6670064a817273d4190b79df6f74d8012926a39bc7aa77f/Pillow-8.2.0.tar.gz"
filename["$group-$index"]=Pillow-8.2.0.tar.gz
dirname["$group-$index"]=Pillow-8.2.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# dask 2.10.1
index=2
name["$group-$index"]=dask
version["$group-$index"]=2.10.1
details["$group-$index"]="(Python module - required by xarray)"
url["$group-$index"]="https://files.pythonhosted.org/packages/3b/4c/f8500abb07ac3144d08aeae106e467f17d942b4d9198ba1010deba89dfa0/dask-2.10.1.tar.gz"
filename["$group-$index"]=dask-2.10.1.tar.gz
dirname["$group-$index"]=dask-2.10.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# xarray 0.15.0
index=3
name["$group-$index"]=xarray
version["$group-$index"]=0.15.0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/06/16/1f256c5bb6e47a771f97c8d5bcb3a124263bf38c2a3baf0b80ba2dcc55b2/xarray-0.15.0.tar.gz"
filename["$group-$index"]=xarray-0.15.0.tar.gz
dirname["$group-$index"]=xarray-0.15.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# airflow 2.1.1
index=4
name["$group-$index"]=airflow
version["$group-$index"]=2.1.1
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://github.com/apache/airflow/archive/refs/tags/2.1.1rc1.tar.gz -O airflow-2.1.1.tar.gz"
filename["$group-$index"]=airflow-2.1.1.tar.gz
dirname["$group-$index"]=airflow-2.1.1rc1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# PyInstaller 3.6
index=5
name["$group-$index"]=pyinstaller
version["$group-$index"]=3.6
details["$group-$index"]="(Python tool)"
url["$group-$index"]="https://files.pythonhosted.org/packages/3c/c9/c3f9bc64eb11eee6a824686deba6129884c8cbdf70e750661773b9865ee0/PyInstaller-3.6.tar.gz"
filename["$group-$index"]=PyInstaller-3.6.tar.gz
dirname["$group-$index"]=PyInstaller-3.6
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# staticx 0.12.2
index=6
name["$group-$index"]=staticx
version["$group-$index"]=0.12.2
details["$group-$index"]="(Python module - requires musl 1.2.0)"
url["$group-$index"]="https://github.com/JonathonReinhart/staticx/archive/refs/tags/v0.12.2.tar.gz -O staticx-0.12.2.tar.gz"
filename["$group-$index"]=staticx-0.12.2.tar.gz
dirname["$group-$index"]=staticx-0.12.2
builder["$group-$index"]="staticx"
dependencies["$group-$index"]="musl/$compilo/1.2.0 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# scikit-learn 1.0.2
index=7
name["$group-$index"]=scikit-learn
version["$group-$index"]=1.0.2
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/75/44/074b780d8ac0b0899937e9b8ba6d5d8873a71b99aa915219251ef85a8890/scikit-learn-1.0.2.tar.gz"
filename["$group-$index"]=scikit-learn-1.0.2.tar.gz
dirname["$group-$index"]=scikit-learn-1.0.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="LDSHARED=\"icc -shared\""
else
     args["$group-$index"]=""
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# tensorflow 2.8.0
index=8
name["$group-$index"]=tensorflow
version["$group-$index"]=2.8.0
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.8.0.tar.gz -O tensorflow-2.8.0.tar.gz"
filename["$group-$index"]=tensorflow-2.8.0.tar.gz
dirname["$group-$index"]=tensorflow-2.8.0
builder["$group-$index"]="tensorflow"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} bazel/$compilo/4.2.2"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
     args["$group-$index"]="--config=mkl --jobs=2 --local_ram_resources=HOST_RAM*.5"
else
     args["$group-$index"]="--jobs=2 --local_ram_resources=HOST_RAM*.5"
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# pytorch 1.7.0
index=9
name["$group-$index"]=pytorch
version["$group-$index"]=1.7.0
details["$group-$index"]="(Python module)"
url["$group-$index"]="git clone --branch v1.7.0 --recursive https://github.com/pytorch/pytorch"
filename["$group-$index"]=pytorch-1.7.0
dirname["$group-$index"]=pytorch-1.7.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
      args["$group-$index"]="LDSHARED=\"icc -shared\" MAX_JOBS=2 USE_CUDA=0 USE_CUDNN=0 USE_MKLDNN=1"
else
     args["$group-$index"]="MAX_JOBS=2 USE_CUDA=0 USE_CUDNN=0 USE_MKLDNN=1"
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# torchvision 0.8.2
index=10
name["$group-$index"]=torchvision
version["$group-$index"]=0.8.2
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://github.com/pytorch/vision/archive/refs/tags/v0.8.2.tar.gz -O torchvision-0.8.2.tar.gz"
filename["$group-$index"]=torchvision-0.8.2.tar.gz
dirname["$group-$index"]=vision-0.8.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
if [[ "$compiler" == "intel" ]] ; then
      args["$group-$index"]="LDSHARED=\"icc -shared\" MAX_JOBS=2"
else
     args["$group-$index"]="MAX_JOBS=2"
fi
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# Fiona 1.8.21
index=11
name["$group-$index"]=fiona
version["$group-$index"]=1.8.21
details["$group-$index"]="(Python module - need GDAL 3.3.0)"
url["$group-$index"]="https://files.pythonhosted.org/packages/67/5c/4e028e84a1f0cb3f8a994217cf2366360ca984dfc1433f6171de527d0dca/Fiona-1.8.21.tar.gz"
filename["$group-$index"]=Fiona-1.8.21.tar.gz
dirname["$group-$index"]=Fiona-1.8.21
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} gdal/$compilo/3.3.0"
dirinstall["$group-$index"]="python-modules/$compilo"
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# rasterio 1.2.10
index=12
name["$group-$index"]=rasterio
version["$group-$index"]=1.2.10
details["$group-$index"]="(Python module - need GDAL 3.3.0)"
url["$group-$index"]="https://files.pythonhosted.org/packages/44/5e/9f19e1e6fe980b59d8da8809f2e8f81eb7f0322c71914f077edcbcd9a110/rasterio-1.2.10.tar.gz"
filename["$group-$index"]=rasterio-1.2.10.tar.gz
dirname["$group-$index"]=rasterio-1.2.10
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} gdal/$compilo/3.3.0"
dirinstall["$group-$index"]="python-modules/$compilo"
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""


# shapely 1.8.2
index=13
name["$group-$index"]=shapely 
version["$group-$index"]=1.8.2
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/93/3c/cda77e57a08c49569de5bd90376c547bcb981420100adcb0f3770ed681b1/Shapely-1.8.2.tar.gz"
filename["$group-$index"]=Shapely-1.8.2.tar.gz
dirname["$group-$index"]=Shapely-1.8.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} geos/$compilo/3.10.3"
dirinstall["$group-$index"]="python-modules/$compilo"
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# geopandas 0.10.2
index=14
name["$group-$index"]=geopandas
version["$group-$index"]=0.10.2
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/06/c7/e70c24a20854c9db6cbb22af30adcc0b5b06c4d1b74eb361d416ffbb5e7a/geopandas-0.10.2.tar.gz"
filename["$group-$index"]=geopandas-0.10.2.tar.gz
dirname["$group-$index"]=geopandas-0.10.2
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

# elasticsearch 7.10.1
index=15
name["$group-$index"]=elasticsearch
version["$group-$index"]=7.10.1
details["$group-$index"]="(Python module)"
url["$group-$index"]="https://files.pythonhosted.org/packages/65/6e/7d949d1801ae0ff84de0ed0ef3473bd061d0f26647282d632f2e65a05364/elasticsearch-7.10.1.tar.gz"
filename["$group-$index"]=elasticsearch-7.10.1.tar.gz
dirname["$group-$index"]=elasticsearch-7.10.1
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""


fi  # end-only-if-Python



