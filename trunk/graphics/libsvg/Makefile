# $MidnightBSD$

PORTNAME=	libsvg
PORTVERSION=	0.1.4
PORTREVISION=	6
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parser for SVG content in files or buffers

LICENSE=	lgpl

LIB_DEPENDS=	libfontconfig.so:${PORTSDIR}/x11-fonts/fontconfig \
		libpng15.so:${PORTSDIR}/graphics/png \
		libjpeg.so:${PORTSDIR}/graphics/jpeg

GNU_CONFIGURE=	yes
USE_GNOME=	libxml2
USES=		iconv libtool pathfix pkgconfig
USE_LDCONFIG=	yes
CFLAGS+=	-I${LOCALBASE}/include

PLIST_FILES=	include/svg.h \
		lib/libsvg.a \
		lib/libsvg.so \
		lib/libsvg.so.1.0 \
		libdata/pkgconfig/libsvg.pc

post-install:
	cd ${PREFIX}/lib && ${LN} libsvg.so.1.0 libsvg.so

.include <bsd.port.mk>
