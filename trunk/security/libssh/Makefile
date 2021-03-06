# $MidnightBSD$

PORTNAME=	libssh
PORTVERSION=	0.5.2
PORTREVISION=	1
CATEGORIES=	security devel
MASTER_SITES=	http://www.libssh.org/files/0.5/ \
		FREEBSD_LOCAL/avl

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library implementing the SSH1 and SSH2 protocol
LICENSE=	lgpl

OPTIONS=	GCRYPT	"Build with libgcrypt"		off \
		SSH1	"Build with SSH1 support"	off

MAKE_JOBS_SAFE=	yes
USE_CMAKE=	yes
CMAKE_SOURCE_PATH=	${WRKSRC}
CONFIGURE_WRKSRC=	${CMAKE_SOURCE_PATH}/build
BUILD_WRKSRC=		${CONFIGURE_WRKSRC}
INSTALL_WRKSRC?=	${BUILD_WRKSRC}
CMAKE_ARGS+=	-DWITH_STATIC_LIB:BOOL=ON
USE_LDCONFIG=	yes

.include <bsd.mport.options.mk>

.if defined(WITH_GCRYPT)
LIB_DEPENDS+=	gcrypt:${PORTSDIR}/security/libgcrypt
CMAKE_ARGS+=	-DWITH_GCRYPT:BOOL=ON
.else
USE_OPENSSL=	yes
.endif

.if defined(WITH_SSH1)
CMAKE_ARGS+=	-DWITH_SSH1:BOOL=ON
PLIST_SUB+=	SSH1=""
.else
CMAKE_ARGS+=	-DWITH_SSH1:BOOL=OFF
PLIST_SUB+=	SSH1="@comment "
.endif

post-patch:
	@${MKDIR} ${BUILD_WRKSRC}
	@${RM} ${PATCH_WRKSRC}/cmake/Modules/UseDoxygen.cmake
	@${REINPLACE_CMD} -e '/add_subdirectory.*s)/d' \
		-e 's|LIB_INSTALL_DIR}|CMAKE_INSTALL_PREFIX}/libdata|' \
		${PATCH_WRKSRC}/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|ssh_static|ssh|' \
		${PATCH_WRKSRC}/src/CMakeLists.txt

.include <bsd.port.mk>
