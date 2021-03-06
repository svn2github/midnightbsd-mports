# New ports collection makefile for:	rhythmbox
# Date created:		17 August 2003
# Whom:			Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/audio/rhythmbox/Makefile,v 1.4 2008/06/26 03:30:29 laffer1 Exp $
# $FreeBSD: ports/audio/rhythmbox/Makefile,v 1.100 2007/07/23 17:35:54 danfe Exp $
#   $MCom: ports/audio/rhythmbox/Makefile,v 1.70 2007/03/07 17:00:36 adamw Exp $
#

PORTNAME=	rhythmbox
PORTVERSION=	0.10.1
PORTREVISION=	6
CATEGORIES=	audio gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/0.10
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio player for GNOME
LICENSE=	gpl2

LIB_DEPENDS=	musicbrainz.4:${PORTSDIR}/audio/libmusicbrainz \
		id3tag.0:${PORTSDIR}/audio/libid3tag \
		totem-plparser.7:${PORTSDIR}/multimedia/totem \
		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		sexy.2:${PORTSDIR}/x11-toolkits/libsexy \
		soup-2.2.8:${PORTSDIR}/devel/libsoup22 \
		gnome-media-profiles.0:${PORTSDIR}/audio/gnome-media

USE_BZIP2=	yes
USE_XORG=	x11
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
USE_GMAKE=	yes
USE_PYTHON=     yes
USE_GNOME=	gnomehack intlhack gnomeprefix libgnomeui nautiluscdburner pygtk2
WANT_GNOME=	yes
USE_GSTREAMER=	flac mp3 gnomevfs gconf jpeg
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ARGS=	--enable-nautilus-menu --with-playback=gstreamer-0-10 --enable-python
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	LIBS="-lm" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		CPPFLAGS="-I${LOCALBASE}/include"

GCONF_SCHEMAS=	rhythmbox.schemas

OPTIONS=	DAAP "Enable iTunes music sharing" off \
		IPOD "Enable iPod support" on \
		FAAD "Enable FAAD decoder support" off \
		NOTIFY "Enable libnotify support" on \
		VORBIS "Enable Ogg/Vorbis support" on \
		LIRC "Enable Infrared syncing support" off
#		GDA "Enable GDA database storage" off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_VORBIS)
USE_GSTREAMER+=		vorbis
.else
CONFIGURE_ARGS+=	--disable-vorbis --disable-vorbistest
.endif

.if defined(WITH_FAAD)
USE_GSTREAMER+=		faad
.endif

#.if defined(WITH_GDA)
#USE_GNOME+=	libgda2
#CONFIGURE_ARGS+=--with-database=libgda
#.else
CONFIGURE_ARGS+=--with-database=tree
#.endif

.if defined(WITH_LIRC)
LIB_DEPENDS+=	lirc_client.1:${PORTSDIR}/comms/lirc
PLIST_SUB+=	LIRC=""
CONFIGURE_ARGS+=--enable-lirc
.else
CONFIGURE_ARGS+=--disable-lirc
PLIST_SUB+=	LIRC="@comment "
.endif

.if defined(WITH_DAAP)
CONFIGURE_ARGS+=	--enable-daap  --with-mdns=avahi
LIB_DEPENDS+=		avahi-client:${PORTSDIR}/net/avahi-app \
    			gnome-keyring:${PORTSDIR}/security/gnome-keyring
PLIST_SUB+=		DAAP=""
.else
.if exists(${LOCALBASE}/lib/libavahi-client.a)
LIB_DEPENDS+=		avahi-client:${PORTSDIR}/net/avahi-app
.endif
CONFIGURE_ARGS+=	--disable-daap
PLIST_SUB+=		DAAP="@comment "
.endif

.if !defined(WITHOUT_NOTIFY)
LIB_DEPENDS+=		notify.1:${PORTSDIR}/devel/libnotify
RUN_DEPENDS+=		${LOCALBASE}/libexec/notification-daemon:${PORTSDIR}/deskutils/notification-daemon
.else
CONFIGURE_ARGS+=	--disable-libnotify
.endif

.if !defined(WITHOUT_IPOD)
LIB_DEPENDS+=	gpod.3:${PORTSDIR}/audio/libgpod
CONFIGURE_ARGS+=--with-ipod
PLIST_SUB+=	IPOD=""
.else
CONFIGURE_ARGS+=--without-ipod
PLIST_SUB+=	IPOD="@comment "
.endif

.include <bsd.port.post.mk>
