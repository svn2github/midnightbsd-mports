# New ports collection makefile for:	libtelepathy
# Date created:				Apr 16 2007
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD: mports/net-im/libtelepathy/Makefile,v 1.3 2011/02/02 21:16:29 laffer1 Exp $
# $FreeBSD: ports/net-im/libtelepathy/Makefile,v 1.9 2008/06/06 13:51:47 edwin Exp $

PORTNAME=	libtelepathy
PORTVERSION=	0.3.3
CATEGORIES=	net-im devel
MASTER_SITES=	http://telepathy.freedesktop.org/releases/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flexible Communications Framework
LICENSE=	lgpl

LIB_PC_DEPENDS=	dbus-glib-1.pc:${PORTSDIR}/devel/dbus-glib

BUILD_DEPENDS=	xsltproc:${PORTSDIR}/textproc/libxslt
LIB_DEPENDS=	telepathy-glib.0:${PORTSDIR}/net-im/telepathy-glib

BUILD_DEPENDS+=	${LIB_PC_DEPENDS:C|^|${LOCALBASE}/libdata/pkgconfig/|g}
RUN_DEPENDS+=	${LIB_PC_DEPENDS:C|^|${LOCALBASE}/libdata/pkgconfig/|g}

USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pkgconfig glib20 ltverhack 
USE_AUTOTOOLS=	libtool

.include <bsd.port.mk>
