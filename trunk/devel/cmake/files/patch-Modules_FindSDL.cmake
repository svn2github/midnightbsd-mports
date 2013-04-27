--- Modules/FindSDL.cmake.orig	2012-11-06 21:41:36.000000000 +0200
+++ Modules/FindSDL.cmake	2012-11-27 22:34:53.000000000 +0200
@@ -73,6 +73,11 @@
   PATH_SUFFIXES include/SDL include/SDL12 include/SDL11 include
 )
 
+# On FreeBSD SDL depends on libiconv and SDL_stdinc.h includes iconv.h, which is
+# located in ${LOCALBASE}/include. Append {LOCALBASE}/include to
+# the SDL_INCLUDE_DIR, thus allow to build SDL apps out of box.
+list(APPEND SDL_INCLUDE_DIR /usr/local/include)
+
 # SDL-1.1 is the name used by FreeBSD ports...
 # don't confuse it for the version number.
 find_library(SDL_LIBRARY_TEMP
@@ -83,7 +88,7 @@
 )
 
 if(NOT SDL_BUILDING_LIBRARY)
-  if(NOT ${SDL_INCLUDE_DIR} MATCHES ".framework")
+  if(NOT "${SDL_INCLUDE_DIR}" MATCHES ".framework")
     # Non-OS X framework versions expect you to also dynamically link to
     # SDLmain. This is mainly for Windows and OS X. Other (Unix) platforms
     # seem to provide SDLmain for compatibility even though they don't
