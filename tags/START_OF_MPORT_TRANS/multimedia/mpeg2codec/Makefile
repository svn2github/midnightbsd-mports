# New ports collection makefile for:	mpeg2codec
# Date created:		November 25, 1996
# Whom:			"Philippe Charnier" <charnier@lirmm.fr>
#
# $FreeBSD: ports/multimedia/mpeg2codec/Makefile,v 1.12 2005/04/24 08:03:31 ahze Exp $
# $MidnightBSD$
#

PORTNAME=	mpeg2codec
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	ftp://ftp.mpeg.org/pub/mpeg/mssg/
DISTFILES=	mpeg2vidcodec_v12.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An MPEG-2 Encoder and Decoder

USE_XLIB=	yes
WRKSRC=		${WRKDIR}/mpeg2
DATADIR=	share/mpeg2
CFLAGS+=-DVERIFY -DVERBOSE -DTRACE

do-install:
.for i in dec enc
	${INSTALL_PROGRAM} ${WRKSRC}/src/mpeg2${i}/mpeg2${i}ode ${PREFIX}/bin
.endfor
	${MKDIR} ${PREFIX}/${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/doc/mpeg2enc.doc ${PREFIX}/${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/par/* ${PREFIX}/${DATADIR}

.include <bsd.port.mk>
