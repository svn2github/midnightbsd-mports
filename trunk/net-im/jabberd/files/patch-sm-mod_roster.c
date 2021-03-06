--- sm/mod_roster.c.orig	2012-02-12 22:36:18.000000000 +0100
+++ sm/mod_roster.c	2013-06-13 23:42:35.669583304 +0200
@@ -460,7 +460,7 @@
     log_debug(ZONE, "added %s to roster (to %d from %d ask %d name %s ngroups %d)", jid_full(item->jid), item->to, item->from, item->ask, item->name, item->ngroups);
 
     if (sm_storage_rate_limit(sess->user->sm, jid_user(sess->user->jid)))
-        return -stanza_err_RESOURCE_CONSTRAINT;
+        return;
 
     /* save changes */
     _roster_save_item(sess->user, item);
