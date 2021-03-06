# $MidnightBSD$

PORTNAME=	alsa-plugins
PORTVERSION=	1.0.28
CATEGORIES=	audio
MASTER_SITES=	ALSA/plugins \
		GENTOO/distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ALSA compatibility library plugins

LICENSE=	gpl2

LIB_DEPENDS=	asound:${PORTSDIR}/audio/alsa-lib

GNU_CONFIGURE=	yes
USES=		pkgconfig tar:bzip2
LDFLAGS+=	-L${LOCALBASE}/lib
EXTRA_PATCHES+=	${FILESDIR}/alsa-plugins.patch

OPTIONS_DEFAULT=BUFSZ_P2 IO_PTR
OPTIONS_DEFINE=	JACK FFMPEG PULSEAUDIO SAMPLERATE SPEEX
OPTIONS_SUB=	${OPTIONS_DEFINE}

OPTIONS_GROUP=	OSS
OPTIONS_GROUP_OSS=IO_PTR BLKCNT_P2 BUFSZ_P2 VERBOSE

IO_PTR_DESC=	Precise playback/recording pointer
BLKCNT_P2_DESC=	Restrict number of fragments to ^2 aligned
BUFSZ_P2_DESC=	Restrict buffer size to ^2 aligned (breaks aplay)
VERBOSE_DESC=	Print debugging messages

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MIO_PTR}
CFLAGS+=	-DFREEBSD_OSS_USE_IO_PTR
.endif

.if ${PORT_OPTIONS:MBLKCNT_P2}
CFLAGS+=	-DFREEBSD_OSS_BLKCNT_P2
.endif

.if ${PORT_OPTIONS:MBUFSZ_P2}
CFLAGS+=	-DFREEBSD_OSS_BUFSZ_P2
.endif

.if ${PORT_OPTIONS:MVERBOSE}
CFLAGS+=	-DFREEBSD_OSS_DEBUG_VERBOSE
.endif

.if ${PORT_OPTIONS:MJACK}
.if empty(PORT_OPTIONS:MSAMPLERATE)
IGNORE=			JACK audio support requires SAMPLERATE
.endif
LIB_DEPENDS+=		jack:${PORTSDIR}/audio/jack
PLIST_SUB+=		JACK=""
.else
PLIST_SUB+=		JACK="@comment "
CONFIGURE_ARGS+=	--disable-jack
.endif

.if ${PORT_OPTIONS:MFFMPEG}
CONFIGURE_ARGS+=	--enable-avcodec
CFLAGS+=		-I${LOCALBASE}/include
LIB_DEPENDS+=		avcodec:${PORTSDIR}/multimedia/ffmpeg
PLIST_SUB+=		LAVC=""
.else
CONFIGURE_ARGS+=	--disable-avcodec
PLIST_SUB+=		LAVC="@comment "
.endif

.if ${PORT_OPTIONS:MPULSEAUDIO}
LIB_DEPENDS+=		pulse:${PORTSDIR}/audio/pulseaudio
PLIST_SUB+=		PULSE=""
.else
PLIST_SUB+=		PULSE="@comment "
CONFIGURE_ARGS+=	--disable-pulseaudio
.endif

.if ${PORT_OPTIONS:MSAMPLERATE}
LIB_DEPENDS+=		samplerate:${PORTSDIR}/audio/libsamplerate
PLIST_SUB+=		SAMPLERATE=""
.else
PLIST_SUB+=		SAMPLERATE="@comment "
CONFIGURE_ARGS+=	--disable-samplerate
.endif

.if ${PORT_OPTIONS:MSPEEX}
CONFIGURE_ARGS+=	--with-speex=lib
LIB_DEPENDS+=		speex:${PORTSDIR}/audio/speex
PLIST_SUB+=		SPEEX=""
.else
CONFIGURE_ARGS+=	--without-speex
PLIST_SUB+=		SPEEX="@comment "
.endif

post-patch:	.SILENT
	${REINPLACE_CMD} -e '/LIBS/s/-ldl//g' \
		-e '/lt_cv_dlopen/s/-ldl//g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
