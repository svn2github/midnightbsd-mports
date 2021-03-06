# $MidnightBSD$

PORTNAME=	pango
PORTVERSION=	1.34.1
PORTREVISION=	2
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source framework for the layout and rendering of i18n text

LICENSE=	lgpl

USES=		tar:xz

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	fontconfig>=2.10.91:${PORTSDIR}/x11-fonts/fontconfig
LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2 \
		libharfbuzz.so:${PORTSDIR}/print/harfbuzz \
		libfontconfig.so:${PORTSDIR}/x11-fonts/fontconfig
RUN_DEPENDS=	${FONTSCALE}:${PORTSDIR}/x11-fonts/xorg-fonts-truetype \
		${FONTENCOD}:${PORTSDIR}/x11-fonts/encodings

USES+=		gettext gmake libtool:keepla pathfix pkgconfig
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	cairo glib20 gnomehier referencehack introspection:build
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

SUB_FILES+=	pkg-install

PLIST_SUB=	VERSION="1.8.0"

FONTSCALE=	${LOCALBASE}/lib/X11/fonts/TTF/luximb.ttf
FONTENCOD=	${LOCALBASE}/lib/X11/fonts/encodings/encodings.dir

OPTIONS_DEFINE=	X11
OPTIONS_DEFAULT=X11

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MX11}
USE_XORG+=	xft xrender
#CONFIGURE_ARGS+=--with-xft
PLIST_SUB+=	X11=""
.else
CONFIGURE_ARGS+=--without-xft
PLIST_SUB+=	X11="@comment "
.endif

pre-configure:
.if !exists(${LOCALBASE}/libdata/pkgconfig/cairo-gobject.pc)
	@${ECHO_CMD} "${PKGNAME}: Needs cairo with GLIB (GObject) support enabled."
	@${FALSE}
.endif

.include <bsd.port.mk>

.endif
