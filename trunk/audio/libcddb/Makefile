# $MidnightBSD$
# $FreeBSD: ports/audio/libcddb/Makefile,v 1.16 2006/06/09 18:00:28 ahze Exp $

PORTNAME=	libcddb
PORTVERSION=	1.3.2
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to access data on a CDDB server

LICENSE=	lgpl

GNU_CONFIGURE=	yes
USES=		pathfix pkgconfig iconv libtool:oldver tar:bzip2
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--without-cdio
CPPFLAGS+=	-DICONV_CONST="const" -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
