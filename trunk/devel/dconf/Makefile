# $MidnightBSD$

PORTNAME?=	dconf
PORTVERSION=	0.14.1
PORTREVISION?=	3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DISTNAME=	dconf-${PORTVERSION}
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configuration database system for GNOME

LICENSE=	lgpl

BUILD_DEPENDS=	vala>=0.18.1:${PORTSDIR}/lang/vala \
		docbook-xsl>=0:${PORTSDIR}/textproc/docbook-xsl
LIB_DEPENDS=	libdbus-1.so:${PORTSDIR}/devel/dbus

USES=		gettext gmake pathfix pkgconfig tar:xz
USE_GNOME=	glib20 gnomehier intltool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

DCONF_SLAVE?=	no

.if ${DCONF_SLAVE} == "editor"
USE_GNOME+=	gtk30
INSTALLS_ICONS=	yes
GLIB_SCHEMAS=	ca.desrt.dconf-editor.gschema.xml
LIB_DEPENDS+=	libdconf.so:${PORTSDIR}/devel/dconf
.else
CONFIGURE_ARGS+=--disable-editor
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/|${PREFIX}/etc/|g' \
		${WRKSRC}/engine/dconf-engine.c \
		${WRKSRC}/engine/dconf-engine-profile.c \
		${WRKSRC}/engine/dconf-engine-source-system.c \
		${WRKSRC}/bin/dconf-update.c \
		${WRKSRC}/tests/engine.c
	@${REINPLACE_CMD} -e 's|/usr/local/|${LOCALBASE}/|g' \
		${WRKSRC}/editor/dconf-model.c
	@${REINPLACE_CMD} -e 's|/usr/share|${LOCALBASE}/share|g' \
		${WRKSRC}/editor/dconf-model.vala
	@${REINPLACE_CMD} -e 's|-Wno-unused-but-set-variable||g' \
		${WRKSRC}/bin/Makefile.in \
		${WRKSRC}/client/Makefile.in \
		${WRKSRC}/editor/Makefile.in

post-install:
	-${LOCALBASE}/bin/gio-querymodules ${PREFIX}/lib/gio/modules
	@${MKDIR} ${PREFIX}/etc/dconf/db
	@${MKDIR} ${PREFIX}/etc/dconf/profile

.include <bsd.port.mk>
