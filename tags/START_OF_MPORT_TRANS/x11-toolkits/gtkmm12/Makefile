# New ports collection makefile for:   gtk--
# Date created:        11 May 1998
# Whom:                Yukihiro Nakai <Nakai@technologist.com>
#
# $MidnightBSD: mports/x11-toolkits/gtkmm12/Makefile,v 1.1 2006/09/27 16:47:52 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/gtkmm12/Makefile,v 1.49 2006/02/23 10:40:15 ade Exp $
#

PORTNAME=	gtkmm
PORTVERSION=	1.2.8
PORTREVISION=	6
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/gtkmm/1.2
#DIST_SUBDIR=	gnome

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	C++ wrapper for gtk, a x11 graphics library

LIB_DEPENDS=	sigc.1:${PORTSDIR}/devel/libsigc++
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_BZIP2=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GNOME=	gtk12
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes
CONFIGURE_ARGS=	--enable-static=yes \
		--without-gnome \
		--with-sigc-prefix=${LOCALBASE}

post-install:
.for lib in gdkmm gtkmm
	@${RM} ${PREFIX}/lib/lib${lib}.so ${PREFIX}/lib/lib${lib}.la
	@${MV} ${PREFIX}/lib/lib${lib}.a ${PREFIX}/lib/lib${lib}-1.2.a
.endfor
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
