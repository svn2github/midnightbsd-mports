# $MidnightBSD$

PORTNAME=	gnome-media
PORTVERSION=	2.32.0
PORTREVISION=	2
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multimedia applications for the GNOME 2 desktop

LICENSE=	gpl2

BUILD_DEPENDS=	xml2po:${PORTSDIR}/textproc/gnome-doc-utils
LIB_DEPENDS=	libcanberra-gtk.so:${PORTSDIR}/audio/libcanberra \
		libunique-1.0.so:${PORTSDIR}/x11-toolkits/unique

CONFLICTS=	gnome-control-center-3.[0-9]* libgnome-media-profiles-3.[0-9]*

INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		gettext gmake libtool:keepla pathfix pkgconfig tar:bzip2
USE_GNOME=	gnomeprefix intlhack gtk20 libxml2 gconf2
USE_GSTREAMER=	gconf good
CONFIGURE_ARGS=	--disable-gstmix
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	gnome-audio-profiles.schemas \
		gnome-sound-recorder.schemas

OPTIONS_DEFINE=	PULSEAUDIO
OPTIONS_DEFAULT=PULSEAUDIO

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPULSEAUDIO}
LIB_DEPENDS+=	libpulse.so:${PORTSDIR}/audio/pulseaudio
CONFIGURE_ARGS+=--enable-pulseaudio
PLIST_SUB+=	PULSE=""
.else
CONFIGURE_ARGS+=--disable-pulseaudio
PLIST_SUB+=	PULSE="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|have_gladeui=true|have_gladeui=false|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
