# $MidnightBSD$

PORTNAME=	soprano
PORTVERSION=	2.9.4
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/Soprano/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	QT4 RDF framework

LICENSE=	gpl2

LIB_DEPENDS=	raptor2:${PORTSDIR}/textproc/raptor2 \
		rdf:${PORTSDIR}/textproc/redland \
		iodbc:${PORTSDIR}/databases/libiodbc

USE_QT4=	corelib dbus network qtestlib_build xml \
		qmake_build moc_build uic_build rcc_build

USES=		cmake pkgconfig tar:bzip2
CMAKE_ARGS+=	-DSOPRANO_DISABLE_CLUCENE_INDEX=yes \
		-DSOPRANO_DISABLE_SESAME2_BACKEND=yes
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e "s,$${LIB_SUFFIX}/pkgconfig,data/pkgconfig," \
		${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e "s,soprano/cmake,cmake/Modules," \
		${WRKSRC}/cmake/modules/CMakeLists.txt

.include <bsd.port.post.mk>
