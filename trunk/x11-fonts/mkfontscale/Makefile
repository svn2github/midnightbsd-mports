# $MidnightBSD$

PORTNAME=	mkfontscale
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Creates an index of scalable font files for X

LICENSE=	mit

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2

XORG_CAT=	app
USE_XORG=	xproto fontenc

CONFIGURE_ARGS+=--disable-maintainer-mode

.include <bsd.port.mk>
