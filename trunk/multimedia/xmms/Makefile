# $MidnightBSD$
# $FreeBSD: ports/multimedia/xmms/Makefile,v 1.81 2006/04/15 21:47:42 arved Exp $

PORTNAME=	xmms
PORTVERSION=	1.2.11
PORTREVISION=	1
CATEGORIES+=	multimedia audio ipv6
# http://www.xmms.org/files/1.2.x/
MASTER_SITES=	ftp://ftp.swin.edu.au/slackware/slackware-10.0/source/xap/xmms/ \
		http://legacy.xmms2.org/ \
		FREEBSD_LOCAL/beech
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	X Multimedia System --- Audio player with a Winamp GUI

LICENSE=        gpl2

USES=		desktop-file-utils gmake iconv libtool pathfix tar:bzip2
USE_XLIB=	yes
USE_GNOME=	gtk12
WANT_GNOME=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib" \
		INPUT_PLUGINS="${INPUT_PLUGINS}" \
		OUTPUT_PLUGINS="${OUTPUT_PLUGINS}" \
		VISUALIZATION_PLUGINS="${VISUALIZATION_PLUGINS}"

INPUT_PLUGINS=	cdaudio,mpg123,tonegen,wav
OUTPUT_PLUGINS=	OSS,disk_writer
VISUALIZATION_PLUGINS=	blur_scope,sanalyzer

PLIST_SUB=	DATADIR="share"

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=	--enable-ipv6

.if defined(WITH_ENCODING_PATCH) || defined(WITH_ID3V2_PATCH)
ENC_PATCHLEVEL=	28.1
DISTFILES+=	${PORTNAME}-${PORTVERSION}-recode-csa${ENC_PATCHLEVEL}${EXTRACT_SUFX}:enc
MASTER_SITES+=	${MASTER_SITE_SOURCEFORGE:S/$/:enc/}
MASTER_SITE_SUBDIR+=	rusxmms/:enc
.endif

.if defined(WITH_ENCODING_PATCH)
PLIST_SUB+=	ENCODING=""
.else
PLIST_SUB+=	ENCODING="@comment "
.endif

.if defined(WITH_EXTENDED_VORBIS_FILEINFO)
CFLAGS+=	-DALL_VORBIS_TAGS
.endif

.if !defined(WITHOUT_MIKMOD)
LIB_DEPENDS+=	mikmod.2:${PORTSDIR}/audio/libmikmod
INPUT_PLUGINS+=	mikmod
PLIST_SUB+=	MIKMODPLUGIN:=""
.else
CONFIGURE_ARGS+=	--disable-mikmod
PLIST_SUB+=	MIKMODPLUGIN:="@comment "
.endif

.if !defined(WITHOUT_VORBIS)
LIB_DEPENDS+=	vorbis.4:${PORTSDIR}/audio/libvorbis
INPUT_PLUGINS+=	vorbis
PLIST_SUB+=	VORBISPLUGIN:=""
.else
CONFIGURE_ARGS+=	--disable-vorbis
PLIST_SUB+=	VORBISPLUGIN:="@comment "
.endif

.if ${HAVE_GNOME:Mesound}!=""
USE_GNOME+=	esound
OUTPUT_PLUGINS+=	esd
PLIST_SUB+=	ESDPLUGIN:=""
.if defined(PKGNAMESUFFIX)
PKGNAMESUFFIX:=	${PKGNAMESUFFIX}-esound
.else
PKGNAMESUFFIX=	-esound
.endif
.else
CONFIGURE_ARGS+=	--disable-esd
PLIST_SUB+=	ESDPLUGIN:="@comment "
.endif

.if ${ARCH} != "i386"
WITHOUT_SIMD=	yes
.endif

.if !defined(WITHOUT_SIMD)
CONFIGURE_ARGS+=	--enable-simd
.endif

.if defined(WITHOUT_SIMD)
post-extract:
	(cd ${WRKSRC}/Input/mpg123 && ${MV} decode_i586.s decode_i586.S && \
	  cd ${WRKSRC}/Visualization/blur_scope && ${MV} blur_8.s blur_8.S);
	${REINPLACE_CMD} -e 's:\.s :.S :g' -e 's:\.s$$:.S:g' \
	  -e 's:^\.s\.:.S.:g' ${WRKSRC}/Input/mpg123/Makefile.in
	${REINPLACE_CMD} -e 's:\.s :.S :g' -e 's:\.s$$:.S:g' \
	  -e 's:^\.s\.:.S.:g' ${WRKSRC}/Visualization/blur_scope/Makefile.in
.endif

pre-extract:
.if !defined(WITHOUT_MIKMOD) || !defined(WITHOUT_VORBIS) || ( !defined(WITHOUT_SIMD) || ${HAVE_GNOME:Mesound}!=""
	@${ECHO_MSG}
.if !defined(WITHOUT_MIKMOD)
	@${ECHO_MSG} "You can disable support for mikmod by defining WITHOUT_MIKMOD."
.endif
.if !defined(WITHOUT_VORBIS)
	@${ECHO_MSG} "You can disable support for vorbis by defining WITHOUT_VORBIS."
.endif
.if !defined(WITHOUT_SIMD)
	@${ECHO_MSG} "You can disable x86 SIMD (3DNow!/MMX) optimized decoding routines by defining WITHOUT_SIMD."
.endif
.if ${HAVE_GNOME:Mesound}!=""
	@${ECHO_MSG} "You can disable support for esound by defining WITHOUT_GNOME=esound."
.endif
	@${ECHO_MSG}
.endif

post-patch:
.if defined(WITH_ID3V2_PATCH)
	@${PATCH} -s -p1 -d ${WRKSRC} < ${WRKDIR}/recode.3rdparty/id3v2.patch
.endif
.if defined(WITH_ENCODING_PATCH) && defined(WITH_ID3V2_PATCH)
	@${PATCH} -s -p1 -d ${WRKSRC} < ${WRKDIR}/xmms_id3v2-ds-recode.patch
.elif defined(WITH_ENCODING_PATCH)
	@${PATCH} -s -p1 -d ${WRKSRC} < ${WRKDIR}/xmms-ds-recode.patch
.endif
	@${FIND} ${WRKSRC} -name "Makefile.in*" | ${XARGS} ${REINPLACE_CMD} -e \
		 's|\(datadir\)/aclocal|(prefix)/share/aclocal|g'
	@${REINPLACE_CMD} -e 's|{datadir}/locale|{prefix}/share/locale|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's,-pthread,${PTHREAD_LIBS},g' \
		${WRKSRC}/configure

post-install:
	@${MKDIR} ${PREFIX}/share/xmms/Skins
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
