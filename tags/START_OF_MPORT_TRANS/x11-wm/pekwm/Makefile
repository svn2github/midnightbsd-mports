# Ports collection makefile for:	pekwm
# Date created:			Nov 1, 2002
# Whom:				anders@hack.org
#
# $MidnightBSD: mports/x11-wm/pekwm/Makefile,v 1.1 2006/09/17 19:33:50 archite Exp $
# $FreeBSD: ports/x11-wm/pekwm/Makefile,v 1.23 2006/04/28 21:30:24 pav Exp $
#

PORTNAME=	pekwm
PORTVERSION=	0.1.5
PORTREVISION=	1
CATEGORIES=	x11-wm
MASTER_SITES=	http://bsd-unix.org/downloads/ \
		http://pekwm.org/files/
DISTNAME=	${PORTNAME}-0.1.5

MAINTAINER=	xcas@cox.net
COMMENT=	A windowmanager based on aewm++

LIB_DEPENDS=	Xft.2:${PORTSDIR}/x11-fonts/libXft \
		jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png

USE_BZIP2=	yes
USE_GCC=	3.4
USE_GMAKE=	yes
USE_XPM=	yes

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ARGS=	--enable-shape --enable-xinerama --enable-xrandr \
		--enable-xft --disable-pcre --enable-image-xpm \
		--enable-image-jpeg --enable-image-png --disable-debug \
		--disable-pedantic --enable-menus --enable-harbour

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/pekwm

.include <bsd.port.mk>
