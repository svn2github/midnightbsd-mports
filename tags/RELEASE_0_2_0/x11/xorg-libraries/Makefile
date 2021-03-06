# New ports collection makefile for:    xorg-libraries
# Date created:		29 May 2004
# Whom:			anholt@FreeBSD.org
#
# $FreeBSD: ports/x11/xorg-libraries/Makefile,v 1.23 2007/09/16 12:42:25 flz Exp $
# $MidnightBSD$
#

PORTNAME=	xorg-libraries
PORTVERSION=	7.3
CATEGORIES=	x11
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org libraries meta-port
LICENSE=	x11

NO_BUILD=	yes

RUN_DEPENDS=	${X11BASE}/libdata/pkgconfig/x11.pc:${PORTSDIR}/x11/libX11 \
		${X11BASE}/libdata/pkgconfig/xfont.pc:${PORTSDIR}/x11-fonts/libXfont \
		${X11BASE}/libdata/pkgconfig/xfontcache.pc:${PORTSDIR}/x11-fonts/libXfontcache \
		${X11BASE}/libdata/pkgconfig/ice.pc:${PORTSDIR}/x11/libICE \
		${X11BASE}/libdata/pkgconfig/sm.pc:${PORTSDIR}/x11/libSM \
		${X11BASE}/libdata/pkgconfig/xres.pc:${PORTSDIR}/x11/libXres \
		${X11BASE}/libdata/pkgconfig/xtrap.pc:${PORTSDIR}/x11/libXTrap \
		${X11BASE}/libdata/pkgconfig/xau.pc:${PORTSDIR}/x11/libXau \
		${X11BASE}/libdata/pkgconfig/xaw8.pc:${PORTSDIR}/x11-toolkits/libXaw \
		${X11BASE}/libdata/pkgconfig/xcomposite.pc:${PORTSDIR}/x11/libXcomposite \
		${X11BASE}/libdata/pkgconfig/xcursor.pc:${PORTSDIR}/x11/libXcursor \
		${X11BASE}/libdata/pkgconfig/xdamage.pc:${PORTSDIR}/x11/libXdamage \
		${X11BASE}/libdata/pkgconfig/xdmcp.pc:${PORTSDIR}/x11/libXdmcp \
		${X11BASE}/libdata/pkgconfig/xevie.pc:${PORTSDIR}/x11/libXevie \
		${X11BASE}/libdata/pkgconfig/xext.pc:${PORTSDIR}/x11/libXext \
		${X11BASE}/libdata/pkgconfig/xfixes.pc:${PORTSDIR}/x11/libXfixes \
		${X11BASE}/libdata/pkgconfig/xfont.pc:${PORTSDIR}/x11-fonts/libXfont \
		${X11BASE}/libdata/pkgconfig/xi.pc:${PORTSDIR}/x11/libXi \
		${X11BASE}/libdata/pkgconfig/xinerama.pc:${PORTSDIR}/x11/libXinerama \
		${X11BASE}/libdata/pkgconfig/xmu.pc:${PORTSDIR}/x11-toolkits/libXmu \
		${X11BASE}/libdata/pkgconfig/xp.pc:${PORTSDIR}/x11/libXp \
		${X11BASE}/libdata/pkgconfig/xpm.pc:${PORTSDIR}/x11/libXpm \
		${X11BASE}/libdata/pkgconfig/xrandr.pc:${PORTSDIR}/x11/libXrandr \
		${X11BASE}/libdata/pkgconfig/xrender.pc:${PORTSDIR}/x11/libXrender \
		${X11BASE}/libdata/pkgconfig/xscrnsaver.pc:${PORTSDIR}/x11/libXScrnSaver \
		${X11BASE}/libdata/pkgconfig/xt.pc:${PORTSDIR}/x11-toolkits/libXt \
		${X11BASE}/libdata/pkgconfig/xtst.pc:${PORTSDIR}/x11/libXtst \
		${X11BASE}/libdata/pkgconfig/xv.pc:${PORTSDIR}/x11/libXv \
		${X11BASE}/libdata/pkgconfig/xvmc.pc:${PORTSDIR}/x11/libXvMC \
		${X11BASE}/libdata/pkgconfig/xxf86dga.pc:${PORTSDIR}/x11/libXxf86dga \
		${X11BASE}/libdata/pkgconfig/xxf86misc.pc:${PORTSDIR}/x11/libXxf86misc \
		${X11BASE}/libdata/pkgconfig/xxf86vm.pc:${PORTSDIR}/x11/libXxf86vm \
		${X11BASE}/libdata/pkgconfig/xkbfile.pc:${PORTSDIR}/x11/libxkbfile \
		${X11BASE}/libdata/pkgconfig/xkbui.pc:${PORTSDIR}/x11/libxkbui \
		${X11BASE}/libdata/pkgconfig/xft.pc:${PORTSDIR}/x11-fonts/libXft \
		${X11BASE}/libdata/pkgconfig/xprintutil.pc:${PORTSDIR}/x11/libXprintUtil \
		${X11BASE}/libdata/pkgconfig/xprintapputil.pc:${PORTSDIR}/x11/libXprintAppUtil \
		${X11BASE}/libdata/pkgconfig/fontenc.pc:${PORTSDIR}/x11-fonts/libfontenc \
		${X11BASE}/libdata/pkgconfig/dmx.pc:${PORTSDIR}/x11/libdmx \
		${X11BASE}/libdata/pkgconfig/xtrans.pc:${PORTSDIR}/x11/xtrans \
		${X11BASE}/libdata/pkgconfig/libfs.pc:${PORTSDIR}/x11-fonts/libFS \
		${X11BASE}/libdata/pkgconfig/oldx.pc:${PORTSDIR}/x11/liboldX \
		${X11BASE}/libdata/pkgconfig/pixman-1.pc:${PORTSDIR}/x11/pixman

do-install:
		${MKDIR} ${PREFIX}/libdata/xorg
		${TOUCH} ${PREFIX}/libdata/xorg/libraries

.include <bsd.port.mk>
