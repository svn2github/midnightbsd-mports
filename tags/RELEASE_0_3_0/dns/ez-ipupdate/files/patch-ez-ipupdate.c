
$FreeBSD: ports/dns/ez-ipupdate/files/patch-ez-ipupdate.c,v 1.1 2004/11/11 15:46:04 naddy Exp $

--- ez-ipupdate.c.orig
+++ ez-ipupdate.c
@@ -798,7 +798,7 @@
     sprintf(buf, "message incomplete because your OS sucks: %s\n", fmt);
 #endif
 
-    syslog(LOG_NOTICE, buf);
+    syslog(LOG_NOTICE, "%s", buf);
   }
   else
   {
