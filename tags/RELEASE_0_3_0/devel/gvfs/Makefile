# $MidnightBSD: mports/devel/gvfs/Makefile,v 1.9 2009/06/28 01:02:23 laffer1 Exp $

PORTNAME=	gvfs
PORTVERSION=	1.6.3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME virtual file system
LICENSE=	lgpl

LIB_DEPENDS=	dbus-1.3:${PORTSDIR}/devel/dbus \
    		hal.1:${PORTSDIR}/sysutils/hal \
		soup-2.4.1:${PORTSDIR}/devel/libsoup \
		gnome-keyring:${PORTSDIR}/security/gnome-keyring \
		avahi-client.3:${PORTSDIR}/net/avahi-app
RUN_DEPENDS=	gnome-mount:${PORTSDIR}/sysutils/gnome-mount

USE_BZIP2=	yes
USE_GNOME=	glib20 gnomehack gnomeprefix intlhack gconf2
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--disable-obexftp --disable-http
OPTIONS=	FUSE "Enable fuse" on \
		SAMBA "Enable Samba" on \
		GPHOTO2 "Enable Gphoto 2 camera support" on \
		CDDA "Enable CDDA" on

.include <bsd.port.pre.mk>

.if defined(WITH_FUSE)
LIB_DEPENDS+=	fuse.2:${PORTSDIR}/sysutils/fusefs-libs
RUN_DEPENDS+=	mount_fusefs:${PORTSDIR}/sysutils/fusefs-kmod
PLIST_SUB+=	FUSE=""
.else
CONFIGURE_ARGS+=	--disable-fuse
PLIST_SUB+=	FUSE="@comment "
.endif

.if defined(WITH_SAMBA)
LIB_DEPENDS+=	smbclient.0:${PORTSDIR}/net/samba-libsmbclient
PLIST_SUB+=	SMB=""
.else
CONFIGURE_ARGS+=	--disable-samba
PLIST_SUB+=	SMB="@comment "
.endif

.if defined(WITH_CDDA)
LIB_DEPENDS+=	cdio_paranoia.0:${PORTSDIR}/sysutils/libcdio
PLIST_SUB+=	CDDA=""
.else
CONFIGURE_ARGS+=	--disable-cdda
PLIST_SUB+=	CDDA="@comment "
.endif

.if defined(WITH_GPHOTO2)
LIB_DEPENDS+=	gphoto2.2:${PORTSDIR}/graphics/libgphoto2
PLIST_SUB+=	GPHOTO2=""
.else
CONFIGURE_ARGS+=	--disable-gphoto2
PLIST_SUB+=	GPHOTO2="@comment "
.endif

.include <bsd.port.post.mk>
