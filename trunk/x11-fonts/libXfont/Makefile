# $MidnightBSD$

PORTNAME=	libXfont
PORTVERSION=	1.4.6
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X font libary

LICENSE=	bsd4

LIB_DEPENDS=	freetype:${PORTSDIR}/print/freetype2

XORG_CAT=	lib
USE_XORG=	xproto:both xtrans fontsproto:both fontenc

CONFIGURE_ARGS=--without-xmlto --disable-devel-docs

.include <bsd.port.mk>
