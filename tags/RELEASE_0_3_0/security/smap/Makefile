# $MidnightBSD: mports/security/smap/Makefile,v 1.1 2008/04/29 05:06:38 laffer1 Exp $

PORTNAME=	smap
PORTVERSION=	0.5.0
PORTREVISION=	1
CATEGORIES=	security net
MASTER_SITES=	http://www.wormulon.net/smap/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SIP scanner and identifier
LICENSE=	unknown

PLIST_FILES=	bin/smap share/smap/fingerprint.db
PLIST_DIRS=	share/smap

USE_GMAKE=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/smap ${PREFIX}/bin
	${MKDIR} ${PREFIX}/share/smap
	${INSTALL_DATA} ${WRKSRC}/fingerprint.db ${PREFIX}/share/smap

.include <bsd.port.mk>
