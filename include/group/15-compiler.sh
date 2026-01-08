#!/bin/bash

#################################################################
#Group 15 : Compilers
group="15"
groupname[$group]="Compilers"

# gcc 7.5.0
index=1
name["$group-$index"]=gcc
version["$group-$index"]=7.5.0
details["$group-$index"]=""
url["$group-$index"]="https://mirror.snale.net/gcc-7.5.0.tar.gz" 
filename["$group-$index"]=gcc-7.5.0.tar.gz
dirname["$group-$index"]=gcc-7.5.0
patch_01["$group-$index"]="--- original/gcc-7.5.0/libgo/runtime/proc.c	2017-01-26 20:05:16.000000000 +0100
+++ gcc-7.5.0/libgo/runtime/proc.c	2025-10-15 20:49:52.000000000 +0200
@@ -1352,7 +1352,7 @@
 		if(signalstack) {
 			stacksize = 32 * 1024; // OS X wants >= 8K, GNU/Linux >= 2K
 #ifdef SIGSTKSZ
-			if(stacksize < SIGSTKSZ)
+			if(stacksize < (unsigned int)SIGSTKSZ)
 				stacksize = SIGSTKSZ;
 #endif
 		}
"
patchfile_01["$group-$index"]="libgo/runtime/proc.c"
patch_02["$group-$index"]="--- original/gcc-7.5.0/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc	2016-11-08 23:04:09.000000000 +0100
+++ gcc-7.5.0/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc	2025-10-16 10:03:56.000000000 +0200
@@ -361,15 +361,6 @@
 
 #if SANITIZER_LINUX && !SANITIZER_ANDROID
   // _(SIOCDEVPLIP, WRITE, struct_ifreq_sz); // the same as EQL_ENSLAVE
-  _(CYGETDEFTHRESH, WRITE, sizeof(int));
-  _(CYGETDEFTIMEOUT, WRITE, sizeof(int));
-  _(CYGETMON, WRITE, struct_cyclades_monitor_sz);
-  _(CYGETTHRESH, WRITE, sizeof(int));
-  _(CYGETTIMEOUT, WRITE, sizeof(int));
-  _(CYSETDEFTHRESH, NONE, 0);
-  _(CYSETDEFTIMEOUT, NONE, 0);
-  _(CYSETTHRESH, NONE, 0);
-  _(CYSETTIMEOUT, NONE, 0);
   _(EQL_EMANCIPATE, WRITE, struct_ifreq_sz);
   _(EQL_ENSLAVE, WRITE, struct_ifreq_sz);
   _(EQL_GETMASTRCFG, WRITE, struct_ifreq_sz);
"
patchfile_02["$group-$index"]="libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc"
patch_03["$group-$index"]="--- original/gcc-7.5.0/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc	2018-05-31 11:59:35.000000000 +0200
+++ gcc-7.5.0/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc	2025-10-16 10:45:51.000000000 +0200
@@ -154,7 +154,6 @@
 # include <sys/procfs.h>
 #endif
 #include <sys/user.h>
-#include <linux/cyclades.h>
 #include <linux/if_eql.h>
 #include <linux/if_plip.h>
 #include <linux/lp.h>
@@ -454,7 +453,6 @@
 
 #if SANITIZER_LINUX && !SANITIZER_ANDROID
   unsigned struct_ax25_parms_struct_sz = sizeof(struct ax25_parms_struct);
-  unsigned struct_cyclades_monitor_sz = sizeof(struct cyclades_monitor);
 #if EV_VERSION > (0x010000)
   unsigned struct_input_keymap_entry_sz = sizeof(struct input_keymap_entry);
 #else
@@ -821,15 +819,6 @@
 #endif // SANITIZER_LINUX || SANITIZER_FREEBSD
 
 #if SANITIZER_LINUX && !SANITIZER_ANDROID
-  unsigned IOCTL_CYGETDEFTHRESH = CYGETDEFTHRESH;
-  unsigned IOCTL_CYGETDEFTIMEOUT = CYGETDEFTIMEOUT;
-  unsigned IOCTL_CYGETMON = CYGETMON;
-  unsigned IOCTL_CYGETTHRESH = CYGETTHRESH;
-  unsigned IOCTL_CYGETTIMEOUT = CYGETTIMEOUT;
-  unsigned IOCTL_CYSETDEFTHRESH = CYSETDEFTHRESH;
-  unsigned IOCTL_CYSETDEFTIMEOUT = CYSETDEFTIMEOUT;
-  unsigned IOCTL_CYSETTHRESH = CYSETTHRESH;
-  unsigned IOCTL_CYSETTIMEOUT = CYSETTIMEOUT;
   unsigned IOCTL_EQL_EMANCIPATE = EQL_EMANCIPATE;
   unsigned IOCTL_EQL_ENSLAVE = EQL_ENSLAVE;
   unsigned IOCTL_EQL_GETMASTRCFG = EQL_GETMASTRCFG;
@@ -1145,7 +1134,7 @@
 CHECK_SIZE_AND_OFFSET(ipc_perm, gid);
 CHECK_SIZE_AND_OFFSET(ipc_perm, cuid);
 CHECK_SIZE_AND_OFFSET(ipc_perm, cgid);
-#if !defined(__aarch64__) || !SANITIZER_LINUX || __GLIBC_PREREQ (2, 21)
+#if !SANITIZER_LINUX || __GLIBC_PREREQ (2, 21)
 /* On aarch64 glibc 2.20 and earlier provided incorrect mode field.  */
 CHECK_SIZE_AND_OFFSET(ipc_perm, mode);
 #endif
"
patchfile_03["$group-$index"]="libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc"
patch_04["$group-$index"]="--- original/gcc-7.5.0/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h	2017-01-10 16:22:56.000000000 +0100
+++ gcc-7.5.0/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h	2025-10-16 10:49:50.000000000 +0200
@@ -204,27 +204,14 @@
     unsigned __seq;
     u64 __unused1;
     u64 __unused2;
-#elif defined(__mips__) || defined(__aarch64__) || defined(__s390x__)
-    unsigned int mode;
-    unsigned short __seq;
-    unsigned short __pad1;
-    unsigned long __unused1;
-    unsigned long __unused2;
 #elif defined(__sparc__)
-# if defined(__arch64__)
     unsigned mode;
-    unsigned short __pad1;
-# else
-    unsigned short __pad1;
-    unsigned short mode;
     unsigned short __pad2;
-# endif
     unsigned short __seq;
     unsigned long long __unused1;
     unsigned long long __unused2;
 #else
-    unsigned short mode;
-    unsigned short __pad1;
+    unsigned int mode;
     unsigned short __seq;
     unsigned short __pad2;
 #if defined(__x86_64__) && !defined(_LP64)
@@ -1000,7 +987,6 @@
 
 #if SANITIZER_LINUX && !SANITIZER_ANDROID
   extern unsigned struct_ax25_parms_struct_sz;
-  extern unsigned struct_cyclades_monitor_sz;
   extern unsigned struct_input_keymap_entry_sz;
   extern unsigned struct_ipx_config_data_sz;
   extern unsigned struct_kbdiacrs_sz;
@@ -1345,15 +1331,6 @@
 #endif  // SANITIZER_LINUX || SANITIZER_FREEBSD
 
 #if SANITIZER_LINUX && !SANITIZER_ANDROID
-  extern unsigned IOCTL_CYGETDEFTHRESH;
-  extern unsigned IOCTL_CYGETDEFTIMEOUT;
-  extern unsigned IOCTL_CYGETMON;
-  extern unsigned IOCTL_CYGETTHRESH;
-  extern unsigned IOCTL_CYGETTIMEOUT;
-  extern unsigned IOCTL_CYSETDEFTHRESH;
-  extern unsigned IOCTL_CYSETDEFTIMEOUT;
-  extern unsigned IOCTL_CYSETTHRESH;
-  extern unsigned IOCTL_CYSETTIMEOUT;
   extern unsigned IOCTL_EQL_EMANCIPATE;
   extern unsigned IOCTL_EQL_ENSLAVE;
   extern unsigned IOCTL_EQL_GETMASTRCFG;
"
patchfile_04["$group-$index"]="libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h"
builder["$group-$index"]="gcc"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="--enable-languages=c,c++,fortran,go --enable-bootstrap --disable-multilib"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib64
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib64
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# gcc 11.5.0
index=2
name["$group-$index"]=gcc
version["$group-$index"]=11.5.0
details["$group-$index"]=""
url["$group-$index"]="https://github.com/gcc-mirror/gcc/archive/refs/tags/releases/gcc-11.5.0.zip" 
filename["$group-$index"]=gcc-11.5.0.zip
dirname["$group-$index"]=gcc-releases-gcc-11.5.0
builder["$group-$index"]="gcc"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="--enable-languages=c,c++,fortran,go --enable-bootstrap --disable-multilib"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib64
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib64
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"
