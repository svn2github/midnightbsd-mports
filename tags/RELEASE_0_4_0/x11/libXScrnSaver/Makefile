# $MidnightBSD: mports/x11/libXScrnSaver/Makefile,v 1.4 2012/03/03 01:52:52 laffer1 Exp $

PORTNAME=	libXScrnSaver
PORTVERSION=	1.2.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The XScrnSaver library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	x11 xext xextproto scrnsaverproto:both

MAN3=		Xss.3 \
		XScreenSaverAllocInfo.3 \
		XScreenSaverGetRegistered.3 \
		XScreenSaverQueryExtension.3 \
		XScreenSaverQueryInfo.3 \
		XScreenSaverQueryVersion.3 \
		XScreenSaverRegister.3 \
		XScreenSaverSelectInput.3 \
		XScreenSaverSetAttributes.3 \
		XScreenSaverSuspend.3 \
		XScreenSaverUnregister.3 \
		XScreenSaverUnsetAttributes.3

.include <bsd.port.mk>
