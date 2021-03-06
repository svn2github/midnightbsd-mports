# New ports collection makefile for:   dbus-glib
# Date Created:			07 October 2006
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD: ports/devel/dbus-glib/Makefile,v 1.2 2006/10/31 02:36:57 marcus Exp $
# $MidnightBSD: mports/devel/dbus-glib/Makefile,v 1.1 2007/02/19 22:40:24 laffer1 Exp $
#

PORTNAME=	dbus
PORTVERSION=	0.74
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
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-test-socket-dir=${WRKDIR} \
		--disable-doxygen-docs \
		--disable-xml-docs \
		--disable-gtk-doc \
		--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

PLIST_SUB=	VERSION="1.0"

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}

pre-build:
	@${CP} ${FILESDIR}/dbus-bus-introspect.xml ${WRKSRC}/tools

.include <bsd.port.mk>
