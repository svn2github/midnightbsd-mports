# Ports collection makefile for:	zsync
# Date created:			16 Jan 2005
# Whom:				Gea-Suan Lin <gslin@ccca.nctu.edu.tw>
#
# $MidnightBSD$
# $FreeBSD: ports/net/zsync/Makefile,v 1.7 2005/10/17 23:28:33 gordon Exp $
#

PORTNAME=	zsync
PORTVERSION=	0.4.2
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A file transfer program

PLIST_FILES=	bin/zsync \
		bin/zsyncmake

.if !defined(NOPORTDOCS)
PORTDOCS=	COPYING \
		README
.endif

MAN1=		zsync.1 \
		zsyncmake.1

GNU_CONFIGURE=	yes

do-install:
.for FILE in zsync zsyncmake
	${INSTALL_PROGRAM} ${WRKSRC}/${FILE} ${PREFIX}/bin
.endfor

.for FILE in ${MAN1}
	${INSTALL_MAN} ${WRKSRC}/doc/${FILE} ${MAN1PREFIX}/man/man1
.endfor

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for FILE in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
