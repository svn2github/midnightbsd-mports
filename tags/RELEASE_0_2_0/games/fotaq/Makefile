# New ports collection makefile for: fotaq (Flight of the Amazon Queen)
# Date created:        Fri Mar 26 23:34:32 BST 2004
# Whom:                Alex Trull <freebsd.alex@trull.org>
#
# $MidnightBSD: mports/games/fotaq/Makefile,v 1.1 2007/01/19 18:23:35 wintellect Exp $
# $FreeBSD: ports/games/fotaq/Makefile,v 1.5 2005/11/21 16:35:32 pav Exp $
#

PORTNAME=	fotaq
PORTVERSION=	1.0
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	scummvm
DISTNAME=	FOTAQ_Talkie

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flight of the Amazon Queen: a classic graphical adventure
LICENSE=	other

RUN_DEPENDS=	scummvm:${PORTSDIR}/games/scummvm

USE_ZIP=	yes
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}
PKGMESSAGE=	${WRKDIR}/pkg-message

do-install:
	@${MKDIR} ${DATADIR}
	@${INSTALL_DATA} ${WRKSRC}/queen.1c ${DATADIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}
.endif

post-install:
	@${SED} -e "s:%%DATADIR%%:${DATADIR}:g" ${.CURDIR}/pkg-message \
		> ${PKGMESSAGE}
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
