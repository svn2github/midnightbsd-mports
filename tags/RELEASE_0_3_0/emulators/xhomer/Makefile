# New ports collection makefile for:	xhomer
# Date created:			24 May 2006
# Whom:				trasz
#
# $MidnightBSD: mports/emulators/xhomer/Makefile,v 1.1 2007/05/05 05:31:23 laffer1 Exp $
# $FreeBSD: ports/emulators/xhomer/Makefile,v 1.3 2007/04/13 13:03:46 trasz Exp $
#

PORTNAME=	xhomer
DISTVERSION=	9-16-06
PORTEPOCH=	1
CATEGORIES=	emulators
MASTER_SITES=	http://xhomer.isani.org/xhomer/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Emulator for the DEC Pro 350 computer
LICENSE=	agg

USE_GMAKE=	yes
USE_XLIB=	yes
ALL_TARGET=	clean xhomer
INSTALL_TARGET=
CFLAGS+=	-Wall -ffloat-store
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

PLIST_FILES=	bin/xhomer %%EXAMPLESDIR%%/xhomer.cfg
PLIST_DIRS=	%%EXAMPLESDIR%%
PORTDOCS=	README LICENSE SIMH

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif
	${INSTALL_PROGRAM} ${WRKSRC}/xhomer ${PREFIX}/bin
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/xhomer.cfg ${EXAMPLESDIR}

.include <bsd.port.mk>
