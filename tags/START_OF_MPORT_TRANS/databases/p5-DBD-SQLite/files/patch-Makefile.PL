--- Makefile.PL.orig	Fri Sep  8 05:45:13 2006
+++ Makefile.PL	Tue Sep 12 13:59:02 2006
@@ -68,31 +68,31 @@
 
 # Now, check for a compatible sqlite3
 unless ($force_local) {
-    my ($dir, $file, $fh, $version);
+    my ($dir, $file, $version);
     print "Checking installed SQLite version...\n";
     if ($sqlite_inc) {
-        open($fh, '< ' . File::Spec->catfile($sqlite_inc, 'sqlite3.h'))
+        open(FH, '< ' . File::Spec->catfile($sqlite_inc, 'sqlite3.h'))
             or die "Error opening sqlite3.h in $sqlite_inc: $!";
-        while (defined($_ = <$fh>)) {
+        while (defined($_ = <FH>)) {
             if (/\#define\s+SQLITE_VERSION_NUMBER\s+(\d+)/) {
                 $version = $1;
                 last;
             }
         }
-        close($fh);
+        close(FH);
     } else {
         # Go hunting for the file (Matt: Add more dirs here as you see fit)
         for $dir ([ qw(usr include) ], [ qw(usr local include) ]) {
             $file = File::Spec->catfile('', @$dir, 'sqlite3.h');
             next unless (-f $file);
-            open($fh, "< $file") or die "Error opening $file: $!";
-            while (defined($_ = <$fh>)) {
+            open(FH, "< $file") or die "Error opening $file: $!";
+            while (defined($_ = <FH>)) {
                 if (/\#define\s+SQLITE_VERSION_NUMBER\s+(\d+)/) {
                     $version = $1;
                     last;
                 }
             }
-            close($fh);
+            close(FH);
             last if $version;
         }
     }
