# $MidnightBSD: mports/net/zsync/Makefile,v 1.3 2010/11/13 19:09:09 laffer1 Exp $

PORTNAME=	zsync
PORTVERSION=	0.6.2
CATEGORIES=	net
MASTER_SITES=	http://zsync.moria.org.uk/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A file transfer program
LICENSE=	artistic2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
PLIST_FILES=	bin/zsync \
		bin/zsyncmake
BINS=		zsync zsyncmake
PORTDOCS=	COPYING INSTALL NEWS README
MAN1=		zsync.1 \
		zsyncmake.1

do-install:
	${INSTALL_PROGRAM} ${BINS:S,^,${WRKSRC}/,} ${PREFIX}/bin
	${INSTALL_MAN} ${MAN1:S,^,${WRKSRC}/doc/,} ${MAN1PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}
.endif

.include <bsd.port.mk>
