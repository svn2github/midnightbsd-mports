# ports collection makefile for:	vrfy
# Date created:				2000/09/09
# Whom:					kaz
#
# $MidnightBSD$
# $FreeBSD: ports/mail/vrfy/Makefile,v 1.7 2005/10/16 14:24:02 vs Exp $
#

PORTNAME=	vrfy
PORTVERSION=	1.0
CATEGORIES=	mail
MASTER_SITES=	# disappeared
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Verify mail address

WRKSRC=		${WRKDIR}
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" RES=""
MAN1=		vrfy.1
MANCOMPRESSED=	yes
PLIST_FILES=	bin/vrfy

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/vrfy ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIR}/${MAN1} ${PREFIX}/man/man1/
	${GZIP_CMD} ${PREFIX}/man/man1/${MAN1}

.include <bsd.port.mk>
