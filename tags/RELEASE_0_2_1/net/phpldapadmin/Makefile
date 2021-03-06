# New ports collection makefile for: phpLDAPadmin
# Date created:		07 Oct 2007
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/net/phpldapadmin/Makefile,v 1.1 2007/10/07 16:18:54 laffer1 Exp $
# $FreeBSD: ports/net/phpldapadmin/Makefile,v 1.20 2007/03/22 16:42:26 pav Exp $
#

PORTNAME=	phpldapadmin
PORTVERSION=	1.1.0.4
PORTEPOCH=	1
CATEGORIES=	net www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	phpldapadmin
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of PHP-scripts to administer LDAP over the web
LICENSE=	gpl2

NO_BUILD=	yes
USE_PHP=	gettext ldap openssl pcre session xml

.if defined(WITH_SUPHP)

PKGNAMESUFFIX+=	-suphp
RUN_DEPENDS+=	${LOCALBASE}/sbin/suphp:${PORTSDIR}/www/suphp
WANT_PHP_CGI=	yes

PLAUSR?=	pldapadm

SUB_LIST+=	PLAUSR=${PLAUSR} \
		PLAGRP=${PLAGRP}
SUB_FILES+=	pkg-install  pkg-deinstall

.else
WANT_PHP_WEB=	yes
.endif

# PLAUSR is only used WITH_SUPHP
PLADIR?=	www/${PORTNAME}
PLAGRP?=	${WWWGRP}
CFGDIR=		config
CFGFILE=	config.php

SUB_LIST+=	PKGNAME=${PKGNAME} \
		PLADIR=${PLADIR}
SUB_FILES+=	pkg-message

PLIST=		${WRKDIR}/plist
PLIST_SUB+=	PLADIR=${PLADIR} PLAGRP=${PLAGRP}

.SILENT:

pre-everything::
	${ECHO_MSG} ""
	${ECHO_MSG} "You may use the following build options:"
	${ECHO_MSG} ""
	${ECHO_MSG} "    WITH_SUPHP=yes   Install appropriately for use with"
	${ECHO_MSG} "                     the www/suphp port [default: no]"
	${ECHO_MSG} ""

post-patch:
	cd ${WRKSRC} ;                                                      \
	${FIND} . ! -type d ! -name ${CFGFILE}.example ! -name .cvsignore | \
	    ${SORT} | ${SED} -e "s!^\.!%%PLADIR%%!"             >${PLIST} ; \
	${CAT} ${PKGDIR}/pkg-plist-chunk                       >>${PLIST} ; \
	${FIND} . -type d | ${SORT} -r | ${SED}                             \
	    -e 's!^\./${CFGDIR}$$!@dirrmtry %%PLADIR%%/${CFGDIR}!'          \
	    -e 's!^\.$$!@dirrmtry %%PLADIR%%!'                              \
	    -e 's!^\.!@dirrm %%PLADIR%%!'                      >>${PLIST}

pre-install:
.if defined(WITH_SUPHP)
	${SETENV} ${SCRIPTS_ENV} ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL
.endif

do-install: install-app install-conf

install-app:
	cd ${WRKSRC} ; \
	for src in $$( ${FIND} . ! -name .cvsignore  ) ; do \
	    dst=${PREFIX}/${PLADIR}$${src#.} ; \
	    if ${TEST} -d $$src ; then \
	        ${MKDIR} $$dst ; \
	    else \
	        ${INSTALL_DATA} $$src $$dst ; \
	    fi \
	done

install-conf:
	cd ${PREFIX}/${PLADIR}/${CFGDIR} ; \
	${CHMOD} 0640 ${CFGFILE}.example ; \
	${CHGRP} ${PLAGRP} ${CFGFILE}.example ; \
	if ${TEST} ! -f ${CFGFILE} ; then \
	    ${CP} -p ${CFGFILE}.example ${CFGFILE} ; \
	fi

post-install:
.if defined(WITH_SUPHP)
	${SETENV} ${SCRIPTS_ENV} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif

.include <bsd.port.mk>
