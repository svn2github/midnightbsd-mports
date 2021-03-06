# New ports collection makefile for:    totem
# Date created:         17 Oct 2002
# Whom:                 Hendrik Scholz <hendrik@scholz.net>
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/totem/Makefile,v 1.92 2008/01/07 22:03:13 mezz Exp $
#   $MCom: ports/multimedia/totem/Makefile,v 1.89 2007/10/17 17:22:32 mezz Exp $
#

PORTNAME=	totem
PORTVERSION=	2.20.3
PORTREVISION?=	0
CATEGORIES=	multimedia gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	A gstreamer-based video player for the GNOME 2 Desktop

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
LIB_DEPENDS=	musicbrainz:${PORTSDIR}/audio/libmusicbrainz \
		hal.1:${PORTSDIR}/sysutils/hal
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack gnomedesktop desktopfileutils \
		nautiluscdburner ltverhack gnomecontrolcenter2
GNOME_DESKTOP_VERSION=2
WANT_GSTREAMER=	yes
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
INSTALLS_OMF=	yes
PKGMESSAGE=	${WRKDIR}/pkg-message
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
	       	LIBS="-L${LOCALBASE}/lib -lXrandr"
CONFIGURE_ARGS=	--with-plugins="${TOTEM_PLUGINS}"

MAN1=		totem.1 totem-video-thumbnailer.1
GCONF_SCHEMAS=	totem-handlers.schemas totem-video-thumbnail.schemas \
		totem.schemas
CONFLICTS?=	totem-gstreamer-[0-9]* totem-xine-[0-9]*

OPTIONS=	LIRC "Enable lirc support" off \
		GALAGO "Enable Galago support" off

TOTEM_PLUGINS=	screensaver ontop gromit media-player-keys properties sidebar-test skipto

.include <bsd.port.pre.mk>

.if defined(WITH_LIRC)
LIB_DEPENDS+=	lirc_client.1:${PORTSDIR}/comms/lirc
PLIST_SUB+=	LIRC=""
TOTEM_PLUGINS:=	${TOTEM_PLUGINS} lirc
.else
PLIST_SUB+=	LIRC="@comment "
.endif

.if defined(WITH_GALAGO)
LIB_DEPENDS+=	galago.3:${PORTSDIR}/devel/libgalago
PLIST_SUB+=	GALAGO=""
TOTEM_PLUGINS:=	${TOTEM_PLUGINS} galago
.else
PLIST_SUB+=	GALAGO="@comment "
.endif

.if defined(WITH_MOZILLA_PLUGIN) && ${SLAVE_PORT:L}=="yes"
USE_GECKO=	firefox mozilla seamonkey xulrunner<->firefox firefox-devel<->firefox
.include "${PORTSDIR}/www/mozilla/bsd.gecko.mk"
CONFIGURE_ARGS+=--with-mozilla=${GECKO} \
		--enable-gmp-plugin \
		--enable-complex-plugin \
		--enable-narrowspace-plugin
BUILD_WRKSRC=	${WRKSRC}/browser-plugin
INSTALL_WRKSRC=	${WRKSRC}/browser-plugin
.else
CONFIGURE_ARGS+=--without-mozilla \
		--disable-browser-plugins \
		--disable-mozilla \
		--disable-basic-plugin \
		--disable-gmp-plugin \
		--disable-complex-plugin \
		--disable-narrowspace-plugin
.endif

.if !defined(WITH_TOTEM_XINE) || ${SLAVE_PORT}=="no"
CONFIGURE_ARGS+=--enable-gstreamer=yes
USE_GSTREAMER+=	gnomevfs core gconf hal good mpeg2dec ugly
WITHOUT_DVDNAV=	yes
PLIST_SUB+=	GSTREAMER=""
.else
CONFIGURE_ARGS+=--enable-xine=yes
LIB_DEPENDS+=	xine.1:${PORTSDIR}/multimedia/libxine
PLIST_SUB+=	GSTREAMER="@comment "
.endif

.if defined(WITH_DVDNAV) && !defined(WITHOUT_DVDNAV)
LIB_DEPENDS+=	dvdnav.4:${PORTSDIR}/multimedia/libdvdnav
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
	@${REINPLACE_CMD} -e ' s|@MOZILLA_PLUGINDIR@|${PREFIX}/lib/browser_plugins|; \
		s|mozilla/plugins|browser_plugins|' \
		${WRKSRC}/browser-plugin/Makefile.in \
		${WRKSRC}/browser-plugin/idl/Makefile.in
	@${REINPLACE_CMD} -e 's|dbus >= 0.61|dbus-1 >= 0.61|g' \
	    	${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|/dev/dvd|${DEFAULT_DVD_DEVICE}|' \
		${WRKSRC}/src/backend/bacon-video-widget-gst-0.10.c

post-install:
	@-update-desktop-database
	${MKDIR} ${PREFIX}/share/vala/vapi
	${INSTALL_DATA} ${WRKSRC}/bindings/vala/totem.vala ${PREFIX}/share/vala/vapi
	${INSTALL_DATA} ${WRKSRC}/bindings/vala/totem.deps ${PREFIX}/share/vala/vapi

.include <bsd.port.post.mk>
