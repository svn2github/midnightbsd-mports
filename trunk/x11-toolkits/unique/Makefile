# $MidnightBSD$

PORTNAME=	unique
PORTVERSION=	1.1.6
PORTREVISION=	6
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME/sources/lib${PORTNAME}/${PORTVERSION:R}/
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for single instance applications

LICENSE=	lgpl

LIB_DEPENDS=	dbus-glib-1:${PORTSDIR}/devel/dbus-glib

USE_XORG=	ice
USE_BZIP2=	yes
USE_GMAKE=	yes
USES=		gettext
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gtk20 gnomeprefix introspection:build ltverhack:2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-maintainer-flags
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|libdir)/pkgconfig|prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/configure ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|G_CONST_RETURN|const|g' \
		${WRKSRC}/unique/uniqueapp.c \
		${WRKSRC}/unique/uniquebackend.[ch] \
		${WRKSRC}/unique/uniqueinternals.h \
		${WRKSRC}/unique/uniquemessage.[ch]

.include <bsd.port.mk>
