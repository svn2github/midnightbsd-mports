# $MidnightBSD$

PORTNAME=	libXcursor
PORTVERSION=	1.1.14
PORTREVISION=	2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X client-side cursor loading library

LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xrender x11 xfixes fixesproto xproto:both \
		xextproto

CONFIGURE_ARGS=	--with-icondir=${PREFIX}/lib/X11/icons

.include <bsd.port.mk>
