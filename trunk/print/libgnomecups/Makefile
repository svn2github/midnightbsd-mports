# $MidnightBSD$

PORTNAME=	libgnomecups
PORTVERSION=	0.2.3
PORTREVISION=	4
PORTEPOCH=	1
CATEGORIES=	print gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Support library for gnome cups admistration
LICENSE=	gpl2

LIB_DEPENDS=	libcups.so:${PORTSDIR}/print/cups-client

USES=		pkgconfig pathfix gettext gmake libtool:keepla tar:bzip2
GNU_CONFIGURE=	yes
USE_GNOME=	intlhack glib20
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include -D_IPP_PRIVATE_STRUCTURES
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
