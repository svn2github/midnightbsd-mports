# $MidnightBSD$ 

PORTNAME=	chromium
DISTVERSIONPREFIX=	courgette-redacted-
DISTVERSION=	23.0.1271.97
CATEGORIES=	www
MASTER_SITES=	http://download.goodking.org/downloads/ \
		ftp://rene-ladan.nl/pub/distfiles/ \
		http://files.etoilebsd.net/goodking/ \
		http://distfiles.cybertron.gr/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A mostly BSD-licensed web browser based on WebKit and Gtk+
LICENSE=	agg
# lgpl, mit, bsd

CFLAGS+=	-Wno-error

BUILD_DEPENDS=	${LOCALBASE}/bin/gperf:${PORTSDIR}/devel/gperf \
		bash:${PORTSDIR}/shells/bash \
		yasm:${PORTSDIR}/devel/yasm \
		flock:${PORTSDIR}/sysutils/flock \
		v4l_compat>=1.0.20110603:${PORTSDIR}/multimedia/v4l_compat

LIB_DEPENDS=	execinfo:${PORTSDIR}/devel/libexecinfo \
		cairo:${PORTSDIR}/graphics/cairo \
		dbus-1:${PORTSDIR}/devel/dbus \
		dbus-glib-1:${PORTSDIR}/devel/dbus-glib \
		asound:${PORTSDIR}/audio/alsa-lib \
		freetype:${PORTSDIR}/print/freetype2 \
		nss3:${PORTSDIR}/security/nss \
		gnome-keyring:${PORTSDIR}/security/libgnome-keyring \
		cups:${PORTSDIR}/print/cups-client \
		event-1:${PORTSDIR}/devel/libevent \
		gcrypt:${PORTSDIR}/security/libgcrypt

RUN_DEPENDS=	${LOCALBASE}/lib/alsa-lib/libasound_module_pcm_oss.so:${PORTSDIR}/audio/alsa-plugins \
		${LOCALBASE}/lib/X11/fonts/Droid/fonts.dir:${PORTSDIR}/x11-fonts/droid-fonts-ttf

ONLY_FOR_ARCHS=	i386 amd64
USE_XZ=		yes
USE_BISON=	build
USE_GMAKE=	yes
USE_PERL5_BUILD=	yes
USE_PYTHON_BUILD=	2.6+
USE_XORG=	scrnsaverproto x11 xproto xscrnsaver xtst
USE_GNOME=	glib20 gtk20 dconf libxslt
USE_PKGCONFIG=	build
MAN1=		chrome.1

DESKTOP_ENTRIES="Chromium" "${COMMENT}" "${DATADIR}/product_logo_48.png" \
		"chrome" "Application;Network;WebBrowser;" true

ALL_TARGET=	chrome

# See build/common.gypi for all the available variables.
GYP_DEFINES+=	use_cups=1 \
		use_system_yasm=1 \
		use_system_libxml=1 \
		use_system_ffmpeg=0 \
		use_system_libusb=1 \
		use_system_libevent=1 \
		linux_strip_binary=1 \
		linux_use_tcmalloc=0 \
		linux_use_heapchecker=0 \
		clang_use_chrome_plugins=0 \
		disable_nacl=1 \
		enable_webrtc=0 \
		enable_openmax=1 \
		enable_one_click_signin=1 \
		os_ver=900100 \
		os=freebsd \
		prefix_dir=${LOCALBASE} \
		python_ver=${PYTHON_VER} \
		OS=freebsd

OPTIONS_DEFINE=	CODECS GCONF PULSEAUDIO CLANG DEBUG

CODECS_DESC=	Compile and enable patented codecs like H.264
CLANG_DESC=	Build Chromium with Clang instead of GCC 4.6+

OPTIONS_DEFAULT=	CODECS GCONF

.include <bsd.mport.options.mk>

#.if ${OSVERSION} < 900033 || ! ${PORT_OPTIONS:MCLANG}
#BUILD_DEPENDS+=	${LOCALBASE}/bin/as:${PORTSDIR}/devel/binutils
#CONFIGURE_ENV+=	COMPILER_PATH=${LOCALBASE}/bin
#MAKE_ENV+=	COMPILER_PATH=${LOCALBASE}/bin
#.endif

#.if ${PORT_OPTIONS:MCODECS}
#GYP_DEFINES+=	ffmpeg_branding=Chrome
#GYP_DEFINES+=	proprietary_codecs=1
#.else
GYP_DEFINES+=	ffmpeg_branding=Chromium
GYP_DEFINES+=	proprietary_codecs=0
#.endif

#.if ${PORT_OPTIONS:MGCONF}
#USE_GNOME+=	gconf2
#.else
GYP_DEFINES+=	use_gconf=0
#.endif

#.if ${PORT_OPTIONS:MPULSEAUDIO}
#LIB_DEPENDS+=	pulse:${PORTSDIR}/audio/pulseaudio
#GYP_DEFINES+=	use_pulseaudio=1
#.else
GYP_DEFINES+=	use_pulseaudio=0
#.endif

#.if ! ${MACHINE_CPU:Msse2}
GYP_DEFINES+=	disable_sse2=1
#.endif

.if ${OSVERSION} < 4014
IGNORE=	requires libusb 2 API, which is not available
BUILD_DEPENDS+=	clang:${PORTSDIR}/lang/clang
.endif
CC=		clang
CXX=		clang++
GYP_DEFINES+=	clang=1

BUILDTYPE=	Release

MAKE_ENV+=	BUILDTYPE=${BUILDTYPE} \
		GPERF=${LOCALBASE}/bin/gperf
CONFIGURE_ENV+=	LD=${CC}
MAKE_JOBS_SAFE=	yes

.include <bsd.port.pre.mk>

pre-everything::
	@${ECHO_MSG} "To build Chromium, you should have around 1 GB of memory"
	@${ECHO_MSG} "and a fair amount of free diskspace (~ 2.2GB)."

post-patch:
	@${REINPLACE_CMD} -e "s|/usr/local|${LOCALBASE}|" \
		${WRKSRC}/base/base.gypi \
		${WRKSRC}/build/common.gypi \
		${WRKSRC}/third_party/libvpx/libvpx.gyp \
		${WRKSRC}/third_party/WebKit/Source/WebCore/plugins/PluginDatabase.cpp \
		${WRKSRC}/crypto/crypto.gyp \
		${WRKSRC}/v8/tools/gyp/v8.gyp \
		${WRKSRC}/v8/build/common.gypi
	@${REINPLACE_CMD} -e "s|linux|freebsd|" \
		${WRKSRC}/tools/gyp/pylib/gyp/generator/make.py

do-configure:
	cd ${WRKSRC} && \
		GYP_DEFINES="${GYP_DEFINES}" ${PYTHON_CMD} \
			./build/gyp_chromium chrome/chrome.gyp --depth .

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_MAN} ${WRKSRC}/out/${BUILDTYPE}/chrome.1 ${MANPREFIX}/man/man1
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/product_logo_48.png ${DATADIR}
	${INSTALL_SCRIPT} ${WRKSRC}/out/${BUILDTYPE}/chrome-wrapper \
		${WRKSRC}/out/${BUILDTYPE}/xdg-settings ${DATADIR}
.for p in chrome chrome_100_percent content_resources resources
	${INSTALL_DATA} ${WRKSRC}/out/${BUILDTYPE}/${p}.pak ${DATADIR}
.endfor
.for f in chrome libffmpegsumo.so mksnapshot protoc
	${INSTALL_PROGRAM} ${WRKSRC}/out/${BUILDTYPE}/${f} ${DATADIR}
.endfor
	cd ${WRKSRC}/out/${BUILDTYPE} && \
		${COPYTREE_SHARE} "locales resources" ${DATADIR}
	${LN} -sf ${DATADIR}/chrome ${PREFIX}/bin

.include <bsd.port.post.mk>
