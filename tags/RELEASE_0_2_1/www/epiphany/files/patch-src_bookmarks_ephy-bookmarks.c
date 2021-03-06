--- src/bookmarks/ephy-bookmarks.c.orig	Sat Apr 15 04:11:39 2006
+++ src/bookmarks/ephy-bookmarks.c	Sat Apr 15 04:13:43 2006
@@ -92,7 +92,10 @@ static const EphyBookmarksBookmarkInfo d
 	 * For instance in .nl these should be
 	 * "http://www.google.nl" and "http://www.google.nl/search?q=%s"
 	 */
-	{ N_("Search the web"), N_("http://www.google.com/search?q=%s&ie=UTF-8&oe=UTF-8") }
+	{ N_("Search the web"), N_("http://www.google.com/search?q=%s&ie=UTF-8&oe=UTF-8") },
+	{ N_("The MidnightBSD Project"), N_("http://www.midnightbsd.org/") },
+	{ N_("MidnightBSD Developer Blog"), N_("http://www.justjournal.com/users/mbsd") },
+	{ N_("Magus"), N_("http://www.midnightbsd.org/magus/") }
 };
 
 static const char *default_topics [] =
