# $MidnightBSD: mports/x11/xset/Makefile,v 1.4 2012/03/03 01:52:57 laffer1 Exp $

PORTNAME=	xset
PORTVERSION=	1.2.2
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User preference utility for X
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	xmuu xproto x11 xext xfontcache
CONFIGURE_ARGS=	--without-xf86misc

PLIST_FILES=	bin/xset

MAN1=		xset.1

.include <bsd.port.mk>
