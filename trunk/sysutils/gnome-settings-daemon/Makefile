# $MidnightBSD$

PORTNAME=	gnome-settings-daemon
PORTVERSION=	2.32.1
PORTREVISION=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 settings daemon

LICENSE=	gpl2

LIB_DEPENDS=	canberra-gtk:${PORTSDIR}/audio/libcanberra \
		notify:${PORTSDIR}/devel/libnotify \
		gdbm:${PORTSDIR}/databases/gdbm \
		nss3:${PORTSDIR}/security/nss
RUN_DEPENDS=	xrdb:${PORTSDIR}/x11/xrdb

CONFLICTS=	gnome-settings-daemon-3.[0-9]*

USE_XORG=	xxf86misc
USE_BZIP2=	yes
USE_GMAKE=	yes
USES=		pathfix gettext
USE_GNOME=	gnomeprefix intlhack gnomedesktop libgnomekbd
USE_GSTREAMER=	good
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	PULSEAUDIO
OPTIONS_DEFAULT=PULSEAUDIO

GCONF_SCHEMAS=	apps_gnome_settings_daemon_housekeeping.schemas \
		apps_gnome_settings_daemon_keybindings.schemas \
		apps_gnome_settings_daemon_xrandr.schemas \
		desktop_gnome_font_rendering.schemas \
		desktop_gnome_keybindings.schemas \
		desktop_gnome_peripherals_smartcard.schemas \
		desktop_gnome_peripherals_touchpad.schemas \
		gnome-settings-daemon.schemas

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPULSEAUDIO}
LIB_DEPENDS+=	pulse:${PORTSDIR}/audio/pulseaudio
CONFIGURE_ARGS+=--enable-pulse
PLIST_SUB+=	PULSEAUDIO=""
.else
CONFIGURE_ARGS+=--disable-pulse
PLIST_SUB+=	PULSEAUDIO="@comment "
.endif

.include <bsd.port.mk>
