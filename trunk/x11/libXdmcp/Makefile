# $MidnightBSD$

PORTNAME=	libXdmcp
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Display Manager Control Protocol library

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xproto:both

CONFIGURE_ARGS+=--disable-docs --without-xmlto

post-patch:
	@${REINPLACE_CMD} '/^SUBDIRS/,/^$$/ \
		s/doc//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
