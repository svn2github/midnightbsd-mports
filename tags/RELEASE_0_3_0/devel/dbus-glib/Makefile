# $MidnightBSD: mports/devel/dbus-glib/Makefile,v 1.4 2009/09/20 01:07:17 laffer1 Exp $

PORTNAME=	dbus
PORTVERSION=	0.86
CATEGORIES=	devel gnome
MASTER_SITES=	http://dbus.freedesktop.org/releases/dbus-glib/
PKGNAMESUFFIX=	-glib
DISTNAME=	${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib bindings for the D-BUS messaging system
LICENSE=	gpl2

LIB_DEPENDS=	dbus-1.3:${PORTSDIR}/devel/dbus

USE_GNOME=	gnomehack glib20 ltverhack
USE_GMAKE=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-test-socket-dir=${WRKDIR} \
		--disable-doxygen-docs \
		--disable-xml-docs \
		--disable-gtk-doc \
		--program-prefix='' \
		--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

PLIST_SUB=	VERSION="1.0"

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}



.include <bsd.port.mk>
