# $MidnightBSD: mports/x11-toolkits/unique/Makefile,v 1.1 2010/01/24 15:56:49 laffer1 Exp $

PORTNAME=	unique
PORTVERSION=	1.1.6
PORTREVISION=	0
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME/sources/lib${PORTNAME}/${PORTVERSION:R}/
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for single instance applications.
LICENSE=	lgpl

LIB_DEPENDS=	dbus-1.3:${PORTSDIR}/devel/dbus

USE_XORG=	ice
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
USE_GNOME=	gtk20 gnomeprefix ltverhack:2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-maintainer-flags
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-patch:
	@${REINPLACE_CMD} -e 's|libdir)/pkgconfig|prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/configure ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
