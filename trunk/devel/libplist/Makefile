# $MidnightBSD$

PORTNAME=	libplist
PORTVERSION=	1.10
PORTREVISION?=	1
CATEGORIES?=	devel
MASTER_SITES=	http://www.libimobiledevice.org/downloads/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Library to handle Apple Property List format
LICENSE?=	lgpl2.1

SLAVE_PORT?=	no

USES=		cmake pkgconfig tar:bzip2

.if ${SLAVE_PORT} == "no"

USE_GNOME=	libxml2
CMAKE_ARGS=	-DENABLE_CYTHON:BOOL=False \
		-DENABLE_SWIG:BOOL=False
MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	${LOCALBASE}/lib

PORTDOCS=	AUTHORS NEWS README

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-patch:
# Required for iconv headers (included by libxml2). Do not add to
# CFLAGS as it may break updates from old versions.
	@${REINPLACE_CMD} -e 's,$${LIBXML2_INCLUDE_DIR},$${LIBXML2_INCLUDE_DIR} ${LOCALBASE}/include,' \
		${WRKSRC}/src/CMakeLists.txt
	@${REINPLACE_CMD} -e 's,$${CMAKE_INSTALL_LIBDIR}/pkgconfig,libdata/pkgconfig,' \
		${WRKSRC}/CMakeLists.txt

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}

.endif # ${SLAVE_PORT} == "no"

.include <bsd.port.mk>
