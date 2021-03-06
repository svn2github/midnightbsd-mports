# $MidnightBSD: mports/x11-wm/compiz/Makefile,v 1.7 2011/01/20 14:21:34 laffer1 Exp $
# $FreeBSD: ports/x11-wm/compiz/Makefile,v 1.7 2007/10/29 19:20:43 flz Exp $

PORTNAME=	compiz
PORTVERSION=	0.8.4
CATEGORIES=	x11-wm
MASTER_SITES=	http://releases.compiz.org/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compiz Composite/Window Manager
LICENSE=	agg

LIB_DEPENDS=	png.6:${PORTSDIR}/graphics/png \
		gtop-2.0.7:${PORTSDIR}/devel/libgtop \
		startup-notification-1.0:${PORTSDIR}/x11/startup-notification

XORG_CAT=	app
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
#USE_TGZ=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_GL=		glu
USE_GNOME=	gnomehack gconf2 libxslt
USE_XORG=	xcomposite xfixes xdamage xrandr xrender ice sm xinerama glproto
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22

GCONF_SCHEMAS=	gwd.schemas \
		compiz-annotate.schemas \
		compiz-blur.schemas \
		compiz-clone.schemas \
		compiz-commands.schemas \
		compiz-core.schemas \
		compiz-cube.schemas \
		compiz-dbus.schemas \
		compiz-decoration.schemas \
		compiz-fade.schemas \
		compiz-fs.schemas \
		compiz-gconf.schemas \
		compiz-glib.schemas \
		compiz-gnomecompat.schemas \
		compiz-ini.schemas \
		compiz-inotify.schemas \
		compiz-kconfig.schemas \
		compiz-minimize.schemas \
		compiz-move.schemas \
		compiz-obs.schemas \
		compiz-place.schemas \
		compiz-png.schemas \
		compiz-regex.schemas \
		compiz-resize.schemas \
		compiz-rotate.schemas \
		compiz-scale.schemas \
		compiz-screenshot.schemas \
		compiz-svg.schemas \
		compiz-switcher.schemas \
		compiz-video.schemas \
		compiz-water.schemas \
		compiz-wobbly.schemas \
		compiz-zoom.schemas

CONFIGURE_ARGS=	--disable-kde4
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

OPTIONS=	RSVG "Enable librsvg2 support" on \
		GTK "Enable gtk2 support" on \
		METACITY "Enable Metacity support" on \
		GNOME "Enable Gnome support" on \
		DBUS "Enable DBUS support" on \
		FUSEFS "Enable fusefs support" off \
		KDE "Enable KDE support" off

SUB_FILES=		compiz-manager
DESKTOP_ENTRIES=	"Compiz Manager" \
			"A wrapper script for starting compiz" \
			"" \
			"compiz-manager" \
			"Application;Core;" \
			false

post-patch:
	@${REINPLACE_CMD} -e 's|libpng|libpng14|' -e 's|gnome-desktop-2.0|gnome-desktop-2.0 gconf-2.0|g' \
		${WRKSRC}/configure

post-install:
	${INSTALL_SCRIPT} ${WRKDIR}/compiz-manager ${PREFIX}/bin/compiz-manager

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_RSVG)
CONFIGURE_ARGS+=	--enable-librsvg
USE_GNOME+=		librsvg2
PLIST_SUB+=		RSVG=""
.else
CONFIGURE_ARGS+=	--disable-librsvg
PLIST_SUB+=		RSVG="@comment "
.endif

.if !defined(WITHOUT_GTK)
CONFIGURE_ARGS+=	--enable-gtk
USE_GNOME+=	 glib20 libwnck
PLIST_SUB+=	GTK=""
.else
CONFIGURE_ARGS+=	--disable-gtk
PLIST_SUB+=	GTK="@comment "
.endif

.if !defined(WITHOUT_METACITY) && !defined(WITHOUT_GNOME) && !defined(WITHOUT_GTK)
CONFIGURE_ARGS+=	--enable-metacity
USE_GNOME+=	metacity
.else
CONFIGURE_ARGS+=	--disable-metacity
.endif

.if !defined(WITHOUT_GNOME) && !defined(WITHOUT_GTK)
CONFIGURE_ARGS+=	--enable-gnome \
			--enable-gnome-keybindings
USE_GNOME+=	 gnomecontrolcenter2
WINDOWSETTINGSDATADIR=	\
		`pkg-config --variable=prefix gnome-window-settings-2.0`
WINDOWSETTINGSLIBDIR=	\
		`pkg-config --variable=libdir gnome-window-settings-2.0`
PLIST_SUB+=	GNOME="" \
		WINDOWSETTINGSDATADIR="${WINDOWSETTINGSDATADIR}" \
		WINDOWSETTINGSLIBDIR="${WINDOWSETTINGSLIBDIR}"
.else
CONFIGURE_ARGS+=	--disable-gnome \
			--disable-gnome-keybindings
PLIST_SUB+=	GNOME="@comment "
.endif

.if !defined(WITHOUT_DBUS)
CONFIGURE_ARGS+=	--enable-dbus
BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dbus-1.pc:${PORTSDIR}/devel/dbus
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dbus-1.pc:${PORTSDIR}/devel/dbus
.if !defined(WITHOUT_GTK) && !defined(WITHOUT_GNOME)
CONFIGURE_ARGS+=	--enable-dbus-glib
BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dbus-glib-1.pc:${PORTSDIR}/devel/dbus-glib
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dbus-glib-1.pc:${PORTSDIR}/devel/dbus-glib
.endif
PLIST_SUB+=	DBUS=""
.else
CONFIGURE_ARGS+=	--disable-dbus --disable-dbus-glib
PLIST_SUB+=	DBUS="@comment "
.endif

.if defined(WITH_FUSEFS)
CONFIGURE_ARGS+=	--enable-fuse
BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/fuse.pc:${PORTSDIR}/sysutils/fusefs-libs
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/fuse.pc:${PORTSDIR}/sysutils/fusefs-libs
PLIST_SUB+=		FUSEFS=""
.else
CONFIGURE_ARGS+=	--disable-fuse
PLIST_SUB+=		FUSEFS="@comment "
.endif

.if defined(WITH_KDE)
EXTENSIONS+=	kde
USE_KDEBASE_VER=	3
CONFIGURE_ARGS+=	--enable-kde
PLIST_SUB+=	KDE=""
.else
CONFIGURE_ARGS+=	--disable-kde
PLIST_SUB+=	KDE="@comment "
.endif

.include <bsd.port.pre.mk>
.include <bsd.port.post.mk>
