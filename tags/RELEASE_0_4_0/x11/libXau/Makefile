# $MidnightBSD: mports/x11/libXau/Makefile,v 1.5 2012/03/03 01:52:52 laffer1 Exp $

PORTNAME=	libXau
PORTVERSION=	1.0.8
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Authentication Protocol library for X11
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	xproto:both

MAN3=		Xau.3 XauDisposeAuth.3 XauFileName.3 XauGetAuthByAddr.3 \
		XauGetBestAuthByAddr.3 XauLockAuth.3 XauReadAuth.3 \
		XauUnlockAuth.3 XauWriteAuth.3

post-install:
	${LN} -sf ${PREFIX}/lib/libXau.so.6 ${PREFIX}/lib/libXau.so.0

.include <bsd.port.mk>
