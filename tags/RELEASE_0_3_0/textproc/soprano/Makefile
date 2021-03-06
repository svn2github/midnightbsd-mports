#
# $MidnightBSD: mports/textproc/soprano/Makefile,v 1.6 2010/12/24 20:22:52 laffer1 Exp $
#

PORTNAME=	soprano
PORTVERSION=	2.3.1
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/Soprano/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	QT4 RDF framework
LICENSE=	gpl2

LIB_DEPENDS=	clucene.0:${PORTSDIR}/textproc/clucene \
		raptor.3:${PORTSDIR}/textproc/raptor

OPTIONS=	REDLAND "Use Redland as storage backend" on \
		SESAME2 "Use Sesame2 as storage backend (requires Java)" off

USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib dbus qtestlib network \
		qmake_build moc_build uic_build rcc_build
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
USE_CMAKE=	yes

.include <bsd.port.pre.mk>

.if defined(WITH_REDLAND)
LIB_DEPENDS+=	rdf.0:${PORTSDIR}/textproc/redland
PLIST_SUB+=	REDLAND=""
.else
CMAKE_ARGS+=	-DSOPRANO_DISABLE_REDLAND_BACKEND=yes
PLIST_SUB+=	REDLAND="@comment "
.endif

.if defined(WITH_SESAME2)
CATEGORIES+=	java
CMAKE_ENV+=	JAVA_HOME=${JAVA_HOME}
USE_JAVA=	yes
JAVA_VERSION=	1.4+
JAVA_OS=	native
PLIST_SUB+=	SESAME2=""
.else
CMAKE_ARGS+=	-DSOPRANO_DISABLE_SESAME2_BACKEND=yes
PLIST_SUB+=	SESAME2="@comment "
.endif

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e "s,$${LIB_SUFFIX}/pkgconfig,data/pkgconfig," \
		${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e "s,soprano/cmake,cmake/Modules," \
		${WRKSRC}/cmake/modules/CMakeLists.txt

.include <bsd.port.post.mk>
