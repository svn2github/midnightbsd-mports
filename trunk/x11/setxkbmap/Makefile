# $MidnightBSD$

PORTNAME=	setxkbmap
PORTVERSION=	1.3.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the keyboard using the X Keyboard Extension
LICENSE=	sgi

XORG_CAT=	app
USE_XORG=	xkbfile x11

CONFIGURE_ARGS=	--with-xkb-config-root=${LOCALBASE}/share/X11/xkb

PLIST_FILES=	bin/setxkbmap

MAN1=		setxkbmap.1

.include <bsd.port.mk>
