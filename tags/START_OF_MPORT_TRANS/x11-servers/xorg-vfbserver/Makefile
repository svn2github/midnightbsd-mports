# New ports collection makefile for:    xorg-vfbserver
# Date created:		17 June 2004
# Whom:			anholt@FreeBSD.org
#
# $MidnightBSD: mports/x11-servers/xorg-vfbserver/Makefile,v 1.1.1.1 2006/09/17 03:34:00 archite Exp $
# $FreeBSD: ports/x11-servers/xorg-vfbserver/Makefile,v 1.10 2006/08/25 21:52:49 lesi Exp $
#

PORTNAME=	xorg-vfbserver
PORTVERSION=	6.9.0
PORTREVISION=	2
CATEGORIES=	x11-servers
MASTER_SITES=	${MASTER_SITE_XORG}
MASTER_SITE_SUBDIR=	X11R${PORTVERSION}/src
DISTFILES=	X11R${PORTVERSION}-src1.tar.gz \
		X11R${PORTVERSION}-src3.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X virtual framebuffer server from X.Org

CONFLICTS=	XFree86-VirtualFramebufferServer-*

EXTRA_PATCHES=	${CF_PATCHES} ${SERVER_PATCHES}

USE_XLIB=	yes

XBUILD_DIRS=	lib/font programs/Xserver/miext/damage programs/Xserver
XINCLUDE_DIRS=	lib/xtrans
XMAN_DIRS=	programs/Xserver

MAN1=		Xvfb.1

.include "${.CURDIR}/../../x11-servers/xorg-server/Makefile.inc"
.include <bsd.port.pre.mk>
.if ${X_WINDOW_SYSTEM:L} != xorg
IGNORE=	is part of X.Org and you have ${X_WINDOW_SYSTEM} set for X11\
	distribution. See The X Window System and Virtual Consoles chapter\
	of FAQ for more information
.endif
.include <bsd.port.post.mk>
