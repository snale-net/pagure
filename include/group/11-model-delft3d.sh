#!/bin/bash

#################################################################
#Group 11 : Model Delft3D
group=11
groupname[$group]="Model Delft3D"

if [ "$mpilib" != "none" ]; then # MPI-only

# Delft3D v6.03 (rev68819)
index=1
name["$group-$index"]=delft3d
version["$group-$index"]=6.03
details["$group-$index"]="(revision 68819)"
url["$group-$index"]=localfile
filename["$group-$index"]=delft3d-rev68819.zip
dirname["$group-$index"]=delft3d-rev68819/src
patch_01["$group-$index"]="--- meminfo_original.cpp	2021-06-10 17:39:06.246128000 +0200
+++ meminfo.cpp	2021-06-14 11:24:12.969917000 +0200
@@ -1,6 +1,10 @@
 #include \"meminfo.h\"
-#if linux
-#include <sys/sysctl.h>
+#if OGRE_PLATFORM != OGRE_PLATFORM_WIN32
+    #if OGRE_PLATFORM == OGRE_PLATFORM_ANDROID
+        #include <linux/sysctl.h>
+    #else
+        #include <sys/sysctl.h>
+    #endif
 #endif
 
 #ifdef WIN32
"
patchfile_01["$group-$index"]="utils_lgpl/deltares_common/packages/deltares_common_c/src/meminfo.cpp"
patch_02["$group-$index"]="--- Makefile_original.am	2021-06-10 17:36:50.186501000 +0200
+++ Makefile.am	2021-06-14 10:38:50.677012602 +0200
@@ -12,10 +12,12 @@
 include \$(top_srcdir)/common.am
 
 bin_PROGRAMS = swan_mpi
+EXEEXT = .exe
 
 #-------------------------------------------------------------------------------
 #Includes
-AM_FCFLAGS = 
+AM_FCFLAGS =
+FCFLAGS += -DSWANEXE
 FFLAGS  = \${SWAN_FFLAGS} -O2 -DSWANEXE
 LIBS =
 
@@ -42,83 +44,84 @@
 
 #-------------------------------------------------------------------------------
 #Sources
+SRC_DIR=../src
 swan_mpi_SOURCES = \\
-         swmod1.for \\
-         SwanGriddata.f90 \\
-         swmod2.F \\
-         nctablemd.f90 \\
-         netcdf_tools.f90 \\
-         agioncmd.f90 \\
-         swn_outnc.f90 \\
-         HRextensions.f90 \\
-         SdsBabanin.f90 \\
-         SwanBndStruc.f90 \\
-         SwanGridobjects.f90 \\
-         SwanCompdata.f90 \\
-         SwanBpntlist.f90 \\
-         SwanCheckGrid.f90 \\
-         SwanCompUnstruc.f90 \\
-         SwanComputeForce.f90 \\
-         SwanConvAccur.f90 \\
-         SwanConvStopc.f90 \\
-         SwanCreateEdges.f90 \\
-         SwanCrossObstacle.f90 \\
-         SwanDiffPar.f90 \\
-         SwanDispParm.f90 \\
-         SwanFindObstacles.f90 \\
-         SwanFindPoint.f90 \\
-         SwanGSECorr.f90 \\
-         SwanGradDepthorK.f90 \\
-         SwanGradVel.f90 \\
-         SwanGridCell.f90 \\
-         SwanGridFace.f90 \\
-         SwanGridTopology.f90 \\
-         SwanGridVert.f90 \\
-         SwanInitCompGrid.f90 \\
-         SwanInterpolateAc.f90 \\
-         SwanInterpolateOutput.f90 \\
-         SwanInterpolatePoint.f90 \\
-         SwanIntgratSpc.f90 \\
-         SwanMaxOverNodes.f90 \\
-         SwanMinOverNodes.f90 \\
-         SwanPointinMesh.f90 \\
-         SwanPrepComp.f90 \\
-         SwanPrintGridInfo.f90 \\
-         SwanPropvelS.f90 \\
-         SwanPropvelX.f90 \\
-         SwanPunCollect.f90 \\
-         SwanReadADCGrid.f90 \\
-         SwanReadEasymeshGrid.f90 \\
-         SwanReadGrid.f90 \\
-         SwanReadTriangleGrid.f90 \\
-         SwanReadfort18.f90 \\
-         SwanSpectPart.for \\
-         SwanSumOverNodes.f90 \\
-         SwanSweepSel.f90 \\
-         SwanThreadBounds.f90 \\
-         SwanTranspAc.f90 \\
-         SwanTranspX.f90 \\
-         SwanVertlist.f90 \\
-         couple2adcirc.f90 \\
-         m_constants.f90 \\
-         m_fileio.f90 \\
-         serv_xnl4v5.f90 \\
-         mod_xnl4v5.f90 \\
-         ocpcre.for \\
-         ocpids.F \\
-         ocpmix.for \\
-         swan2coh.f90 \\
-         swancom1.F \\
-         swancom2.for \\
-         swancom3.for \\
-         swancom4.for \\
-         swancom5.for \\
-         swanmain.F \\
-         swanout1.for \\
-         swanout2.for \\
-         swanparll.F \\
-         swanpre1.for \\
-         swanpre2.for \\
-         swanser.for
+         \$(SRC_DIR)/swmod1.for \\
+         \$(SRC_DIR)/SwanGriddata.f90 \\
+         \$(SRC_DIR)/swmod2.F \\
+         \$(SRC_DIR)/nctablemd.f90 \\
+         \$(SRC_DIR)/netcdf_tools.f90 \\
+         \$(SRC_DIR)/agioncmd.f90 \\
+         \$(SRC_DIR)/swn_outnc.f90 \\
+         \$(SRC_DIR)/HRextensions.f90 \\
+         \$(SRC_DIR)/SdsBabanin.f90 \\
+         \$(SRC_DIR)/SwanBndStruc.f90 \\
+         \$(SRC_DIR)/SwanGridobjects.f90 \\
+         \$(SRC_DIR)/SwanCompdata.f90 \\
+         \$(SRC_DIR)/SwanBpntlist.f90 \\
+         \$(SRC_DIR)/SwanCheckGrid.f90 \\
+         \$(SRC_DIR)/SwanCompUnstruc.f90 \\
+         \$(SRC_DIR)/SwanComputeForce.f90 \\
+         \$(SRC_DIR)/SwanConvAccur.f90 \\
+         \$(SRC_DIR)/SwanConvStopc.f90 \\
+         \$(SRC_DIR)/SwanCreateEdges.f90 \\
+         \$(SRC_DIR)/SwanCrossObstacle.f90 \\
+         \$(SRC_DIR)/SwanDiffPar.f90 \\
+         \$(SRC_DIR)/SwanDispParm.f90 \\
+         \$(SRC_DIR)/SwanFindObstacles.f90 \\
+         \$(SRC_DIR)/SwanFindPoint.f90 \\
+         \$(SRC_DIR)/SwanGSECorr.f90 \\
+         \$(SRC_DIR)/SwanGradDepthorK.f90 \\
+         \$(SRC_DIR)/SwanGradVel.f90 \\
+         \$(SRC_DIR)/SwanGridCell.f90 \\
+         \$(SRC_DIR)/SwanGridFace.f90 \\
+         \$(SRC_DIR)/SwanGridTopology.f90 \\
+         \$(SRC_DIR)/SwanGridVert.f90 \\
+         \$(SRC_DIR)/SwanInitCompGrid.f90 \\
+         \$(SRC_DIR)/SwanInterpolateAc.f90 \\
+         \$(SRC_DIR)/SwanInterpolateOutput.f90 \\
+         \$(SRC_DIR)/SwanInterpolatePoint.f90 \\
+         \$(SRC_DIR)/SwanIntgratSpc.f90 \\
+         \$(SRC_DIR)/SwanMaxOverNodes.f90 \\
+         \$(SRC_DIR)/SwanMinOverNodes.f90 \\
+         \$(SRC_DIR)/SwanPointinMesh.f90 \\
+         \$(SRC_DIR)/SwanPrepComp.f90 \\
+         \$(SRC_DIR)/SwanPrintGridInfo.f90 \\
+         \$(SRC_DIR)/SwanPropvelS.f90 \\
+         \$(SRC_DIR)/SwanPropvelX.f90 \\
+         \$(SRC_DIR)/SwanPunCollect.f90 \\
+         \$(SRC_DIR)/SwanReadADCGrid.f90 \\
+         \$(SRC_DIR)/SwanReadEasymeshGrid.f90 \\
+         \$(SRC_DIR)/SwanReadGrid.f90 \\
+         \$(SRC_DIR)/SwanReadTriangleGrid.f90 \\
+         \$(SRC_DIR)/SwanReadfort18.f90 \\
+         \$(SRC_DIR)/SwanSpectPart.for \\
+         \$(SRC_DIR)/SwanSumOverNodes.f90 \\
+         \$(SRC_DIR)/SwanSweepSel.f90 \\
+         \$(SRC_DIR)/SwanThreadBounds.f90 \\
+         \$(SRC_DIR)/SwanTranspAc.f90 \\
+         \$(SRC_DIR)/SwanTranspX.f90 \\
+         \$(SRC_DIR)/SwanVertlist.f90 \\
+         \$(SRC_DIR)/couple2adcirc.f90 \\
+         \$(SRC_DIR)/m_constants.f90 \\
+         \$(SRC_DIR)/m_fileio.f90 \\
+         \$(SRC_DIR)/serv_xnl4v5.f90 \\
+         \$(SRC_DIR)/mod_xnl4v5.f90 \\
+         \$(SRC_DIR)/ocpcre.for \\
+         \$(SRC_DIR)/ocpids.F \\
+         \$(SRC_DIR)/ocpmix.for \\
+         \$(SRC_DIR)/swan2coh.f90 \\
+         \$(SRC_DIR)/swancom1.F \\
+         \$(SRC_DIR)/swancom2.for \\
+         \$(SRC_DIR)/swancom3.for \\
+         \$(SRC_DIR)/swancom4.for \\
+         \$(SRC_DIR)/swancom5.for \\
+         \$(SRC_DIR)/swanmain.F \\
+         \$(SRC_DIR)/swanout1.for \\
+         \$(SRC_DIR)/swanout2.for \\
+         \$(SRC_DIR)/swanparll.F \\
+         \$(SRC_DIR)/swanpre1.for \\
+         \$(SRC_DIR)/swanpre2.for \\
+         \$(SRC_DIR)/swanser.for
 #-------------------------------------------------------------------------------
 #Libraries
"
patchfile_02["$group-$index"]="third_party_open/swan/swan_mpi/Makefile.am"
patch_03["$group-$index"]="--- Makefile_original.am	2021-06-10 17:36:34.398080684 +0200
+++ Makefile.am	2021-06-14 10:43:31.784544529 +0200
@@ -12,10 +12,12 @@
 include \$(top_srcdir)/common.am
 
 bin_PROGRAMS = swan_omp
+EXEEXT = .exe
 
 #-------------------------------------------------------------------------------
 #Includes
-AM_FCFLAGS = -fopenmp \$(OPENMP_FCFLAGS) 
+AM_FCFLAGS = -fopenmp \$(OPENMP_FCFLAGS)
+FCFLAGS += -fopenmp \$(OPENMP_FFLAGS) -DSWANEXE
 FFLAGS  = -fopenmp \$(OPENMP_FFLAGS) \${SWAN_FFLAGS} -O2 -DSWANEXE
 LIBS =
 
@@ -42,83 +44,84 @@
 
 #-------------------------------------------------------------------------------
 #Sources
+SRC_DIR=../src
 swan_omp_SOURCES = \\
-         swmod1.for \\
-         SwanGriddata.f90 \\
-         swmod2.F \\
-         nctablemd.f90 \\
-         netcdf_tools.f90 \\
-         agioncmd.f90 \\
-         swn_outnc.f90 \\
-         HRextensions.f90 \\
-         SdsBabanin.f90 \\
-         SwanBndStruc.f90 \\
-         SwanGridobjects.f90 \\
-         SwanCompdata.f90 \\
-         SwanBpntlist.f90 \\
-         SwanCheckGrid.f90 \\
-         SwanCompUnstruc.f90 \\
-         SwanComputeForce.f90 \\
-         SwanConvAccur.f90 \\
-         SwanConvStopc.f90 \\
-         SwanCreateEdges.f90 \\
-         SwanCrossObstacle.f90 \\
-         SwanDiffPar.f90 \\
-         SwanDispParm.f90 \\
-         SwanFindObstacles.f90 \\
-         SwanFindPoint.f90 \\
-         SwanGSECorr.f90 \\
-         SwanGradDepthorK.f90 \\
-         SwanGradVel.f90 \\
-         SwanGridCell.f90 \\
-         SwanGridFace.f90 \\
-         SwanGridTopology.f90 \\
-         SwanGridVert.f90 \\
-         SwanInitCompGrid.f90 \\
-         SwanInterpolateAc.f90 \\
-         SwanInterpolateOutput.f90 \\
-         SwanInterpolatePoint.f90 \\
-         SwanIntgratSpc.f90 \\
-         SwanMaxOverNodes.f90 \\
-         SwanMinOverNodes.f90 \\
-         SwanPointinMesh.f90 \\
-         SwanPrepComp.f90 \\
-         SwanPrintGridInfo.f90 \\
-         SwanPropvelS.f90 \\
-         SwanPropvelX.f90 \\
-         SwanPunCollect.f90 \\
-         SwanReadADCGrid.f90 \\
-         SwanReadEasymeshGrid.f90 \\
-         SwanReadGrid.f90 \\
-         SwanReadTriangleGrid.f90 \\
-         SwanReadfort18.f90 \\
-         SwanSpectPart.for \\
-         SwanSumOverNodes.f90 \\
-         SwanSweepSel.f90 \\
-         SwanThreadBounds.f90 \\
-         SwanTranspAc.f90 \\
-         SwanTranspX.f90 \\
-         SwanVertlist.f90 \\
-         couple2adcirc.f90 \\
-         m_constants.f90 \\
-         m_fileio.f90 \\
-         serv_xnl4v5.f90 \\
-         mod_xnl4v5.f90 \\
-         ocpcre.for \\
-         ocpids.F \\
-         ocpmix.for \\
-         swan2coh.f90 \\
-         swancom1.F \\
-         swancom2.for \\
-         swancom3.for \\
-         swancom4.for \\
-         swancom5.for \\
-         swanmain.F \\
-         swanout1.for \\
-         swanout2.for \\
-         swanparll.F \\
-         swanpre1.for \\
-         swanpre2.for \\
-         swanser.for
+         \$(SRC_DIR)/swmod1.for \\
+         \$(SRC_DIR)/SwanGriddata.f90 \\
+         \$(SRC_DIR)/swmod2.F \\
+         \$(SRC_DIR)/nctablemd.f90 \\
+         \$(SRC_DIR)/netcdf_tools.f90 \\
+         \$(SRC_DIR)/agioncmd.f90 \\
+         \$(SRC_DIR)/swn_outnc.f90 \\
+         \$(SRC_DIR)/HRextensions.f90 \\
+         \$(SRC_DIR)/SdsBabanin.f90 \\
+         \$(SRC_DIR)/SwanBndStruc.f90 \\
+         \$(SRC_DIR)/SwanGridobjects.f90 \\
+         \$(SRC_DIR)/SwanCompdata.f90 \\
+         \$(SRC_DIR)/SwanBpntlist.f90 \\
+         \$(SRC_DIR)/SwanCheckGrid.f90 \\
+         \$(SRC_DIR)/SwanCompUnstruc.f90 \\
+         \$(SRC_DIR)/SwanComputeForce.f90 \\
+         \$(SRC_DIR)/SwanConvAccur.f90 \\
+         \$(SRC_DIR)/SwanConvStopc.f90 \\
+         \$(SRC_DIR)/SwanCreateEdges.f90 \\
+         \$(SRC_DIR)/SwanCrossObstacle.f90 \\
+         \$(SRC_DIR)/SwanDiffPar.f90 \\
+         \$(SRC_DIR)/SwanDispParm.f90 \\
+         \$(SRC_DIR)/SwanFindObstacles.f90 \\
+         \$(SRC_DIR)/SwanFindPoint.f90 \\
+         \$(SRC_DIR)/SwanGSECorr.f90 \\
+         \$(SRC_DIR)/SwanGradDepthorK.f90 \\
+         \$(SRC_DIR)/SwanGradVel.f90 \\
+         \$(SRC_DIR)/SwanGridCell.f90 \\
+         \$(SRC_DIR)/SwanGridFace.f90 \\
+         \$(SRC_DIR)/SwanGridTopology.f90 \\
+         \$(SRC_DIR)/SwanGridVert.f90 \\
+         \$(SRC_DIR)/SwanInitCompGrid.f90 \\
+         \$(SRC_DIR)/SwanInterpolateAc.f90 \\
+         \$(SRC_DIR)/SwanInterpolateOutput.f90 \\
+         \$(SRC_DIR)/SwanInterpolatePoint.f90 \\
+         \$(SRC_DIR)/SwanIntgratSpc.f90 \\
+         \$(SRC_DIR)/SwanMaxOverNodes.f90 \\
+         \$(SRC_DIR)/SwanMinOverNodes.f90 \\
+         \$(SRC_DIR)/SwanPointinMesh.f90 \\
+         \$(SRC_DIR)/SwanPrepComp.f90 \\
+         \$(SRC_DIR)/SwanPrintGridInfo.f90 \\
+         \$(SRC_DIR)/SwanPropvelS.f90 \\
+         \$(SRC_DIR)/SwanPropvelX.f90 \\
+         \$(SRC_DIR)/SwanPunCollect.f90 \\
+         \$(SRC_DIR)/SwanReadADCGrid.f90 \\
+         \$(SRC_DIR)/SwanReadEasymeshGrid.f90 \\
+         \$(SRC_DIR)/SwanReadGrid.f90 \\
+         \$(SRC_DIR)/SwanReadTriangleGrid.f90 \\
+         \$(SRC_DIR)/SwanReadfort18.f90 \\
+         \$(SRC_DIR)/SwanSpectPart.for \\
+         \$(SRC_DIR)/SwanSumOverNodes.f90 \\
+         \$(SRC_DIR)/SwanSweepSel.f90 \\
+         \$(SRC_DIR)/SwanThreadBounds.f90 \\
+         \$(SRC_DIR)/SwanTranspAc.f90 \\
+         \$(SRC_DIR)/SwanTranspX.f90 \\
+         \$(SRC_DIR)/SwanVertlist.f90 \\
+         \$(SRC_DIR)/couple2adcirc.f90 \\
+         \$(SRC_DIR)/m_constants.f90 \\
+         \$(SRC_DIR)/m_fileio.f90 \\
+         \$(SRC_DIR)/serv_xnl4v5.f90 \\
+         \$(SRC_DIR)/mod_xnl4v5.f90 \\
+         \$(SRC_DIR)/ocpcre.for \\
+         \$(SRC_DIR)/ocpids.F \\
+         \$(SRC_DIR)/ocpmix.for \\
+         \$(SRC_DIR)/swan2coh.f90 \\
+         \$(SRC_DIR)/swancom1.F \\
+         \$(SRC_DIR)/swancom2.for \\
+         \$(SRC_DIR)/swancom3.for \\
+         \$(SRC_DIR)/swancom4.for \\
+         \$(SRC_DIR)/swancom5.for \\
+         \$(SRC_DIR)/swanmain.F \\
+         \$(SRC_DIR)/swanout1.for \\
+         \$(SRC_DIR)/swanout2.for \\
+         \$(SRC_DIR)/swanparll.F \\
+         \$(SRC_DIR)/swanpre1.for \\
+         \$(SRC_DIR)/swanpre2.for \\
+         \$(SRC_DIR)/swanser.for
 #-------------------------------------------------------------------------------
 #Libraries
"
patchfile_03["$group-$index"]="third_party_open/swan/swan_omp/Makefile.am"
builder["$group-$index"]="delft3d"
dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.8.0 netcdf-fortran/hdf5.110/$mpilib/$compilo/4.5.3 ruby/$compilo/2.7.2"
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
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"	

fi # end-MPI-only

