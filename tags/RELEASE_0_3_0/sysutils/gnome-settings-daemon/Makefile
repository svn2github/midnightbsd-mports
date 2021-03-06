# $MidnightBSD$

PORTNAME=	gnome-settings-daemon
PORTVERSION=	2.30.2
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 settings daemon
LICENSE=	gpl2

LIB_DEPENDS=	canberra-gtk.0:${PORTSDIR}/audio/libcanberra \
		notify.1:${PORTSDIR}/devel/libnotify
RUN_DEPENDS=	xrdb:${PORTSDIR}/x11/xrdb

USE_XORG=	xxf86misc
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack gnomedesktop libgnomekbd
USE_GETTEXT=	yes
USE_GSTREAMER=	good
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

OPTIONS=	PULSEAUDIO "Enable Pulseaudio support" On

GCONF_SCHEMAS=	apps_gnome_settings_daemon_housekeeping.schemas \
		apps_gnome_settings_daemon_keybindings.schemas \
		apps_gnome_settings_daemon_xrandr.schemas \
		desktop_gnome_font_rendering.schemas \
		desktop_gnome_keybindings.schemas \
		desktop_gnome_peripherals_touchpad.schemas \
		gnome-settings-daemon.schemas

.include <bsd.port.pre.mk>

.if defined(WITHOUT_PULSEAUDIO)
CONFIGURE_ARGS+=--disable-pulse
PLIST_SUB+=	PULSEAUDIO="@comment "
.else
LIB_DEPENDS+=	pulse.0:${PORTSDIR}/audio/pulseaudio
CONFIGURE_ARGS+=--enable-pulse
PLIST_SUB+=	PULSEAUDIO=""
.endif

.include <bsd.port.post.mk>
