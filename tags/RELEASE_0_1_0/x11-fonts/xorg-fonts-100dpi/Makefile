# New ports collection makefile for:    xorg-fonts-100dpi
# Date created:		30 May 2004
# Whom:			anholt@FreeBSD.org
#
# $MidnightBSD: mports/x11-fonts/xorg-fonts-100dpi/Makefile,v 1.1.1.1 2006/09/17 03:33:58 archite Exp $
# $FreeBSD: ports/x11-fonts/xorg-fonts-100dpi/Makefile,v 1.9 2006/02/06 03:38:28 lesi Exp $
#

PORTNAME=	xorg-fonts-100dpi
PORTVERSION=	6.9.0
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	${MASTER_SITE_XORG}
MASTER_SITE_SUBDIR=	X11R${PORTVERSION}/src
DISTNAME=	X11R${PORTVERSION}-src1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org 100dpi bitmap fonts

BUILD_DEPENDS=	ucs2any:${PORTSDIR}/x11/xorg-clients
RUN_DEPENDS=	${X11BASE}/lib/X11/fonts/encodings/encodings.dir:${PORTSDIR}/x11-fonts/xorg-fonts-encodings

CONFLICTS=	XFree86-font100dpi-*

EXTRA_PATCHES=	${CF_PATCHES}

XBUILD_DIRS=	fonts/encodings fonts/bdf/100dpi
XINSTALL_DIRS=	fonts/bdf/100dpi

post-install:
	@command fc-cache -v ${PREFIX}/lib/X11/fonts/100dpi || true

.include "${.CURDIR}/../../x11-servers/xorg-server/Makefile.inc"
.include <bsd.port.pre.mk>
.if ${X_WINDOW_SYSTEM:L} != xorg
IGNORE=	is part of X.Org and you have ${X_WINDOW_SYSTEM} set for X11\
	distribution. See The X Window System and Virtual Consoles chapter\
	of FAQ for more information
.endif
.include <bsd.port.post.mk>
