# New ports collection makefile for:    libxine
# Date created:         14 Oct 2000
# Whom:                 alex
#
# $FreeBSD: ports/multimedia/libxine/Makefile,v 1.127 2008/04/08 09:38:56 mich Exp $
# $MidnightBSD: mports/multimedia/libxine/Makefile,v 1.13 2008/08/17 16:21:58 laffer1 Exp $
#

PORTNAME=	xine
PORTVERSION=	1.1.15
CATEGORIES=	multimedia ipv6
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	lib
DISTNAME=	${PORTNAME}-lib-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for xine multimedia player
LICENSE=	gpl2

LIB_DEPENDS=	FLAC.7:${PORTSDIR}/audio/flac \
		vorbis.4:${PORTSDIR}/audio/libvorbis \
		speex.1:${PORTSDIR}/audio/speex \
		mng.1:${PORTSDIR}/graphics/libmng \
		png.5:${PORTSDIR}/graphics/png \
		dvdread.5:${PORTSDIR}/multimedia/libdvdread \
		freetype.9:${PORTSDIR}/print/freetype2 \
		fame-0.9.1:${PORTSDIR}/multimedia/libfame \
		cdio.8:${PORTSDIR}/sysutils/libcdio \
		modplug.0:${PORTSDIR}/audio/libmodplug \
		vcdinfo.2:${PORTSDIR}/multimedia/vcdimager \
		theora.0:${PORTSDIR}/multimedia/libtheora \
		mad.2:${PORTSDIR}/audio/libmad \
		dca.0:${PORTSDIR}/multimedia/libdca

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
WANT_GNOME=	yes
USE_GNOME=	gnomehack gnometarget
USE_GMAKE=	yes
USE_XORG=	x11 xv xinerama
USE_GL=		gl glu
USE_SDL=	sdl
USE_LDCONFIG=	yes
# built in libtool is very old and doesn't work with fake.
USE_AUTOTOOLS=	libtool:15

CONFIGURE_ENV=	CFLAGS="${CFLAGS} -fno-force-addr -I${LOCALBASE}/include -I${LOCALBASE}/include/dvdread -I${X11BASE}/include" \
		CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib" \
		THREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		THREAD_LIBS="${PTHREAD_LIBS}" \
		EXTRA_X_LIBS="-lGL -lGLU -lXext -lX11 -lm"
CONFIGURE_ARGS=	--with-w32-path=${LOCALBASE}/lib/win32 --enable-ipv6 \
		--with-external-libmad \
		--with-external-libdts --with-libflac --disable-v4l



OPTIONS=	ARTS 		"Enable aRts support" off \
		CACA 		"Enable libcaca support" off \
		ESOUND 		"Enable EsounD support" off \
		JACK 		"Enable JACK support" off \
		GNOMEVFS2 	"Enable GnomeVFS2 support" off \
		PULSEAUDIO 	"Enable PulseAudio support" off \
		XVMC 		"Enable XvMC support" off \
		SMB 		"Enable SMB protocol support" off \
		AALIB 		"Enable aalib support" off \
		IMAGEMAGICK 	"Enable ImageMagick support" off \
		GTK2 		"Enable gdkpixbuf support" off \
		WAVPACK 	"Enable WavPack support" on

MAN1=	xine-config.1 xine-list-1.1.1
MAN5=	xine.5

DOCSDIR=	${PREFIX}/share/doc/xine-lib
PLIST_SUB=	PLUGINSDIR="lib/xine/plugins/1.24"

.include <bsd.port.pre.mk>

.if defined(WITH_ARTS)
LIB_DEPENDS+=	artsc.0:${PORTSDIR}/audio/arts
PLIST_SUB+=	WITH_ARTS=""
CONFIGURE_ARGS+=	--with-arts --enable-artstest
.else
PLIST_SUB+=	WITH_ARTS="@comment "
CONFIGURE_ARGS+=	--disable-arts --disable-artstest
.endif

.if defined(WITH_CACA)
LIB_DEPENDS+=	caca.0:${PORTSDIR}/graphics/libcaca
PLIST_SUB+=	WITH_CACA=""
.else
PLIST_SUB+=	WITH_CACA="@comment "
CONFIGURE_ARGS+=	--without-caca --disable-cacatest
.endif

.if defined(WITH_ESOUND)
USE_GNOME+=	esound
PLIST_SUB+=	WITH_ESOUND=""
.else
PLIST_SUB+=	WITH_ESOUND="@comment "
CONFIGURE_ARGS+=	--without-esound
.endif

.if defined(WITH_JACK)
LIB_DEPENDS+=	jack:${PORTSDIR}/audio/jack
PLIST_SUB+=	WITH_JACK=""
.else
PLIST_SUB+=	WITH_JACK="@comment "
CONFIGURE_ARGS+=	--without-jack
.endif

.if defined(WITH_GNOMEVFS2)
USE_GNOME+=	gnomevfs2
PLIST_SUB+=	WITH_GNOMEVFS2=""
.else
PLIST_SUB+=	WITH_GNOMEVFS2="@comment "
CONFIGURE_ARGS+=	--disable-gnomevfs
.endif

.if defined(WITH_PULSEAUDIO)
LIB_DEPENDS+=	pulse.0:${PORTSDIR}/audio/pulseaudio
PLIST_SUB+=	WITH_PULSEAUDIO=""
.else
PLIST_SUB+=	WITH_PULSEAUDIO="@comment "
CONFIGURE_ARGS+=	--without-pulseaudio
.endif

.if defined(WITH_XVMC)
.if defined(WITH_NVIDIA_GL) || exists(${X11BASE}/lib/libXvMCNVIDIA.so.1)
CONFIGURE_ARGS+=	--with-xvmc-lib=XvMCNVIDIA
LIB_DEPENDS+=	XvMCNVIDIA.1:${PORTSDIR}/x11/nvidia-driver
.else
CONFIGURE_ARGS+=	--with-xvmc-lib=XvMCW
LIB_DEPENDS+=	XvMC.1:${PORTSDIR}/x11/libXvMC
.endif
PLIST_SUB+=	WITH_XVMC=""
.else
CONFIGURE_ARGS+=	--disable-xvmc
PLIST_SUB+=	WITH_XVMC="@comment "
.endif

.if defined(WITH_SMB)
LIB_DEPENDS+=	smbclient.0:${PORTSDIR}/net/samba-libsmbclient
PLIST_SUB+=	WITH_SMB=""
.else
PLIST_SUB+=	WITH_SMB="@comment "
CONFIGURE_ARGS+=	--disable-samba
.endif

.if defined(WITH_AALIB)
LIB_DEPENDS+=	aa.1:${PORTSDIR}/graphics/aalib
PLIST_SUB+=	WITH_AALIB=""
.else
PLIST_SUB+=	WITH_AALIB="@comment "
CONFIGURE_ARGS+=	--disable-aalib --disable-aalibtest
.endif

.if defined(WITH_IMAGEMAGICK)
LIB_DEPENDS+=	MagickWand.1:${PORTSDIR}/graphics/ImageMagick
PLIST_SUB+=	WITH_IMAGEMAGICK=""
.else
PLIST_SUB+=	WITH_IMAGEMAGICK="@comment "
CONFIGURE_ARGS+=	--without-imagemagick
.endif

.if defined(WITH_GTK2)
USE_GNOME+=	gtk20
PLIST_SUB+=	WITH_GTK2=""
.else
PLIST_SUB+=	WITH_GTK2="@comment "
CONFIGURE_ARGS+=	--disable-gdkpixbuf
.endif

.if defined(WITH_WAVPACK)
LIB_DEPENDS+=	wavpack.1:${PORTSDIR}/audio/wavpack
PLIST_SUB+=	WITH_WAVPACK=""
CONFIGURE_ARGS+=	--with-wavpack
.else
PLIST_SUB+=	WITH_WAVPACK="@comment "
CONFIGURE_ARGS+=	--without-wavpack
.endif

.if ${CONFIGURE_ARGS:M*--without-imagemagick*} == "" || ${CONFIGURE_ARGS:M*-disable-gdkpixbuf*} == ""
PLIST_SUB+=	WITH_DMX_IMAGE=""
.else
PLIST_SUB+=	WITH_DMX_IMAGE="@comment "
.endif

.if ${ARCH} == "i386"
PLIST_SUB+=	WITH_VIDIX=""
.else
PLIST_SUB+=	WITH_VIDIX="@comment "
CONFIGURE_ARGS+=	--disable-vidix
.endif

post-patch:
.for f in libtool ltmain.sh
	@${REINPLACE_CMD} -e \
		'/freebsd-elf)/,/;;/ s|major="\.$$current"|major=.`expr $$current - $$age`|; \
		/freebsd-elf)/,/;;/ s|versuffix="\.$$current"|versuffix="$$major"|' \
		${WRKSRC}/${f}
.endfor

pre-configure:
	@${REINPLACE_CMD} -e \
		's|THREAD_LIBS=".*"|THREAD_LIBS="\$$THREAD_LIBS"|g ; \
		 s|THREAD_CFLAGS=".*"|THREAD_CFLAGS="\$$THREAD_CFLAGS"|g ; \
		 s|-L/usr/local/lib||g ; \
		 s|-I/usr/local/include||g ; \
		 s|-lgiconv|-liconv|g ; \
		 s|-funroll-loops||g ; \
		 s|LIBFFMPEG_CFLAGS|LIBFFMPEG_CPPFLAGS|g ; \
		 s|echo aout|echo elf|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		 's|-malign-loops|-falign-loops|g ; \
		  s|-malign-jumps|-falign-jumps|g ; \
		  s|-malign-functions|-falign-functions|g' ${WRKSRC}/configure

pre-build:
	@${CP} -p ${LOCALBASE}/include/dts.h ${WRKSRC}/src/libdts/

.include <bsd.port.post.mk>
