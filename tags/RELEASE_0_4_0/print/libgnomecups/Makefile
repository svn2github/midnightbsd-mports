# $MidnightBSD: mports/print/libgnomecups/Makefile,v 1.8 2012/01/28 04:25:12 laffer1 Exp $

PORTNAME=	libgnomecups
PORTVERSION=	0.2.3
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	print gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Support library for gnome cups admistration
LICENSE=	gpl2

LIB_DEPENDS=	cups:${PORTSDIR}/print/cups-client

USES=		pkgconfig gettext
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack intlhack ltverhack glib20
USE_LDCONFIG=	yes
USE_AUTOTOOLS=  libtool
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
