--- src/via_id.c.orig	2008-08-18 18:25:16.000000000 -0400
+++ src/via_id.c	2008-11-11 21:20:14.000000000 -0500
@@ -207,6 +207,7 @@
     {"VIA VT3343 (P4M890)",                   VIA_P4M890,  0x1106, 0x3343, VIA_DEVICE_CRT},
     {"MSI P4M890M-L/IL (MS-7255)",            VIA_P4M890,  0x1462, 0x7255, VIA_DEVICE_CRT},
     {"Biostar P4M890-M7 TE",                  VIA_P4M890,  0x1565, 0x1207, VIA_DEVICE_CRT},
+    {"Mitac 8624 (Joybook R41E)",             VIA_P4M890,  0x1071, 0x8624, VIA_DEVICE_CRT | VIA_DEVICE_LCD},
     {"ASRock P4VM890",                        VIA_P4M890,  0x1849, 0x3343, VIA_DEVICE_CRT},
 
     /* keep this */
