# $MidnightBSD: mports/misc/xtail/Makefile,v 1.1 2007/03/09 05:26:11 laffer1 Exp $

PORTNAME=	xtail
PORTVERSION=	2.1
CATEGORIES=	misc
MASTER_SITES=	\
		http://utenti.gufi.org/~gmarco/files/distfiles/
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Watches the growth of files or directories
LICENSE=	unknown

HAS_CONFIGURE=	yes

MAN1=		xtail.1
PLIST_FILES=	bin/xtail

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xtail ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/xtail.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
