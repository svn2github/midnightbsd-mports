# New ports collection makefile for:	x264
# Date created:		2005-01-11
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/multimedia/x264/Makefile,v 1.1 2008/08/24 22:15:36 laffer1 Exp $
# $FreeBSD: ports/multimedia/x264/Makefile,v 1.63 2008/06/06 14:33:38 edwin Exp $

PORTNAME=	x264
PORTVERSION=	0.0.20080409
CATEGORIES=	multimedia
MASTER_SITES=	http://downloads.videolan.org/pub/videolan/x264/snapshots/
DISTNAME=	${PORTNAME}-snapshot-${PORTVERSION:S/0.0.//}-2245

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Multimedia library and tool for encoding H.264/AVC video streams
LICENSE=	gpl2

BUILD_DEPENDS=	yasm>=0.6.0:${PORTSDIR}/devel/yasm

WANT_GNOME=	yes
USE_BZIP2=	yes
EXTRACT_AFTER_ARGS?=	| ${TAR} -xf - --exclude .svn
WRKSRC=		${WRKDIR}/${DISTNAME}
USE_GMAKE=	yes
ALL_TARGET=	default
USE_LDCONFIG=	yes
HAS_CONFIGURE=	yes

OPTIONS=	DEBUG "Enable Debugging" Off \
		OPTIMIZED_CFLAGS "Enable Optimized CFLAGS" Off

CONFIGURE_ARGS+=	--extra-cflags="${CPPFLAGS} ${CFLAGS} -fPIC -I${LOCALBASE}/include -I${LOCALBASE}/include" \
			--extra-ldflags="${LDFLAGS} -L${LOCALBASE}/lib -L${LOCALBASE}/lib" \
			--enable-shared 
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0 \
			--host=${ARCH}-portbld-freebsd6.0 \
			--target=${ARCH}-portbld-freebsd6.0

.include <bsd.port.pre.mk>

.if defined(WITH_GTK2) && ${SLAVE_PORT:L}=="yes"
LIB_DEPENDS+=	x264.50:${PORTSDIR}/multimedia/x264
BUILD_WRKSRC=	${WRKSRC}/gtk
INSTALL_WRKSRC=	${WRKSRC}/gtk
ALL_TARGET=	all
USE_GETTEXT=	yes
USE_GNOME=	gtk20
CONFIGURE_ARGS+=	--enable-gtk
.else
OPTIONS+=	GPAC "Enable MPEG-4 Output" On \
		X11_OUTPUT "Enable X11 Output" Off
.endif

.if ${ARCH}=="i386"
MAKE_ENV+=	ARCH_X86="1"
.endif

MAKE_ENV+=	ARCH=${ARCH}

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_OPTIMIZED_CFLAGS)
CFLAGS+=	-O2 -funroll-loops -ffast-math
.endif

.if !defined(WITHOUT_GPAC)
BUILD_DEPENDS+=		gpac-libgpac>=0.4.2.r2,1:${PORTSDIR}/multimedia/gpac-libgpac
LIB_DEPENDS+=		gpac.1:${PORTSDIR}/multimedia/gpac-libgpac
CONFIGURE_ARGS+=	--enable-mp4-output
.endif

.if defined(WITH_X11_OUTPUT)
CONFIGURE_ARGS+=	--enable-visualize
USE_XORG=	x11
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|; \
		s|-lpthread|${PTHREAD_LIBS}|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|$$(libdir)/pkgconfig|${PREFIX}/libdata/pkgconfig|; \
		s|$${libdir}/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/Makefile \
		${WRKSRC}/*/Makefile

.if ${SLAVE_PORT:L}=="no"
.if 0 # BROKEN
post-build:
	cd ${WRKSRC}/tools && ${MAKE} avc2avi

pre-install:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' \
		${WRKSRC}/x264.pc

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/tools/avc2avi ${PREFIX}/bin
.endif # BROKEN
.endif

.include <bsd.port.post.mk>
