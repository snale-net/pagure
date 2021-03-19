#!/bin/bash

#################################################################
#Group 11 : Model Delft3D
group=11
groupname[$group]="Model Delft3D"

# Delft3D v6.03
if [ "$compiler" == "gnu" ] && (( $(echo "$CC_VERSION > 7.5" | bc -l) )); then # only GNU<=7.5	 

    if [ ! -z "$selectedFilter" ] &&  [ "$selectedFilter" == "DELFT3D" ]; then
        log fail "Delft3D supports only GCC version '7.5'. Actual version is '$CC_VERSION'" 
	    leave 1
    fi

    log warn "Delft3D supports only GCC version '7.5'. Actual version is '$CC_VERSION'" 
else 
index=1
name["$group-$index"]=delft3d
version["$group-$index"]=6.03
details["$group-$index"]=""
url["$group-$index"]=localfile
filename["$group-$index"]=delft3d-6.03.zip
dirname["$group-$index"]=delft3d-6.03/src
if [ "$system" == "suse" ]; then
configfile["$group-$index"]="#include \"meminfo.h\"
//#if HAVE_CONFIG_H
//#include <sys/sysctl.h>
//#endif

#ifdef WIN32

unsigned __int64 MemInfo::GetTotalMemSize()
{
  MEMORYSTATUSEX status;
  status.dwLength = sizeof(status);
  GlobalMemoryStatusEx(&status);
  return unsigned __int64 (status.ullTotalPhys);
}
#elif defined(_SC_PHYS_PAGES)
unsigned long long MemInfo::GetTotalMemSize()
{
long long pages = sysconf(_SC_PHYS_PAGES);
long long page_size = sysconf(_SC_PAGE_SIZE);
return (pages * page_size);
}

#else
unsigned long long MemInfo::GetTotalMemSize()
{
int mib[2];
size_t len;
long long totalphys64;

mib[0] = CTL_HW;
mib[1] = HW_MEMSIZE; /* gives a 64 bit int */
len = sizeof(totalphys64);
sysctl(mib, 2, &totalphys64, &len, NULL, 0);
return totalphys64;
}
#endif"
configfilename["$group-$index"]="utils_lgpl/deltares_common/packages/deltares_common_c/src/meminfo.cpp"
fi
builder["$group-$index"]="delft3d"
dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.2 ruby/$compilo/2.7.2"
dirinstall["$group-$index"]=${name["$group-$index"]}/$mpilib/$compilo/${version["$group-$index"]}
args["$group-$index"]="--with-netcdf --with-mpi"
dirmodule["$group-$index"]="${name["$group-$index"]}/$mpilib/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\tDelft 3D ${version["$group-$index"]}\"
}
 
module-whatis \"Delft 3D ${version["$group-$index"]}\"

# Dependencies
module load ${dependencies["$group-$index"]}

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"
fi # only GNU<=7.5	


