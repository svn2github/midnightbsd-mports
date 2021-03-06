# New ports collection makefile for:	squid24
# Date created:		Tue Mar 27 14:56:08 CEST 2001
# Whom:			Adrian Chadd <adrian@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/www/squid/Makefile,v 1.192 2006/11/17 12:51:29 jmelo Exp $
#
# Tunables not (yet) configurable via 'make config':
# SQUID_{U,G}ID
#   Which user/group Squid should run as (default: squid/squid).
#   The user and group will be created if they do not already exist using
#   a uid:gid of 100:100.
#   NOTE: before version 2.5.4_6, these settings defaulted to
#   nobody/nogroup.
#   If you wish to keep these settings, please define SQUID_UID=nobody and
#   SQUID_GID=nogroup in your make environment before you start the update.
#   NOTE2:
#   Before version 2.5.4_11 the numerical id chosen for SQUID_UID (and
#   SQUID_GID respectively) was the first free id greater than or equal 3128.
#   If you wish to move your squid user to id 100:100, run "make changeuser",
#   please see the changeuser target's definition for further information.
# SQUID_LANGUAGES
#   A list of languages for which error page files should be installed
#   (default: all)
#
#   E.g. use `make SQUID_LANGUAGES="English French"' if you want to
#   install the files for these languages only.
#   Use `make -VSQUID_LANGUAGES' or scroll down to this variable's
#   definition to see which values are valid.
#
# SQUID_DEFAULT_LANG
#   If you define SQUID_LANGUAGES, select which language should be the default
#   one (this variable defaults to English). This setting can be overwritten
#   with squid.conf's error_directory directive.
#
# SQUID_CONFIGURE_ARGS
#   Additional configuration options.
#
#   To enable them, use e.g
#   `make SQUID_CONFIGURE_ARGS="--enable-dlmalloc --enable-truncate" install'
#
#   The list below may be incomplete, please see the configure script
#   in the squid source distribution for the complete list of additional
#   options.
#   Note that you probably do not need to worry about these options in most
#   cases, they are included in case you want to experiment with them.
#
#    --enable-dlmalloc
#     Compile and use the malloc package from Doug Lea
#    --enable-gnuregex
#     Compile and use the supplied GNUregex routines instead of BSD regex.
#    --enable-xmalloc-statistics
#     Show malloc statistics in status page
#    --enable-time-hack
#     Optimize time updates to one per second rather than calling gettimeofday()
#    --enable-cachemgr-hostname=some.hostname
#     Set an explicit hostname in cachemgr.cgi
#    --enable-truncate
#     Use truncate() rather than unlink()
#    --disable-unlinkd
#     Do not use "unlinkd"
#    --with-aufs-threads=N_THREADS
#     Tune the number of worker threads for the aufs object
#    --with-coss-membuf-size
#     COSS membuf size (default: 1048576 bytes)
#    --with-maxfd=N
#     Override the maximum number of filedescriptors. Useful if you
#     build as another user who is not privileged to use the amount
#     of filedescriptors the resulting binary is expected to support.
#    --enable-ntlm-fail-open
#     Enable NTLM fail open, where a helper that fails one of the
#     Authentication steps can allow Squid to still authenticate the user
#

PORTNAME=	squid
PORTVERSION=	2.5.14
PORTREVISION=	3
CATEGORIES=	www
MASTER_SITES=	http://www.squid-cache.org/%SUBDIR%/ \
		http://www2.us.squid-cache.org/%SUBDIR%/ \
		http://www3.us.squid-cache.org/%SUBDIR%/ \
		http://www1.at.squid-cache.org/%SUBDIR%/ \
		http://www2.nl.squid-cache.org/%SUBDIR%/ \
		http://www1.ru.squid-cache.org/%SUBDIR%/ \
		http://www1.uk.squid-cache.org/%SUBDIR%/ \
		http://www1.gr.squid-cache.org/%SUBDIR%/ \
		http://www1.jp.squid-cache.org/%SUBDIR%/ \
		http://www1.tw.squid-cache.org/%SUBDIR%/
MASTER_SITE_SUBDIR=	Versions/v2/2.5
DISTNAME=	squid-2.5.STABLE14
DIST_SUBDIR=	squid2.5

PATCH_SITES=	${MASTER_SITES}
PATCH_SITE_SUBDIR=	Versions/v2/2.5/bugs
PATCHFILES=	squid-2.5.STABLE14-httpReplyDestroy.patch \
		squid-2.5.STABLE14-hierarchy_tag.patch
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP Caching Proxy

CONFLICTS=	squid-2.[^5]*
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_PERL5=	yes

SQUID_UID?=	squid
SQUID_GID?=	squid

MAN8=		cachemgr.cgi.8 squid.8
docs=		QUICKSTART README RELEASENOTES.html doc/debug-sections.txt
PORTDOCS=	${docs:T}
SUB_FILES+=	pkg-deinstall pkg-install pkg-message
SUB_LIST+=	SQUID_UID=${SQUID_UID} SQUID_GID=${SQUID_GID}

OPTIONS=	SQUID_LDAP_AUTH "Install LDAP authentication helpers" off \
		SQUID_SASL_AUTH "Install SASL authentication helpers" off \
		SQUID_DELAY_POOLS "Enable delay pools" off \
		SQUID_SNMP "Enable SNMP support" off \
		SQUID_CARP "Enable CARP support" off \
		SQUID_SSL "Enable SSL support for reverse proxies" off \
		SQUID_PINGER "Install the icmp helper" off \
		SQUID_DNS_HELPER "Use the old 'dnsserver' helper" off \
		SQUID_HTCP "Enable HTCP support" off \
		SQUID_VIA_DB "Enable forward/via database" off \
		SQUID_CACHE_DIGESTS "Enable cache digests" off \
		SQUID_WCCP "Enable Web Cache Coordination Protocol" on \
		SQUID_UNDERSCORES "Allow underscores in hostnames" on \
		SQUID_CHECK_HOSTNAME "Do hostname checking" on \
		SQUID_STRICT_HTTP "Be strictly HTTP compliant" off \
		SQUID_IDENT "Enable ident (RFC 931) lookups" on \
		SQUID_USERAGENT_LOG "Enable User-Agent-header logging" off \
		SQUID_CUSTOM_LOG "Enable custom log format" off \
		SQUID_ARP_ACL "Enable ACLs based on ethernet address" off \
		SQUID_PF "Enable transparent proxying with PF" off \
		SQUID_IPFILTER "Enable transp. proxying with IPFilter" off \
		SQUID_FOLLOW_XFF "Follow X-Forwarded-For headers" off \
		SQUID_ICAP "Enable ICAP client functionality" off \
		SQUID_AUFS "Enable the aufs storage scheme" off \
		SQUID_COSS "Enable the COSS storage scheme" off \
		SQUID_LARGEFILE "Support log and cache files >2GB" off \
		SQUID_STACKTRACES "Create backtraces on fatal errors" off \
		SQUID_RCNG "Install an rc.d style startup script" on

etc_files=	squid/cachemgr.conf.default \
		squid/mib.txt squid/mime.conf.default \
		squid/msntauth.conf.default squid/squid.conf.default

icon_files=	anthony-binhex.gif anthony-bomb.gif anthony-box.gif \
		anthony-box2.gif anthony-c.gif anthony-compressed.gif \
		anthony-dir.gif anthony-dirup.gif anthony-dvi.gif \
		anthony-f.gif anthony-image.gif anthony-image2.gif \
		anthony-layout.gif anthony-link.gif anthony-movie.gif \
		anthony-pdf.gif anthony-portal.gif anthony-ps.gif \
		anthony-quill.gif anthony-script.gif anthony-sound.gif \
		anthony-tar.gif anthony-tex.gif anthony-text.gif \
		anthony-unknown.gif anthony-xbm.gif anthony-xpm.gif

error_files=	ERR_ACCESS_DENIED ERR_CACHE_ACCESS_DENIED \
		ERR_CACHE_MGR_ACCESS_DENIED ERR_CANNOT_FORWARD \
		ERR_CONNECT_FAIL ERR_DNS_FAIL ERR_FORWARDING_DENIED \
		ERR_FTP_DISABLED ERR_FTP_FAILURE ERR_FTP_FORBIDDEN \
		ERR_FTP_NOT_FOUND ERR_FTP_PUT_CREATED \
		ERR_FTP_PUT_ERROR ERR_FTP_PUT_MODIFIED ERR_FTP_UNAVAILABLE \
		ERR_INVALID_REQ ERR_INVALID_RESP ERR_INVALID_URL \
		ERR_LIFETIME_EXP ERR_NO_RELAY ERR_ONLY_IF_CACHED_MISS \
		ERR_READ_ERROR ERR_READ_TIMEOUT ERR_SHUTTING_DOWN \
		ERR_SOCKET_FAILURE ERR_TOO_BIG ERR_UNSUP_REQ \
		ERR_URN_RESOLVE ERR_WRITE_ERROR ERR_ZERO_SIZE_OBJECT

libexec=	cachemgr.cgi digest_pw_auth diskd ip_user_check \
		msnt_auth ncsa_auth ntlm_auth \
		pam_auth smb_auth smb_auth.sh squid_unix_group \
		wb_auth wb_group wb_ntlmauth wbinfo_group.pl
.if !defined(SQUID_CONFIGURE_ARGS) || ${SQUID_CONFIGURE_ARGS:M*--disable-unlinkd*} == ""
libexec+=	unlinkd
.endif

sbin=		RunAccel RunCache squidclient squid

CONFIGURE_ARGS=	--bindir=${PREFIX}/sbin  --sysconfdir=${PREFIX}/etc/squid \
		--datadir=${PREFIX}/etc/squid \
		--libexecdir=${PREFIX}/libexec/squid \
		--localstatedir=${PREFIX}/squid \
		--enable-removal-policies="lru heap"

.include <bsd.port.pre.mk>

# Authentication methods and modules:

basic_auth=	NCSA PAM MSNT SMB winbind
external_acl=	ip_user unix_group wbinfo_group winbind_group
MAN8+=		pam_auth.8 squid_unix_group.8
.if defined(WITH_SQUID_LDAP_AUTH)
USE_OPENLDAP=	yes
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAN8+=		squid_ldap_auth.8 squid_ldap_group.8
basic_auth+=	LDAP
external_acl+=	ldap_group
libexec+=	squid_ldap_auth squid_ldap_group
.endif
.if defined(WITH_SQUID_SASL_AUTH)
LIB_DEPENDS+=	sasl2.2:${PORTSDIR}/security/cyrus-sasl2
CFLAGS+=	-I${LOCALBASE}/include
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
basic_auth+=	SASL
libexec+=	sasl_auth
.endif
.if !defined(NO_NIS) && !defined(WITHOUT_NIS)
basic_auth+=	YP
libexec+=	yp_auth
.endif
CONFIGURE_ARGS+=	--enable-auth="basic ntlm digest" \
			--enable-basic-auth-helpers="${basic_auth}" \
			--enable-digest-auth-helpers="password" \
			--enable-external-acl-helpers="${external_acl}" \
			--enable-ntlm-auth-helpers="SMB winbind"

# Selection of storage schemes:

storage_schemes=	ufs diskd null
.if defined(WITH_SQUID_AUFS)
storage_schemes+=	aufs
# Nil aufs threads is default, set any other value via SQUID_CONFIGURE_ARGS
CONFIGURE_ARGS+=	--enable-async-io \
			--with-pthreads
CFLAGS+=	${PTHREAD_CFLAGS}
.endif
.if defined(WITH_SQUID_COSS)
storage_schemes+=	coss
CONFIGURE_ARGS+=	--with-aio
.endif
CONFIGURE_ARGS+=	--enable-storeio="${storage_schemes}"

# Other options set via 'make config':

.if defined(WITH_SQUID_DELAY_POOLS)
CONFIGURE_ARGS+=	--enable-delay-pools
.endif
.if defined(WITH_SQUID_SNMP)
CONFIGURE_ARGS+=	--enable-snmp
.endif
.if defined(WITH_SQUID_CARP)
CONFIGURE_ARGS+=	--enable-carp
.endif
.if defined(WITH_SQUID_SSL)
# we need to .include bsd.openssl.mk manually here because USE_OPENSSL only
# works when it is defined before bsd.port{.pre}.mk is .included and this is
# not possible when using OPTIONS
.include "${PORTSDIR}/Mk/bsd.openssl.mk"
CONFIGURE_ARGS+=	--enable-ssl \
			--with-openssl="${OPENSSLBASE}"
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${LOCALBASE}/lib
.endif
.if defined(WITH_SQUID_PINGER)
CONFIGURE_ARGS+=	--enable-icmp
libexec+=	pinger
.endif
.if defined(WITH_SQUID_DNS_HELPER)
CONFIGURE_ARGS+=	--disable-internal-dns
libexec+=	dnsserver
.endif
.if defined(WITH_SQUID_HTCP)
CONFIGURE_ARGS+=	--enable-htcp
.endif
.if defined(WITH_SQUID_VIA_DB)
CONFIGURE_ARGS+=	--enable-forw-via-db
.endif
.if defined(WITH_SQUID_CACHE_DIGESTS)
CONFIGURE_ARGS+=	--enable-cache-digests
.endif
.if defined(WITHOUT_SQUID_WCCP)
CONFIGURE_ARGS+=	--disable-wccp
.endif
.if !defined(WITHOUT_SQUID_UNDERSCORES)
CONFIGURE_ARGS+=	--enable-underscores
.endif
.if defined(WITHOUT_SQUID_CHECK_HOSTNAME)
CONFIGURE_ARGS+=	--disable-hostname-checks
.endif
.if defined(WITH_SQUID_STRICT_HTTP)
CONFIGURE_ARGS+=	--disable-http-violations
.endif
.if defined(WITHOUT_SQUID_IDENT)
CONFIGURE_ARGS+=	--disable-ident-lookups
.endif
.if defined(WITH_SQUID_USERAGENT_LOG)
CONFIGURE_ARGS+=	--enable-useragent-log
.endif
.if defined(WITH_SQUID_CUSTOM_LOG)
EXTRA_PATCHES+=		${PATCHDIR}/customlog-2.5.patch
.endif
.if defined(WITH_SQUID_ARP_ACL)
CONFIGURE_ARGS+=	--enable-arp-acl
.endif
.if defined(WITH_SQUID_PF)
CONFIGURE_ARGS+=	--enable-pf-transparent
.endif
# IPFilter-headers are not installed on FreeBSD 4 since 4.7-RELEASE,
# they were not installed on FreeBSD 5 from 2002-03-26 (OSVERSION > 500032) to
# 2003-06-27 (OSVERSION < 501101).
#
# Please see PR misc/44148 and the CVS log of src/include/Makefile for further
# information.
.if defined(WITH_SQUID_IPFILTER)
CONFIGURE_ARGS+=	--enable-ipf-transparent
.endif
.if defined(WITH_SQUID_FOLLOW_XFF)
EXTRA_PATCHES+=		${PATCHDIR}/follow_xff-2.5.patch \
			${PATCHDIR}/follow_xff-configure.patch
CONFIGURE_ARGS+=	--enable-follow-x-forwarded-for
.endif
.if defined(WITH_SQUID_ICAP)
EXTRA_PATCHES+=		${PATCHDIR}/icap-2.5-core.patch \
			${PATCHDIR}/icap-2.5-bootstrap.patch
CONFIGURE_ARGS+=	--enable-icap-support
error_files+=		ERR_ICAP_FAILURE
.endif
.if defined(WITH_SQUID_LARGEFILE)
CONFIGURE_ARGS+=	--with-large-files --enable-large-cache-files
.endif
.if defined(WITH_SQUID_STACKTRACES)
CONFIGURE_ARGS+=	--enable-stacktraces
CFLAGS+=	-g
STRIP=			""
.endif
.if !defined(WITHOUT_SQUID_RCNG)
USE_RC_SUBR=	squid.sh
rc_del=		rcold
rc_state=	rcng
.else
SUB_FILES+=	squid.sh
etc_files+=	rc.d/squid.sh
rc_del=		rcng
rc_state=	rcold
.endif

# Languages:
#
# If you do not define SQUID_LANGUAGES yourself, all available language files
# will be installed; the default language will be English.

SQUID_LANGUAGES?=	\
	Azerbaijani Bulgarian Catalan Czech Danish Dutch English Estonian Finnish      \
	French German Greek Hebrew Hungarian Italian Japanese Korean Lithuanian \
	Polish Portuguese Romanian Russian-1251 Russian-koi8-r Serbian     \
	Simplify_Chinese Slovak Spanish Swedish Traditional_Chinese Turkish
SQUID_DEFAULT_LANG?=	English
CONFIGURE_ARGS+=	--enable-err-languages="${SQUID_LANGUAGES}" \
			--enable-default-err-language=${SQUID_DEFAULT_LANG}

# Finally, add additional user specified configuration options:
CONFIGURE_ARGS+=	${SQUID_CONFIGURE_ARGS}

CONFIGURE_ENV+=		CFLAGS="${CFLAGS}" \
			CPPFLAGS="${CPPFLAGS}"\
			LDFLAGS="${LDFLAGS}"

PLIST_DIRS=	etc/squid/icons libexec/squid
PLIST_FILES=	${etc_files:S,^,etc/,} ${icon_files:S,^,etc/squid/icons/,} \
		${libexec:S,^,libexec/squid/,} ${sbin:S,^,sbin/,}

.for d in ${SQUID_LANGUAGES}
PLIST_DIRS+=	etc/squid/errors/${d}
PLIST_FILES+=	${error_files:S,^,etc/squid/errors/${d}/,}
.endfor
PLIST_DIRS+=	etc/squid/errors etc/squid squid/logs squid/cache squid

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|%%SQUID_UID%%|${SQUID_UID}|g' \
	    -e 's|%%SQUID_GID%%|${SQUID_GID}|g' ${WRKSRC}/src/cf.data.pre
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
	    ${WRKSRC}/helpers/basic_auth/SMB/Makefile.in \
	    ${WRKSRC}/helpers/basic_auth/SMB/smb_auth.sh

pre-install:
# Prevent installation of .orig files by deleting them.
	@${FIND} ${WRKSRC} -name '*.bak' -delete
	@${FIND} ${WRKSRC} -name '*.orig' -delete
# create the start script:
	@${REINPLACE_CMD} \
	    -e '/--begin ${rc_del}/,/--end ${rc_del}/d' \
	    -e '/--.*${rc_state}/d' ${WRKDIR}/squid.sh
# create variable information in pkg-message:
	@${REINPLACE_CMD} \
	    -e '/--begin ${rc_del}/,/--end ${rc_del}/d' \
	    -e '/--.*${rc_state}/d' ${PKGMESSAGE}

pre-su-install:
	@${SETENV} ${SCRIPTS_ENV} PKG_PREFIX=${PREFIX} \
	    ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

post-install:
# Create cachemgr.conf.default manually since squid's install routine
# unfortunately fails to do so:
	${INSTALL_DATA} ${WRKSRC}/src/cachemgr.conf \
	    ${PREFIX}/etc/squid/cachemgr.conf.default
.if defined(WITH_SQUID_PINGER)
	${CHMOD} 4510 ${PREFIX}/libexec/squid/pinger; \
	${CHGRP} ${SQUID_GID} ${PREFIX}/libexec/squid/pinger
.endif
.if defined(WITHOUT_SQUID_RCNG)
	${INSTALL_SCRIPT} ${WRKDIR}/squid.sh ${PREFIX}/etc/rc.d/
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${docs} ${DOCSDIR}
.endif
	@${SETENV} PKG_PREFIX=${PREFIX} \
	    ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

	@${ECHO_CMD} "===> post-installation information for ${PKGNAME}:"
	@${ECHO_CMD} ""
	@${CAT} ${PKGMESSAGE}
	@${ECHO_CMD} ""
changeuser:
# Recover from the problem that earlier versions of this port created the
# squid pseudo-user with an id greater than 999 which is not allowed in
# FreeBSD's ports system. The port now uses id 100:100.
# NOTE:
# This target assumes that SQUID_GID is the primary group of SQUID_UID. If you
# have a different setup, do not run this target!
.if ${SQUID_UID:L} == nobody
	@${ECHO_CMD} "'nobody' is a system user, you do not need to execute"; \
	${ECHO_CMD} "this target!"
	${FALSE}
.endif
	@if [ `${ID} -u` -ne 0 ]; \
	then ${ECHO_CMD} "Sorry, you must be root to use this target."; ${FALSE}; fi; \
	current_uid=`id -u ${SQUID_UID}`; \
	current_gid=`pw groupshow ${SQUID_GID}|cut -f 3 -d :`; \
	${ECHO_CMD} "I will remove this user:"; \
	${ID} -P $${current_uid}; \
	${ECHO_CMD} "and this group:"; \
	pw groupshow ${SQUID_GID}; \
	${ECHO_CMD} "I will then re-create them with a user and group id of 100."; \
	${ECHO_CMD} "Then all files and directories under ${PREFIX} and /var that"; \
	${ECHO_CMD} "are owned by uid $${current_uid} will be chown(1)'ed."; \
	${ECHO_CMD} "After that, all files and directories that were accessible"; \
	${ECHO_CMD} "by group $${current_gid} will chgrp(1)'ed respectively."; \
	${ECHO_CMD} "Note that this assumes group '${SQUID_GID}' to be the primary"; \
	${ECHO_CMD} "group of user '${SQUID_UID}'. If you have a different setup"; \
	${ECHO_CMD} "please abort this target now."; \
	read -p "Press RETURN to continue or CTRL-C to abort:" dummy ; \
	${ECHO_CMD} "OK, here we go:"; \
	${ECHO_CMD} "deleting user $${current_uid} and his primary group..."; \
	pw userdel -u $${current_uid}; \
	${ECHO_CMD} "adding user ${SQUID_UID} with id 100..."; \
	pw groupadd -n ${SQUID_GID} -g 100; \
	pw useradd -n ${SQUID_UID} -u 100 -c "squid caching-proxy pseudo user" \
	    -d ${PREFIX}/squid -s /sbin/nologin -h - ; \
	${ECHO_CMD} "chown(1)'ing everything under ${PREFIX} from $${current_uid} to 100..."; \
	${FIND} -H ${PREFIX} -user $${current_uid} -exec ${CHOWN} 100 {} \; ; \
	${ECHO_CMD} "chgrp(1)'ing everything under ${PREFIX} from $${current_gid} to 100..."; \
	${FIND} -H ${PREFIX} -group $${current_gid} -exec ${CHOWN} :100 {} \; ; \
	${ECHO_CMD} "chown(1)'ing everything under /var from $${current_uid} to 100..."; \
	${FIND} -H /var -user $${current_uid} -exec ${CHOWN} 100 {} \; ; \
	${ECHO_CMD} "chgrp(1)'ing everything under /var from $${current_gid} to 100..."; \
	${FIND} -H /var -group $${current_gid} -exec ${CHOWN} :100 {} \; ; \
	${ECHO_CMD} "Finished."

.include <bsd.port.post.mk>
