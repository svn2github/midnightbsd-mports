# New ports collection makefile for:	fhourstones
# Date created:		2006-11-23
# Whom:			trasz <trasz@pin.if.uz.zgora.pl>
#
# $MidnightBSD$
# $FreeBSD: ports/benchmarks/fhourstones/Makefile,v 1.2 2007/04/13 13:03:44 trasz Exp $
#

PORTNAME=	fhourstones
PORTVERSION=	3.1
CATEGORIES=	benchmarks
MASTER_SITES=	http://homepages.cwi.nl/~tromp/c4/
DISTNAME=	Fhourstones

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Fhourstones Benchmark

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/fhourstones lib/fhourstones/SearchGame lib/fhourstones/inputs
PLIST_DIRS=	lib/fhourstones

post-patch:
		@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/Makefile
		@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/fhourstones

do-install:
		${MKDIR} ${PREFIX}/lib/fhourstones
		${INSTALL_SCRIPT} ${WRKDIR}/fhourstones ${PREFIX}/bin
		${INSTALL_PROGRAM} ${WRKDIR}/SearchGame ${PREFIX}/lib/fhourstones/
		${INSTALL_DATA} ${WRKDIR}/inputs ${PREFIX}/lib/fhourstones

.include <bsd.port.mk>
