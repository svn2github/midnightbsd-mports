# $MidnightBSD$
# $FreeBSD: ports/www/joomla15/Makefile,v 1.25 2009/08/07 20:07:40 skreuzer Exp $

PORTNAME=	joomla15
PORTVERSION=	1.5.24
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	http://joomlacode.org/gf/download/frsrelease/15898/68912/ \
		http://linux3.dti.supsi.ch/downloads/
DISTNAME=	Joomla_${PORTVERSION}-Stable-Full_Package

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamic web content management system (CMS)

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE.php

FETCH_CMD=	fetch -Rr
USES=		tar:bzip2
NO_BUILD=	yes
USE_MYSQL=	yes
USE_PHP=	mysql pcre xml zlib session gd pdf
WANT_PHP_WEB=	yes
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_FILES=	pkg-message
SUB_LIST+=	PORTVERSION="${PORTVERSION}"

do-extract:
	@${MKDIR} ${WRKSRC}
	@${TAR} -yxf ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} -C ${WRKSRC}

do-install:
	@${MKDIR} ${WWWDIR}
	@cd ${WRKSRC} && \
		${FIND} . -type d -exec ${MKDIR} ${WWWDIR}/{} \; \
			-exec ${CHOWN} ${WWWOWN}:${WWWGRP} ${WWWDIR}/{} \;
	@cd ${WRKSRC} && \
		${FIND} . \! -type d -exec ${INSTALL_DATA} {} ${WWWDIR}/{} \; \
			-exec ${CHOWN} ${WWWOWN}:${WWWGRP} ${WWWDIR}/{} \;

.include <bsd.port.mk>
