# $MidnightBSD: mports/audio/libcanberra/Makefile,v 1.2 2010/02/27 16:19:01 laffer1 Exp $

PORTNAME=	libcanberra
PORTVERSION=	0.25
CATEGORIES=	audio devel
MASTER_SITES=	http://0pointer.de/lennart/projects/libcanberra/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the Freedesktop sound theme spec
LICENSE=	lgpl

LIB_DEPENDS=	vorbisfile.6:${PORTSDIR}/audio/libvorbis

USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack gtk20 ltverhack gconf2
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22 libltdl:22
CONFIGURE_ARGS=	--disable-lynx --disable-tdb --disable-gtk3
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	libcanberra.schemas

OPTIONS=	PULSE "Enable Pulse Audio support" off \
		GSTREAMER "Enable GStreamer audio support" off

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_PULSE)
LIB_DEPENDS+=	pulse.0:${PORTSDIR}/audio/pulseaudio
PLIST_SUB+=	PULSE=""
.else
CONFIGURE_ARGS+=--disable-pulse
PLIST_SUB+=	PULSE="@comment "
.endif

.if !defined(WITHOUT_GSTREAMER)
USE_GSTREAMER=	yes
PLIST_SUB+=	GSTREAMER=""
.else
CONFIGURE_ARGS+=--disable-gstreamer
PLIST_SUB+=	GSTREAMER="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
	    	${WRKSRC}/configure

.include <bsd.port.post.mk>
