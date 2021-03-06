# $MidnightBSD$

PORTNAME=	nautilus
PORTVERSION=	2.32.2.1
PORTREVISION=	2
CATEGORIES=	x11-fm gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File manager for the GNOME desktop

LICENSE=	gpl2

BUILD_DEPENDS=	g-ir-compiler:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	exif:${PORTSDIR}/graphics/libexif \
		unique-1.0:${PORTSDIR}/x11-toolkits/unique \
		exempi:${PORTSDIR}/textproc/exempi

CONFLICTS=	nautilus-3.[0-9]*

INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USES=		gettext
USES=		desktop-file-utils shared-mime-info
USE_GNOME=	gnomeprefix gnomehack intlhack gnomedesktop \
		librsvg2 ltverhack gvfs ltasneededhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	LIBS="${PTHREAD_LIBS} -L${LOCALBASE}/lib -liconv" \
		LIBPNG="-L${LOCALBASE}/lib -lpng -lz"
CPPFLAGS+=	-I${LOCALBASE}/include
CONFIGURE_ARGS=	--enable-static --disable-packagekit
MAKE_ENV=	G_CHARSET_ALIAS="${LOCALBASE}/libdata/charset.alias"

GCONF_SCHEMAS=	apps_nautilus_preferences.schemas

MAN1=		nautilus-connect-server.1 nautilus-file-management-properties.1 \
		nautilus.1

post-patch:
	@${REINPLACE_CMD} -e 's|G_CONST_RETURN|const|g' \
		${WRKSRC}/eel/eel-*.[ch] \
		${WRKSRC}/libnautilus-private/*.[ch] \
		${WRKSRC}/src/nautilus-zoom-control.c
	@${REINPLACE_CMD} -e 's|-DG_DISABLE_DEPRECATED||g' \
		${WRKSRC}/configure ${WRKSRC}/eel/Makefile.in

post-install:
	@${MKDIR} ${PREFIX}/lib/nautilus/extensions-2.0

.include <bsd.port.mk>
