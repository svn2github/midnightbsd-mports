# New ports collection makefile for:	lzo
# Date created:				21 Feb 1998
# Whom:					giffunip@asme.org
#
# $MidnightBSD: mports/archivers/lzo2/Makefile,v 1.1 2006/09/21 16:05:53 wintellect Exp $
# $FreeBSD: ports/archivers/lzo2/Makefile,v 1.38 2006/02/23 10:34:20 ade Exp $
#

PORTNAME=	lzo2
PORTVERSION=	2.02
PORTREVISION=	2
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/ \
		http://fresh.t-systems-sfr.com/unix/src/misc/ \
		http://ftp.uni-koeln.de/util/arc/
MASTER_SITE_SUBDIR=	libs/compression
DISTNAME=	lzo-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable speedy, lossless data compression library

LICENSE=	gpl2

GNU_CONFIGURE=  yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-shared
USE_LDCONFIG=	yes

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA}	${WRKSRC}/doc/* ${DOCSDIR}
.endif

.include <bsd.port.mk>
