--- gstrfuncs.c.orig	2001-02-27 07:00:22.000000000 +0100
+++ gstrfuncs.c	2004-03-01 13:19:49.531603760 +0100
@@ -867,7 +867,7 @@
                   /* beware of positional parameters
                    */
                 case '$':
-                  g_warning (G_GNUC_PRETTY_FUNCTION
+                  g_warning ("%s%s", G_GNUC_PRETTY_FUNCTION,
                              "(): unable to handle positional parameters (%%n$)");
                   len += 1024; /* try adding some safety padding */
                   break;
@@ -1034,7 +1034,7 @@
                   /*          n   .   dddddddddddddddddddddddd   E   +-  eeee */
                   conv_len += 1 + 1 + MAX (24, spec.precision) + 1 + 1 + 4;
                   if (spec.mod_extra_long)
-                    g_warning (G_GNUC_PRETTY_FUNCTION
+                    g_warning ("%s%s", G_GNUC_PRETTY_FUNCTION,
                                "(): unable to handle long double, collecting double only");
 #ifdef HAVE_LONG_DOUBLE
 #error need to implement special handling for long double
@@ -1077,7 +1077,7 @@
                   conv_done = TRUE;
                   if (spec.mod_long)
                     {
-                      g_warning (G_GNUC_PRETTY_FUNCTION
+                      g_warning ("%s%s", G_GNUC_PRETTY_FUNCTION,
                                  "(): unable to handle wide char strings");
                       len += 1024; /* try adding some safety padding */
                     }
@@ -1108,9 +1108,8 @@
                   conv_len += format - spec_start;
                   break;
                 default:
-                  g_warning (G_GNUC_PRETTY_FUNCTION
-                             "(): unable to handle `%c' while parsing format",
-                             c);
+                  g_warning ("%s(): unable to handle `%c' while parsing format",
+                             G_GNUC_PRETTY_FUNCTION, c);
                   break;
                 }
               conv_done |= conv_len > 0;
