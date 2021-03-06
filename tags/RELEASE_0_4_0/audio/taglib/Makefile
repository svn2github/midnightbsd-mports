# $MidnightBSD: mports/audio/taglib/Makefile,v 1.6 2011/02/02 20:03:23 laffer1 Exp $

PORTNAME=	taglib
PORTVERSION=	1.7
CATEGORIES=	audio
MASTER_SITES=	http://developer.kde.org/~wheeler/files/src/ \
		http://cloud.github.com/downloads/taglib/taglib/ \
		http://launchpad.net/taglib/trunk/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating ID3 tags and Ogg comments
LICENSE=	lgpl

USE_CMAKE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

CMAKE_ARGS=	-DWITH_ASF:BOOL=ON \
		-DWITH_MP4:BOOL=ON

OPTIONS=	RCC "Build with RusXMMS librcc patches (experimental)" off

.include <bsd.mport.options.mk>

.if defined(WITH_RCC)
PKGNAMESUFFIX=	-rcc
EXTRA_PATCHES+=	${FILESDIR}/extrapatch-rcc
LIB_DEPENDS+=	rcc.2:${PORTSDIR}/devel/librcc
PLIST_SUB+=	RCC=""
.else
PLIST_SUB+=	RCC="@comment "
.endif

post-patch:
.if defined(WITH_RCC)
	@${REINPLACE_CMD} -e 's|-ltag|-ltag -lrcc|g' \
		${WRKSRC}/taglib.pc.cmake ${WRKSRC}/taglib-config.cmake \
		${WRKSRC}/bindings/c/taglib_c.pc.cmake
.endif
	${REINPLACE_CMD} -e 's|$${LIB_INSTALL_DIR}/pkgconfig|libdata/pkgconfig|' \
		${WRKSRC}/CMakeLists.txt ${WRKSRC}/bindings/c/CMakeLists.txt

.include <bsd.port.mk>
