# $MidnightBSD: mports/lang/php5/Makefile,v 1.35 2010/12/31 14:17:11 laffer1 Exp $

PORTNAME=	php5
PORTVERSION=	5.3.5
PORTREVISION?=	0
CATEGORIES?=	lang devel www
MASTER_SITES=	${MASTER_SITE_PHP:S/$/:release/}
MASTER_SITE_SUBDIR=	distributions/:release
DISTNAME=	php-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:release

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	PHP Scripting Language
LICENSE?=	php

LATEST_LINK=	${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}

USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes
.if !defined(PKGNAMESUFFIX)
USE_AUTOTOOLS=	autoconf:262

LIB_DEPENDS=	pcre.0:${PORTSDIR}/devel/pcre

CONFIGURE_ARGS=	\
		--with-layout=GNU \
		--localstatedir=/var \
		--with-config-file-scan-dir=${PREFIX}/etc/php \
		--disable-all \
		--enable-libxml \
		--with-libxml-dir=${LOCALBASE} \
		--with-pcre-regex=${LOCALBASE} \
		--with-zlib-dir=/usr \
		--program-prefix=""

DESTDIRNAME=	INSTALL_ROOT
USE_GNOME=	libxml2

OPTIONS=	CLI "Build CLI version" on \
		CGI "Build CGI version" on \
		FPM "Build FPM version (experimental)" off \
		APACHE "Build Apache module" off \
		AP2FILTER " Use Apache 2.x filter interface (experimental)" off \
		DEBUG "Enable debug" off \
		SUHOSIN "Enable Suhosin protection system" on \
		MULTIBYTE "Enable zend multibyte support" off \
		IPV6 "Enable ipv6 support" on \
		MAILHEAD "Enable mail header patch" off \
		LINKTHR "Link thread lib (for threaded extensions)" off

CONFLICTS=	php4-4* php5-pcre-* php5-spl-*

MAN1=		php-config.1 phpize.1

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_SUHOSIN)
PATCHFILES+=	suhosin-patch-5.3.4-0.9.10.patch.gz:suhosin
PATCH_SITES+=	http://download.suhosin.org/:suhosin
PATCH_DIST_STRIP=	-p1
PLIST_SUB+=	SUHOSIN=""
.else
PLIST_SUB+=	SUHOSIN="@comment "
.endif

.if defined(WITH_MAILHEAD)
PATCHFILES+=	php-5.3.4-mail-header.patch:mail
PATCH_SITES+=	http://choon.net/opensource/php/:mail
.endif

.if !defined(WITHOUT_CLI)
PHP_SAPI+=	cli
PLIST_SUB+=	CLI=""
MAN1+=		php.1
.else
PLIST_SUB+=	CLI="@comment "
CONFIGURE_ARGS+=--disable-cli
.endif

.if !defined(WITHOUT_CGI)
PHP_SAPI+=	cgi
PLIST_SUB+=	CGI=""
.else
PLIST_SUB+=	CGI="@comment "
CONFIGURE_ARGS+=--disable-cgi
.endif

.if defined(WITH_FPM)
PHP_SAPI+=	fpm
MAN8+=		php-fpm.8
USE_RC_SUBR+=	php-fpm
CONFIGURE_ARGS+=--enable-fpm \
		--with-fpm-user=${WWWOWN} \
		--with-fpm-group=${WWWGRP}
PLIST_SUB+=	FPM=""
.else
PLIST_SUB+=	FPM="@comment "
.endif

.if defined(WITH_APACHE)
PHP_SAPI+=	mod
USE_APACHE=	2.2+
CONFIGURE_ARGS+=--with-apxs2=${APXS}
PKGMESSAGE=	${PKGDIR}/pkg-message.mod
MODULENAME=	lib${PORTNAME}
SHORTMODNAME=	${PORTNAME}
PLIST_SUB+=	APACHE=""
.else
PLIST_SUB+=	APACHE="@comment "
.endif

.if !defined(WITH_REGEX_TYPE) || ${WITH_REGEX_TYPE} == "php"
CONFIGURE_ARGS+=--with-regex=php
.elif defined(WITH_REGEX_TYPE) && ${WITH_REGEX_TYPE} == "system"
CONFIGURE_ARGS+=--with-regex=system
.endif

.if !defined(WITH_ZEND_VM) || ${WITH_ZEND_VM} == "CALL"
CONFIGURE_ARGS+=--with-zend-vm=CALL
.elif defined(WITH_ZEND_VM) && ${WITH_ZEND_VM} == "SWITCH"
CONFIGURE_ARGS+=--with-zend-vm=SWITCH
.elif defined(WITH_ZEND_VM) && ${WITH_ZEND_VM} == "GOTO"
CONFIGURE_ARGS+=--with-zend-vm=GOTO
.endif

CONFIGURE_ENV+=	ac_cv_pthreads_lib="" \
		ac_cv_pthreads_cflags="" \
		pthreads_working="yes" \
		lt_cv_path_SED="sed" \
		PHP_MYSQLND_ENABLED="yes"

.if defined(WITH_LINKTHR)
CONFIGURE_ENV+=	LIBS="${LIBS} ${PTHREAD_LIBS}"
.endif

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=--enable-debug
.endif

.if defined(WITH_MULTIBYTE)
CONFIGURE_ARGS+=--enable-zend-multibyte
.endif

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=--disable-ipv6
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${TOUCH} ${WRKSRC}/ext/php_config.h
	@${REINPLACE_CMD} "s|^\(extension_dir\)|; \1|" ${WRKSRC}/php.ini-*
.if defined(WITH_FPM)
	@${REINPLACE_CMD} -e "s|^;\(pid\)|\1|;s|^;\(pm\.[a-z_]*_servers\)|\1|" \
		${WRKSRC}/sapi/fpm/php-fpm.conf.in
.endif

pre-configure:
	@${CAT} ${WRKSRC}/acinclude.m4 ${WRKSRC}/build/libtool.m4 > ${WRKSRC}/aclocal.m4
.if defined(WITH_APACHE)
	${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/${APACHEETCDIR}
	${CP} ${LOCALBASE}/${APACHEETCDIR}/httpd.conf ${FAKE_DESTDIR}${LOCALBASE}/${APACHEETCDIR}
.endif

post-build:
	@${ECHO_CMD} "PHP_VER=5" > ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_VERSION=${PORTVERSION}" >> ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_SAPI=${PHP_SAPI}" >> ${WRKDIR}/php.conf
	@${ECHO_CMD} "PHP_EXT_INC=pcre spl" >> ${WRKDIR}/php.conf

test: build
	@(cd ${WRKSRC} && ${MAKE} test)

post-install:
	@${INSTALL_DATA} ${WRKSRC}/php.ini-development ${PREFIX}/etc
	@${INSTALL_DATA} ${WRKSRC}/php.ini-production ${PREFIX}/etc
	@${INSTALL_DATA} ${WRKDIR}/php.conf ${PREFIX}/etc
	@${TOUCH} ${PREFIX}/include/php/ext/php_config.h
.if defined(WITH_FPM)
	@${CP} -n ${PREFIX}/etc/php-fpm.conf.default ${PREFIX}/etc/php-fpm.conf
.endif

.else
.include "${MASTERDIR}/Makefile.ext"
.endif
.include <bsd.port.post.mk>
