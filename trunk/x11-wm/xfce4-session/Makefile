# $MidnightBSD$

PORTNAME=	xfce4-session
PORTVERSION=	4.10.1
PORTREVISION=	1
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/xfce/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session manager for the Xfce 4 desktop environment
LICENSE=	lgpl

BUILD_DEPENDS=	iceauth:${PORTSDIR}/x11/iceauth
RUN_DEPENDS=	iceauth:${PORTSDIR}/x11/iceauth \
		console-kit-daemon:${PORTSDIR}/sysutils/consolekit
LIB_DEPENDS=	libwnck-1.so:${PORTSDIR}/x11-toolkits/libwnck \
		libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib \
		libupower-glib.so:${PORTSDIR}/sysutils/upower \
		libpolkit-gobject-1.so:${PORTSDIR}/sysutils/polkit

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gtk20 glib20 intltool intlhack
USES=		pathfix pkgconfig gmake tar:bzip2 libtool
USE_LDCONFIG=	yes
USE_XFCE=	configenv libmenu libutil xfconf
USE_XORG=	x11 sm ice

CONFIGURE_ARGS+=--enable-legacy-sm \
		--disable-systemd \
		--with-xsession-prefix=${PREFIX} \
		--disable-static

SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

OPTIONS_DEFINE=	NLS

PLIST_SUB=	VERSION="4.6"

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=	gettext
CONFIGURE_ARGS+=	--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
