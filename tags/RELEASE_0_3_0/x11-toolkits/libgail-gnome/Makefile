# $MidnightBSD: mports/x11-toolkits/libgail-gnome/Makefile,v 1.3 2009/06/29 04:26:27 laffer1 Exp $

PORTNAME=	libgail-gnome
PORTVERSION=	1.20.3
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the ATK interfaces for GNOME widgets
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
GNOME_DESKTOP_VERSION=2
USE_GNOME=	gnomeprefix gnomehack gnomepanel libgnomeui atspi
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
PLIST_FILES=	lib/gtk-2.0/modules/libgail-gnome.la \
		lib/gtk-2.0/modules/libgail-gnome.so \
		libdata/pkgconfig/libgail-gnome.pc
GCONF_SCHEMAS=	libgail-gnome.schemas

.include <bsd.port.mk>
