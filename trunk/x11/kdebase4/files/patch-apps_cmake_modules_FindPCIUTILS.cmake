--- ./apps/cmake/modules/FindPCIUTILS.cmake.orig	2008-08-07 15:20:57.000000000 +0000
+++ ./apps/cmake/modules/FindPCIUTILS.cmake	2008-12-27 11:49:04.000000000 +0000
@@ -14,7 +14,11 @@
 FIND_LIBRARY(PCIUTILS_LIBRARY NAMES pci)
 if(PCIUTILS_LIBRARY)
   FIND_LIBRARY(RESOLV_LIBRARY NAMES resolv)
-  set(PCIUTILS_LIBRARIES ${PCIUTILS_LIBRARY} ${RESOLV_LIBRARY})
+  if(RESOLV_LIBRARY)
+    set(PCIUTILS_LIBRARIES ${PCIUTILS_LIBRARY} ${RESOLV_LIBRARY})
+  else(RESOLV_LIBRARY)
+    set(PCIUTILS_LIBRARIES ${PCIUTILS_LIBRARY})
+  endif(RESOLV_LIBRARY)
 endif(PCIUTILS_LIBRARY)
 
 
