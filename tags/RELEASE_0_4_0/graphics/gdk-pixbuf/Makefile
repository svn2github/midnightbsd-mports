# $MidnightBSD: mports/graphics/gdk-pixbuf/Makefile,v 1.9 2013/01/17 14:56:58 laffer1 Exp $

PORTNAME?=	gdk-pixbuf
PORTVERSION=	0.22.0
PORTREVISION=	5
CATEGORIES?=	graphics
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gdk-pixbuf/0.22
DISTNAME=	gdk-pixbuf-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	A graphic library for GTK+
LICENSE=	gpl2

LIB_DEPENDS+=	png15:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff \
		jpeg.11:${PORTSDIR}/graphics/jpeg

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XORG=	xt xi x11
USE_GNOME+=	gnomehack gtk12
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc --enable-shared=yes
CONFIGURE_ENV+=	LIBS="-L${LOCALBASE}/lib" \
		BUILD_CANVAS="${BUILD_CANVAS}"
CPPFLAGS+=	-I${LOCALBASE}/include

BUILD_CANVAS?=	no

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' \
		-e 's/freebsd/freebsd*|midnightbsd/' \
		 ${WRKSRC}/configure

.include <bsd.port.mk>
