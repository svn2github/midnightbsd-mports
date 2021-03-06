# $MidnightBSD: mports/audio/pulseaudio/Makefile,v 1.2 2009/09/20 00:43:54 laffer1 Exp $

PORTNAME=	pulseaudio
PORTVERSION=	0.9.19
CATEGORIES=	audio
MASTER_SITES=	http://0pointer.de/lennart/projects/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound server for UNIX
LICENSE=	gpl2

LIB_DEPENDS=	samplerate.1:${PORTSDIR}/audio/libsamplerate \
		speexdsp.1:${PORTSDIR}/audio/speex \
		dbus-1.3:${PORTSDIR}/devel/dbus \
		gdbm.3:${PORTSDIR}/databases/gdbm \
		execinfo:${PORTSDIR}/devel/libexecinfo

USE_GNOME=	gnometarget gnomehack glib20 intltool ltverhack
USE_XORG=	x11 sm xtst ice
USE_LDCONFIG=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libltdl:22 libtool:22
USE_GMAKE=	yes
MAKE_JOBS_UNSAFE=yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}" \
		OPENSSL_CFLAGS="-I/usr/include" \
		OPENSSL_LIBS="-lcrypto -lssl" \
		LIBS="-lm -lintl"

CONFIGURE_ARGS=	--localstatedir=/var \
		--with-database=gdbm \
		--disable-lirc # untested
USERS=		pulse
GROUPS=		pulse pulse-access pulse-rt

OPTIONS=	JACK "JACK audio support" Off \
		AVAHI "Enable Avahi mDNS support" On \
		HAL "Enable HAL support" On \
		GCONF "Enable GConf support" On

PULSE_VERSION=	${PORTVERSION}
PLIST_SUB=	PULSE_VERSION=${PULSE_VERSION}

MAN1=		esdcompat.1 pabrowse.1 pacat.1 pacmd.1 pactl.1 padsp.1 \
		paplay.1 pasuspender.1 pax11publish.1 pulseaudio.1
MAN5=		default.pa.5 pulse-client.conf.5 pulse-daemon.conf.5

.include <bsd.port.pre.mk>

EXTRA_PATCHES+=${FILESDIR}/extra-patch-src_daemon_main.c \
               ${FILESDIR}/extra-patch-src_daemon_start-pulseaudio-x11.in \
               ${FILESDIR}/extra-patch-src_pulse_context.c

.if defined(WITH_JACK)
LIB_DEPENDS+=	jack.0:${PORTSDIR}/audio/jack
PLIST_SUB+=	JACK=""
.else
PLIST_SUB+=	JACK="@comment "
CONFIGURE_ARGS+=--disable-jack
.endif

.if !defined(WITHOUT_AVAHI)
LIB_DEPENDS+=	avahi-client.3:${PORTSDIR}/net/avahi-app
PLIST_SUB+=	AVAHI=""
.else
CONFIGURE_ARGS+=--disable-avahi
PLIST_SUB+=	AVAHI="@comment "
.endif

.if !defined(WITHOUT_HAL)
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
PLIST_SUB+=	HAL=""
.else
CONFIGURE_ARGS+=--disable-hal \
		--disable-polkit
PLIST_SUB+=	HAL="@comment "
.endif

.if !defined(WITHOUT_GCONF)
USE_GNOME+=	gconf2
PLIST_SUB+=	GCONF=""
.else
CONFIGURE_ARGS+=--disable-gconf
PLIST_SUB+=	GCONF="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/src/daemon/default.pa.in
.if ${OSVERSION} < 700042
	@${REINPLACE_CMD} -e 's|-Wl,-no-undefined||' \
	    	${WRKSRC}/src/Makefile.in
.endif
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
		${WRKSRC}/configure

post-install:
.for ii in default.pa daemon.conf client.conf system.pa
	${INSTALL_DATA} ${WRKSRC}/src/${ii} \
		${PREFIX}/etc/pulse/${ii}-dist
.endfor

.include <bsd.port.post.mk>
