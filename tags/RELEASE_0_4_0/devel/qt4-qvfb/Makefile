# $MidnightBSD: mports/devel/qt4-qvfb/Makefile,v 1.4 2011/08/17 12:28:33 laffer1 Exp $
# $FreeBSD: ports/devel/qt4-qvfb/Makefile,v 1.21 2010/12/02 19:47:10 makc Exp $

PORTNAME=	qvfb
DISTVERSION=	${QT4_VERSION}
CATEGORIES?=	devel
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt virtual framebuffer utility
LICENSE=	gpl3

USE_QT4=	qmake_build moc_build rcc_build uic_build corelib gui opengl
QT_NONSTANDARD=	yes
QT_DIST=	yes
USE_XORG=	xtst
MAKE_JOBS_SAFE=	yes

HAS_CONFIGURE=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib:$$LD_LIBRARY_PATH \
		PATH=${WRKSRC}/bin:$$PATH

DESKTOP_ENTRIES="Qt Virtual Framebuffer" "${COMMENT}" \
		"${PREFIX}/share/pixmaps/qvfb-qt4.png" \
		"${PREFIX}/bin/qvfb-qt4" "Development;Qt;" true

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake translations \
		src/activeqt src/dbus src/multimedia src/network src/opengl \
		src/openvg src/phonon src/qt3support src/s60installs \
		src/s60main src/script src/scripttools src/sql src/svg \
		src/testlib src/tools src/winmain src/xml src/xmlpatterns \
		src/3rdparty/clucene src/3rdparty/freetype \
		src/3rdparty/libjpeg src/3rdparty/libmng src/3rdparty/libpng \
		src/3rdparty/libtiff src/3rdparty/phonon src/3rdparty/webkit
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

BUILD_WRKSRC=	${WRKSRC}/tools/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

CONFIGURE_ARGS+=	-I../../include/Qt -I../../include

EXTRA_PATCHES=	${.CURDIR}/../../devel/qt4/files/patch-configure

pre-configure:
	${MKDIR} ${WRKSRC}/mkspecs
	${REINPLACE_CMD} -e 's|^TARGET.*|TARGET=qvfb-qt4|g' \
		${BUILD_WRKSRC}/qvfb.pro
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/bin/moc
	${LN} -sf ${LOCALBASE}/bin/uic-qt4 ${WRKSRC}/bin/uic
	${LN} -sf ${LOCALBASE}/bin/rcc ${WRKSRC}/bin/rcc

post-install:
	${INSTALL_DATA} ${BUILD_WRKSRC}/images/logo.png \
		${PREFIX}/share/pixmaps/qvfb-qt4.png

.include <bsd.port.mk>
