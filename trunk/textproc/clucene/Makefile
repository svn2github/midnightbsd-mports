# $MidnightBSD$

PORTNAME=	clucene
PORTVERSION=	2.3.3.4
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-core-unstable/2.3
DISTNAME=	${PORTNAME}-core-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CLucene is a C++ port of Lucene
LICENSE=	apache2

BUILD_DEPENDS=	${LOCALBASE}/lib/libboost_regex.a:${PORTSDIR}/devel/boost-libs

USE_CMAKE=	yes
USE_ICONV=	yes
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DBUILD_CONTRIBS_LIB=ON
CXXFLAGS+=	-D__LONG_LONG_SUPPORTED

post-patch:
	@${REINPLACE_CMD} -e 's|%%DATADIR%%|${DATADIR_REL}|' \
	    ${WRKSRC}/src/core/CMakeLists.txt

.include <bsd.port.mk>
