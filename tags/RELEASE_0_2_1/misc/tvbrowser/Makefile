# New ports collection makefile for:	tvbrowser
# Date Created:				24 May 2005
# Whom:					Lars Engels <lars.engels@0x20.net>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/tvbrowser/Makefile,v 1.15 2008/06/06 13:45:38 edwin Exp $
#

PORTNAME=	tvbrowser
PORTVERSION=	2.6.3
PORTREVISION=	0
CATEGORIES=	misc java
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A digital TV guide
LICENSE=	gpl2

USE_LDCONFIG=	yes
NO_BUILD=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.5+
SUB_FILES=	tvbrowser

DESKTOP_ENTRIES="TV-Browser" \
		"A digital TV guide" \
		"${DATADIR}/imgs/tvbrowser128.png" \
		"tvbrowser" \
		"Application;TV;" \
		false

do-install:
	cd ${WRKSRC} && ${FIND} . -type d -exec ${MKDIR} "${DATADIR}/{}" \;
	cd ${WRKSRC} && ${FIND} . -type f -exec ${INSTALL_DATA} "{}" "${DATADIR}/{}" \;
	${INSTALL_SCRIPT} ${WRKDIR}/tvbrowser ${PREFIX}/bin

.include <bsd.port.mk>
