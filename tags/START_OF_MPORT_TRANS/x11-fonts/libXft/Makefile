# New ports collection makefile for:	Xft
# Date created:		06 October 2002
# Whom:			Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-fonts/libXft/Makefile,v 1.1.1.1 2006/09/17 03:33:58 archite Exp $
# $FreeBSD: ports/x11-fonts/libXft/Makefile,v 1.39 2006/05/16 05:35:53 mezz Exp $
#

PORTNAME=	libXft
PORTVERSION=	2.1.7
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://xlibs.freedesktop.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A client-sided font API for X applications

LIB_DEPENDS=	fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_X_PREFIX=	yes
INSTALLS_SHLIB=	yes
USE_GNOME=	gnomehack gnometarget
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include" \
		LDFLAGS="-L${X11BASE}/lib"

MAN3=		Xft.3

.if defined(WITH_CJK)
PATCH_SITES=    http://bsdchat.com/dist/firefly-cjk-patchset/ \
		http://bbs.ilc.edu.tw/~chinsan/ \
		ftp://local-distfiles.freebsd.org.cn/pub/china-ports/hamigua/
PATCHFILES+=    cjk-patch-libXft-20050716.diff.gz
.endif

.include <bsd.port.pre.mk>

.if ${X_WINDOW_SYSTEM:L} == xfree86-3
IGNORE=	xft requires Render extension headers/library to build
.endif

.include <bsd.port.post.mk>
