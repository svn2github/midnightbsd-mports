# New ports collection makefile for:	squid24
# Date created:		Tue Mar 27 14:56:08 CEST 2001
# Whom:			Adrian Chadd <adrian@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/www/squid/Makefile,v 1.209 2008/04/05 00:46:55 beech Exp $
#
# Tunables not (yet) configurable via 'make config':
# SQUID_{U,G}ID
#   Which user/group Squid should run as (default: squid/squid).
#   The user and group will be created if they do not already exist using
#   a uid:gid of 100:100.
#   NOTE: older versions of Squid defaulted to nobody/nogroup.
#   If you wish to run Squid as "nobody" (which is not recommended), please
#   define SQUID_UID=nobody and SQUID_GID=nogroup in your make environment
#   before you start the update or installation of this port.
#
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
#   in the Squid source distribution for the complete list of additional
#   options.
#   Note that you probably do not need to worry about these options in most
#   cases, they are included in case you want to experiment with them.
#
#    --enable-dlmalloc
#     Compile and use the malloc package from Doug Lea
#    --enable-gnuregex
#     Compile and use the supplied GNUregex routines instead of BSD regex
#     (not recommended).
#    --enable-xmalloc-statistics
#     Show malloc statistics in status page
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
#    --enable-x-accelerator-vary
#     Enable support for the X-Accelerator-Vary HTTP header. Can be used
#     to indicate variance within an accelerator setup. Typically used
#     together with other code that adds custom HTTP headers to the
#     requests.
#    --enable-forward-log
#     Enable experimental forward_log directive.
#    --enable-multicast-miss
#     Enable experimental multicast notification of cachemisses.

PORTNAME=	squid
PORTVERSION=	2.7.${SQUID_STABLE_VER}
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	ftp://ftp.squid-cache.org/pub/%SUBDIR%/ \
		http://mirrors.ccs.neu.edu/Squid/ \
		ftp://ftp.fu-berlin.de/unix/www/squid/squid/ \
		ftp://ftp.nl.uu.net/pub/unix/www/squid/ \
		ftp://ftp.solnet.ch/mirror/squid/ \
		ftp://ftp.ntua.gr/pub/www/Squid/squid/ \
		http://mirror.aarnet.edu.au/pub/squid/squid/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,net/www/squid,} \
		http://www.squid-cache.org/Versions/v2/2.7/ \
		http://www2.us.squid-cache.org/Versions/v2/2.7/ \
		http://www1.at.squid-cache.org/Versions/v2/2.7/ \
		http://www2.de.squid-cache.org/Versions/v2/2.7/ \
		http://www.eu.squid-cache.org/Versions/v2/2.7/ \
		http://www1.ie.squid-cache.org/Versions/v2/2.7/ \
		http://www1.jp.squid-cache.org/Versions/v2/2.7/ \
		http://www2.tw.squid-cache.org/Versions/v2/2.7/
MASTER_SITE_SUBDIR=	squid
DISTNAME=	squid-2.7.STABLE${SQUID_STABLE_VER}
DIST_SUBDIR=	squid2.7

PATCH_SITES=	http://www.squid-cache.org/%SUBDIR%/ \
		http://www2.us.squid-cache.org/%SUBDIR%/ \
		http://www1.at.squid-cache.org/%SUBDIR%/ \
		http://www2.de.squid-cache.org/%SUBDIR%/ \
		http://www.eu.squid-cache.org/%SUBDIR%/ \
		http://www1.ie.squid-cache.org/%SUBDIR%/ \
		http://www1.jp.squid-cache.org/%SUBDIR%/ \
		http://www2.tw.squid-cache.org/%SUBDIR%/
PATCH_SITE_SUBDIR=	Versions/v2/2.7/changesets
PATCHFILES=
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP Caching Proxy

LICENSE=	gpl2

SQUID_STABLE_VER=	9

CONFLICTS=	squid-2.[^7]* squid-3.* cacheboy-[0-9]*
GNU_CONFIGURE=	yes
USES=		tar:bzip2
USE_PERL5=	yes
USE_RC_SUBR=	squid

SQUID_UID?=	squid
SQUID_GID?=	squid

MAN8=		cachemgr.cgi.8 squid.8
docs=		QUICKSTART README RELEASENOTES.html doc/debug-sections.txt
PORTDOCS=	${docs:T}
PORTEXAMPLES=	passwd.sql
SUB_FILES+=	pkg-deinstall pkg-install pkg-message
SUB_LIST+=	SQUID_UID=${SQUID_UID} SQUID_GID=${SQUID_GID}

OPTIONS=	SQUID_LDAP_AUTH "Install LDAP authentication helpers" off \
		SQUID_SASL_AUTH "Install SASL authentication helpers" off \
		SQUID_DELAY_POOLS "Enable delay pools" off \
		SQUID_SNMP "Enable SNMP support" off \
		SQUID_CARP "Enable CARP support" on \
		SQUID_SSL "Enable SSL support for reverse proxies" off \
		SQUID_PINGER "Install the icmp helper" off \
		SQUID_DNS_HELPER "Use the old 'dnsserver' helper" off \
		SQUID_HTCP "Enable HTCP support" off \
		SQUID_VIA_DB "Enable forward/via database" off \
		SQUID_CACHE_DIGESTS "Enable cache digests" off \
		SQUID_WCCP "Enable Web Cache Coordination Prot. v1" on \
		SQUID_WCCPV2 "Enable Web Cache Coordination Prot. v2" off \
		SQUID_STRICT_HTTP "Be strictly HTTP compliant" off \
		SQUID_IDENT "Enable ident (RFC 931) lookups" on \
		SQUID_REFERER_LOG "Enable Referer-header logging" off \
		SQUID_USERAGENT_LOG "Enable User-Agent-header logging" off \
		SQUID_ARP_ACL "Enable ACLs based on ethernet address" off \
		SQUID_PF "Enable transparent proxying with PF" off \
		SQUID_IPFILTER "Enable transp. proxying with IPFilter" off \
		SQUID_FOLLOW_XFF "Follow X-Forwarded-For headers" off \
		SQUID_AUFS "Enable the aufs storage scheme" off \
		SQUID_COSS "Enable the COSS storage scheme" off \
		SQUID_KQUEUE "Use kqueue(2) instead of poll(2)" on \
		SQUID_LARGEFILE "Support log and cache files >2GB" off \
		SQUID_STACKTRACES "Create backtraces on fatal errors" off

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

libexec=	cachemgr.cgi digest_pw_auth diskd-daemon \
		ip_user_check logfile-daemon \
		msnt_auth ncsa_auth ntlm_auth \
		pam_auth smb_auth smb_auth.sh squid_db_auth squid_session \
		squid_unix_group wbinfo_group.pl
.if !defined(SQUID_CONFIGURE_ARGS) || ${SQUID_CONFIGURE_ARGS:M*--disable-unlinkd*} == ""
libexec+=	unlinkd
.endif

sbin=		RunCache squidclient squid

CONFIGURE_ARGS=	--bindir=${PREFIX}/sbin  \
		--sbindir=${PREFIX}/sbin  \
		--datadir=${PREFIX}/etc/squid \
		--libexecdir=${PREFIX}/libexec/squid \
		--localstatedir=${PREFIX}/squid \
		--sysconfdir=${PREFIX}/etc/squid \
		--enable-removal-policies="lru heap" \
		--disable-linux-netfilter \
		--disable-linux-tproxy \
		--disable-epoll

.include <bsd.mport.options.mk>

# Authentication methods and modules:

basic_auth=	DB NCSA PAM MSNT SMB
digest_auth=	password
external_acl=	ip_user session unix_group wbinfo_group
MAN8+=		ncsa_auth.8 pam_auth.8 squid_db_auth.8 squid_session.8 \
		squid_unix_group.8
.if defined(WITH_SQUID_LDAP_AUTH)
USE_OPENLDAP=	yes
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAN8+=		squid_ldap_auth.8 squid_ldap_group.8
basic_auth+=	LDAP
digest_auth+=	ldap
external_acl+=	ldap_group
libexec+=	digest_ldap_auth squid_ldap_auth squid_ldap_group
.endif
.if defined(WITH_SQUID_SASL_AUTH)
LIB_DEPENDS+=	sasl2:${PORTSDIR}/security/cyrus-sasl2
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
CONFIGURE_ARGS+=	--enable-auth="basic digest negotiate ntlm" \
			--enable-basic-auth-helpers="${basic_auth}" \
			--enable-digest-auth-helpers="${digest_auth}" \
			--enable-external-acl-helpers="${external_acl}" \
			--enable-ntlm-auth-helpers="SMB"
.if !defined(NO_KERBEROS) && !defined(WITHOUT_KERBEROS)
# XXX This currently only works with heimdal from the base system,
#     see files/patch-helpers_negotiate_auth-squid_kerb_auth_*
CONFIGURE_ARGS+=	--enable-negotiate-auth-helpers="squid_kerb_auth"
libexec+=	squid_kerb_auth
.endif

# Storage schemes:

storage_schemes=	ufs diskd null
.if defined(WITH_SQUID_AUFS)
storage_schemes+=	aufs
.if ${OSVERSION}<3004
# Only document libmap.conf for releases where it may be needed to
# switch from libpthread (aka libkse) to libthr:
EXTRA_PATCHES+=		${PATCHDIR}/extra-patch-src-cf.data.pre.aufs
.endif
# Nil aufs threads is default, set any other value via SQUID_CONFIGURE_ARGS
CONFIGURE_ARGS+=	--with-pthreads
CFLAGS+=	${PTHREAD_CFLAGS}
.endif
.if defined(WITH_SQUID_COSS)
storage_schemes+=	coss
.if !defined(WITH_SQUID_AUFS)
# use Posix AIO instead of aufs' AIO; note that you then need the kernel to
# supply AIO support, either by loading the aio(4) module (n/a on 4.x) or by
# adding the option VFS_AIO to your kernel configuration if you want to
# actually use COSS storage:
CONFIGURE_ARGS+=	--enable-coss-aio-ops
.endif
sbin+=		cossdump
.endif
CONFIGURE_ARGS+=	--enable-storeio="${storage_schemes}"

# Other options set via 'make config':

.if defined(WITH_SQUID_DELAY_POOLS)
CONFIGURE_ARGS+=	--enable-delay-pools
.endif
.if defined(WITH_SQUID_SNMP)
CONFIGURE_ARGS+=	--enable-snmp
.endif
.if defined(WITHOUT_SQUID_CARP)
CONFIGURE_ARGS+=	--disable-carp
.endif
.if defined(WITH_SQUID_SSL)
# we need to .include bsd.openssl.mk manually here.because USE_OPENSSL only
# works when it is defined before bsd.port{.pre}.mk is .included.
# This makes it currently impossible to combine this macro with OPTIONS to
# conditionally include OpenSSL support.
EXTENSIONS+=		openssl
CONFIGURE_ARGS+=	--enable-ssl \
			--with-openssl="${OPENSSLBASE}"
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
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
.if defined(WITH_SQUID_WCCPV2)
CONFIGURE_ARGS+=	--enable-wccpv2
.endif
.if defined(WITH_SQUID_STRICT_HTTP)
CONFIGURE_ARGS+=	--disable-http-violations
.endif
.if defined(WITHOUT_SQUID_IDENT)
CONFIGURE_ARGS+=	--disable-ident-lookups
.endif
.if defined(WITH_SQUID_REFERER_LOG)
CONFIGURE_ARGS+=	--enable-referer-log
.endif
.if defined(WITH_SQUID_USERAGENT_LOG)
CONFIGURE_ARGS+=	--enable-useragent-log
.endif
.if defined(WITH_SQUID_ARP_ACL)
CONFIGURE_ARGS+=	--enable-arp-acl
.endif
.if defined(WITH_SQUID_PF)
CONFIGURE_ARGS+=	--enable-pf-transparent
.endif
.if defined(WITH_SQUID_IPFILTER)
CONFIGURE_ARGS+=	--enable-ipf-transparent
.endif
.if defined(WITH_SQUID_FOLLOW_XFF)
CONFIGURE_ARGS+=	--enable-follow-x-forwarded-for
.endif
.if defined(WITH_SQUID_ICAP)
IGNORE=		does not have working ICAP support anymore -- please use Squid 3.x if you need ICAP. Please remove WITH_SQUID_ICAP from your make environment
.endif
.if defined(WITHOUT_SQUID_KQUEUE)
CONFIGURE_ARGS+=	--disable-kqueue
.endif
.if defined(WITH_SQUID_LARGEFILE)
CONFIGURE_ARGS+=	--with-large-files --enable-large-cache-files
.endif

.if defined(WITH_SQUID_STACKTRACES)
CONFIGURE_ARGS+=	--enable-stacktraces
CFLAGS+=	-g
STRIP=
.endif


.include <bsd.port.pre.mk>

# Languages:
#
# If you do not define SQUID_LANGUAGES yourself, all available language files
# will be installed; the default language will be English.

SQUID_LANGUAGES?=	Armenian Azerbaijani Bulgarian Catalan Czech Danish \
			Dutch English Estonian Finnish French German Greek \
			Hebrew Hungarian Italian Japanese Korean Lithuanian \
			Polish Portuguese Romanian Russian-1251 Russian-koi8-r \
			Serbian Simplify_Chinese Slovak Spanish Swedish \
			Traditional_Chinese Turkish Ukrainian-1251 \
			Ukrainian-koi8-u Ukrainian-utf8
SQUID_DEFAULT_LANG?=	English
CONFIGURE_ARGS+=	--enable-err-languages="${SQUID_LANGUAGES}" \
			--enable-default-err-language=${SQUID_DEFAULT_LANG}

# Finally, add additional user specified configuration options:
CONFIGURE_ARGS+=	${SQUID_CONFIGURE_ARGS}

CONFIGURE_ENV+=		CFLAGS="${CFLAGS}" \
			CPPFLAGS="${CPPFLAGS}"\
			LDFLAGS="${LDFLAGS}" \
			GREP="${GREP}"

PLIST_DIRS=	etc/squid/icons libexec/squid
PLIST_FILES=	${etc_files:S,^,etc/,} ${icon_files:S,^,etc/squid/icons/,} \
		${libexec:S,^,libexec/squid/,} ${sbin:S,^,sbin/,}

.for d in ${SQUID_LANGUAGES}
PLIST_DIRS+=	etc/squid/errors/${d}
PLIST_FILES+=	${error_files:S,^,etc/squid/errors/${d}/,}
.endfor
PLIST_DIRS+=	etc/squid/errors etc/squid squid/logs squid/cache squid

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' \
	    ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|%%SQUID_UID%%|${SQUID_UID}|g' \
	    -e 's|%%SQUID_GID%%|${SQUID_GID}|g' \
	    -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/src/cf.data.pre
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
	    ${WRKSRC}/helpers/basic_auth/SMB/Makefile.in \
	    ${WRKSRC}/helpers/basic_auth/SMB/smb_auth.sh

pre-install:
# Prevent installation of .orig files by deleting them.
	@${FIND} ${WRKSRC} -name '*.bak' -delete
	@${FIND} ${WRKSRC} -name '*.orig' -delete

post-install:
.if !defined(NOPORTEXAMPLES)
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/helpers/basic_auth/DB/passwd.sql ${EXAMPLESDIR}
.endif
.if defined(WITH_SQUID_PINGER)
	${CHMOD} 4510 ${PREFIX}/libexec/squid/pinger; \
	${CHGRP} ${SQUID_GID} ${PREFIX}/libexec/squid/pinger
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${docs} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
