# New ports collection makefile for:   libXxf86
# Date Created:			7 May 2004
# Whom:				Eric Anholt <anholt@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/libXxf86/Makefile,v 1.5 2005/03/06 00:15:06 lesi Exp $
#

PORTNAME=	libXxf86
PORTVERSION=	1.0
CATEGORIES=	x11
MASTER_SITES=	http://xorg.freedesktop.org/X11R6.7.0/src/ \
		${MASTER_SITE_XORG}
MASTER_SITE_SUBDIR=	X11R6.7/tars
DISTNAME=	X11R6.7.0-src1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Miscellaneous XFree86 X extensions libraries

LIB_PC_DEPENDS=	${X11BASE}/include/X11/extensions/xf86dga.h:${PORTSDIR}/x11/xf86ext \
		${X11BASE}/libdata/pkgconfig/xext.pc:${PORTSDIR}/x11/libXext
BUILD_DEPENDS=	${LIB_PC_DEPENDS}
RUN_DEPENDS=	${LIB_PC_DEPENDS}

CONFLICTS=	XFree86-libraries-* xorg-libraries-*

USE_IMAKE=	YES
USE_X_PREFIX=	no
PREFIX?=	${X11BASE}
DIST_SUBDIR=	xorg
INSTALLS_SHLIB=	yes
WRKSRC=		${WRKDIR}/xc/lib
EXTRACT_AFTER_ARGS= | ${TAR} -xf - xc/lib
MAN3=		XDGA.3 \
		XDGAChangePixmapMode.3 \
		XDGACloseFramebuffer.3 \
		XDGACopyArea.3 \
		XDGACopyTransparentArea.3 \
		XDGACreateColormap.3 \
		XDGAFillRectangle.3 \
		XDGAGetViewportStatus.3 \
		XDGAInstallColormap.3 \
		XDGAKeyEventToXKeyEvent.3 \
		XDGAOpenFramebuffer.3 \
		XDGAQueryExtension.3 \
		XDGAQueryModes.3 \
		XDGAQueryVersion.3 \
		XDGASelectInput.3 \
		XDGASetClientVersion.3 \
		XDGASetMode.3 \
		XDGASetViewport.3 \
		XDGASync.3 \
		XF86DGA.3 \
		XFree86-DGA.3

post-patch:
	${CP} ${FILESDIR}/Imakefile ${WRKSRC}/

.include <bsd.port.mk>
