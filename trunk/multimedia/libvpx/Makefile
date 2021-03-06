# $MidnightBSD$

PORTNAME=	libvpx
PORTVERSION=	1.1.0
CATEGORIES=	multimedia
MASTER_SITES=	GOOGLE_CODE
DISTNAME=	${PORTNAME}-v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VP8 Codec SDK
LICENSE=	bsd3

BUILD_DEPENDS=	${LOCALBASE}/bin/bash:${PORTSDIR}/shells/bash \
		${LOCALBASE}/bin/yasm:${PORTSDIR}/devel/yasm

USE_BZIP2=	yes
PROJECTHOST=	webm
HAS_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PERL5_BUILD=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=yes

OPTIONS=	DEBUG	"Enable debugging"	OFF \
		POSTPROC	"Enable postprocessing"	ON \
		RUNTIME	"Enable runtime CPU detection"	ON \
		THREADS	"Enable multithread"	ON \
		SHARED	"Enable shared-library support"	ON

ALL_TARGET=
CONFIGURE_ARGS+=	--enable-pic --disable-install-srcs --enable-vp8 --disable-install-docs
MAKE_ARGS+=	DIST_DIR=${FAKE_DESTDIR}${PREFIX} verbose=yes

.include <bsd.mport.options.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_POSTPROC)
CONFIGURE_ARGS+=	--enable-postproc
.endif

.if defined(WITH_RUNTIME)
CONFIGURE_ARGS+=	--enable-runtime-cpu-detect
.endif

.if defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--disable-multithread
.endif

.if defined(WITH_SHARED)
CONFIGURE_ARGS+=	--enable-shared
PLIST_SUB+=	SHARED=""
.else
PLIST_SUB+=	SHARED="@comment "
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CONFIGURE_ARGS+=	--target=x86_64-linux-gcc
.elif ${ARCH} == "i386"
CONFIGURE_ARGS+=	--target=x86-linux-gcc
.elif ${ARCH} == "ia64"
CONFIGURE_ARGS+=	--target=ia64-linux-gcc
.else
IGNORE=	no support for ${ARCH} the moment. testing/patches are welcome
.endif

post-patch:
	@${GREP} -Rl '^#!/bin/bash' ${WRKSRC} |${XARGS} ${REINPLACE_CMD} \
		-e 's,#!/bin/bash,#!${LOCALBASE}/bin/bash,g'
.if ${OSVERSION} < 700000
	@${GREP} -Rl 'LIBVPX_SO.*extralibs' ${WRKSRC} |${XARGS} ${REINPLACE_CMD} \
		-e 's/\(LIBVPX_SO.*extralibs[[:space:]]*+=[[:space:]]*\)/\1-lc /g'
.else
	@${GREP} -Rl -- '-l\?pthread' ${WRKSRC} |${XARGS} ${REINPLACE_CMD} -E \
		-e 's/-l?pthread/${PTHREAD_LIBS}/g'
.endif

.include <bsd.port.post.mk>
