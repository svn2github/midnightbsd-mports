# New ports collection makefile for:    libgnomeuimm
# Date created:         22 May 2003
# Whom:                 Alexander Nedotsukov <bland@mail.ru>
#
# $MidnightBSD: mports/x11-toolkits/libgnomeuimm/Makefile,v 1.4 2011/02/02 21:38:58 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/libgnomeuimm/Makefile,v 1.17 2007/10/04 06:27:13 edwin Exp $
#

PORTNAME=	libgnomeuimm
PORTVERSION=	2.0.0
PORTREVISION=	2
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	SF/gtkmm/OldFiles
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for libgnomeui library
LICENSE=	lgpl

LIB_DEPENDS=	gnomemm-2.0:${PORTSDIR}/x11/libgnomemm \
		gnomecanvasmm-2.0:${PORTSDIR}/graphics/libgnomecanvasmm \
		gconfmm-2.0:${PORTSDIR}/devel/gconfmm \
		glademm-2.0:${PORTSDIR}/devel/libglademm
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
USE_GNOME=	gnomehack libgnomeui
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static

.include <bsd.port.mk>
