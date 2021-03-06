
FreeBSD does not have LOGIN_NAME_MAX, but it has MAXLOGNAME instead,
so use it as much as possible.

--- tnftpd.h.orig	2008-06-08 21:24:51.000000000 -0400
+++ tnftpd.h	2008-06-08 21:24:51.000000000 -0400
@@ -548,8 +548,12 @@
 #define TM_YEAR_BASE	1900
 
 #if !defined(LOGIN_NAME_MAX)
+#if defined(MAXLOGNAME)
+# define LOGIN_NAME_MAX MAXLOGNAME
+#else
 # define LOGIN_NAME_MAX (9)
 #endif
+#endif
 
 #if !defined(_POSIX_LOGIN_NAME_MAX)
 # define _POSIX_LOGIN_NAME_MAX LOGIN_NAME_MAX
