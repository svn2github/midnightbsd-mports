# New ports collection makefile for:    xorg-fonts-75dpi
# Date created:		30 May 2004
# Whom:			anholt@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/x11-fonts/xorg-fonts-75dpi/Makefile,v 1.9 2006/02/06 03:38:28 lesi Exp $
#

PORTNAME=	xorg-fonts-75dpi
PORTVERSION=	6.9.0
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	${MASTER_SITE_XORG}
MASTER_SITE_SUBDIR=	X11R${PORTVERSION}/src
DISTNAME=	X11R${PORTVERSION}-src1

MAINTAINER=	x11@FreeBSD.org
COMMENT=	X.Org 75dpi bitmap fonts

BUILD_DEPENDS=	ucs2any:${PORTSDIR}/x11/xorg-clients
RUN_DEPENDS=	${X11BASE}/lib/X11/fonts/encodings/encodings.dir:${PORTSDIR}/x11-fonts/xorg-fonts-encodings

CONFLICTS=	XFree86-font75dpi-*

EXTRA_PATCHES=	${CF_PATCHES}

XBUILD_DIRS=	fonts/encodings fonts/bdf/75dpi
XINSTALL_DIRS=	fonts/bdf/75dpi

post-install:
	@command fc-cache -v ${PREFIX}/lib/X11/fonts/75dpi || true

.include "${.CURDIR}/../../x11-servers/xorg-server/Makefile.inc"
.include <bsd.port.pre.mk>
.if ${X_WINDOW_SYSTEM:L} != xorg
IGNORE=	is part of X.Org and you have ${X_WINDOW_SYSTEM} set for X11\
	distribution. See The X Window System and Virtual Consoles chapter\
	of FAQ for more information
.endif
.include <bsd.port.post.mk>
