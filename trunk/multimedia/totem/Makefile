# $MidnightBSD$

PORTNAME=	totem
PORTVERSION=	2.32.0
PORTREVISION?=	1
CATEGORIES=	multimedia gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	A gstreamer-based video player for the GNOME 2 Desktop

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
LIB_DEPENDS=	gdata.7:${PORTSDIR}/devel/libgdata \
		unique-1.0.2:${PORTSDIR}/x11-toolkits/unique \
		totem-plparser.17:${PORTSDIR}/multimedia/totem-pl-parser
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes \
		${LOCALBASE}/libexec/gnome-settings-daemon:${PORTSDIR}/sysutils/gnome-settings-daemon \
		${PYTHON_SITELIBDIR}/atom/__init__.py:${PORTSDIR}/devel/py-gdata

CONFLICTS=	totem-3.[0-9]*

USE_PYTHON=	yes
USE_BZIP2=	yes
USES=		pathfix gettext desktop-file-utils
USE_GNOME=	gnomeprefix intlhack nautilus2 \
		ltverhack pygtk2 gnomehier
USE_GSTREAMER=	core gconf hal good mpeg2dec soup ugly python gio
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
INSTALLS_OMF=	yes
PKGMESSAGE=	${WRKDIR}/pkg-message
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	LIBS="-lXrandr" \
		BROWSER_PLUGIN_DIR="${WEBPLUGINS_DIR}"
CONFIGURE_ARGS=	--with-plugins="${TOTEM_PLUGINS}"

MAN1=		totem.1 totem-video-thumbnailer.1
GCONF_SCHEMAS=	totem-handlers.schemas totem-video-thumbnail.schemas \
		totem.schemas

OPTIONS_DEFINE=	LIRC GALAGO BROWSER_PLUGINS PUBLISH TRACKER
GALAGO_DESC=	Galago support
BROWSER_PLUGINS_DESC=	Plugins for gecko browser
PUBLISH_DESC=	Publish (network playlist) plugin
TRACKER_DESC=	Tracker local search plugin

OPTIONS_DEFAULT=	BROWSER_PLUGINS
# check configure script for allowed_plugins="..." for new plugins
TOTEM_PLUGINS=	thumbnail screensaver ontop gromit media-player-keys \
		properties skipto youtube opensubtitles screenshot \
		brasero-disc-recorder coherence_upnp dbus-service iplayer

# Not using:
# TOTEM_PLUGINS= mythtv bemused jamendo

.include <bsd.mport.options.mk>
.include <bsd.port.pre.mk>

.if defined(WITH_PUBLISH)
LIB_DEPENDS+=	epc-1.0.2:${PORTSDIR}/www/libepc
PLIST_SUB+=	PUBLISH=""
TOTEM_PLUGINS:=	${TOTEM_PLUGINS} publish
.else
PLIST_SUB+=	PUBLISH="@comment "
.endif

PLIST_SUB+=	TRACKER="@comment "

.if ${PORT_OPTIONS:MLIRC}
LIB_DEPENDS+=	lirc_client.2:${PORTSDIR}/comms/lirc
PLIST_SUB+=	LIRC=""
TOTEM_PLUGINS:=	${TOTEM_PLUGINS} lirc
.else
PLIST_SUB+=	LIRC="@comment "
.endif

.if ${PORT_OPTIONS:MGALAGO}
LIB_DEPENDS+=	galago.3:${PORTSDIR}/devel/libgalago
PLIST_SUB+=	GALAGO=""
TOTEM_PLUGINS:=	${TOTEM_PLUGINS} galago
.else
PLIST_SUB+=	GALAGO="@comment "
.endif

.if ${PORT_OPTIONS:MBROWSER_PLUGINS}
CONFIGURE_ARGS+=--enable-browser-plugins \
		--enable-gmp-plugin \
		--enable-narrowspace-plugin
PLIST_SUB+=	BROWSER_PLUGINS=""

USE_WEBPLUGINS=		gecko19 webkit-gtk2
WEBPLUGINS_FILES=	libtotem-cone-plugin.so libtotem-gmp-plugin.so \
			libtotem-mully-plugin.so \
			libtotem-narrowspace-plugin.so
.include "${PORTSDIR}/www/browser35/Makefile.webplugins"
.else
CONFIGURE_ARGS+=--disable-browser-plugins \
		--disable-basic-plugin \
		--disable-gmp-plugin \
		--disable-narrowspace-plugin
PLIST_SUB+=	BROWSER_PLUGINS="@comment "
.endif

.if defined(WITH_DVD_DEVICE)
DEFAULT_DVD_DEVICE=${WITH_DVD_DEVICE}
.else
DEFAULT_DVD_DEVICE=/dev/acd0
.endif

pre-everything::
	@${ECHO_MSG} "===> The default DVD device is ${DEFAULT_DVD_DEVICE}"
	@${ECHO_MSG} "===> Define WITH_DVD_DEVICE if you want to change the default"
	@${ECHO_MSG} "===> For example, 'make WITH_DVD_DEVICE=\"/dev/somedevice\"'"

post-patch:
	@${CP} -f ${FILESDIR}/pkg-message.in ${PKGMESSAGE}
	@${REINPLACE_CMD} -e 's|/dev/dvd|${DEFAULT_DVD_DEVICE}|' \
		${WRKSRC}/src/backend/bacon-video-widget-gst-0.10.c

post-install:
	@-update-desktop-database
	${MKDIR} ${PREFIX}/share/vala/vapi
	${INSTALL_DATA} ${WRKSRC}/bindings/vala/totem.vapi ${PREFIX}/share/vala/vapi
	${INSTALL_DATA} ${WRKSRC}/bindings/vala/totem.deps ${PREFIX}/share/vala/vapi
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
