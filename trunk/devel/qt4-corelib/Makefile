# $MidnightBSD$

PORTNAME=	corelib
DISTVERSION=	${QT4_VERSION}
CATEGORIES?=	devel
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt core library

LICENSE=	gpl3

LIB_DEPENDS=	icui18n:${PORTSDIR}/devel/icu

USES=		pkgconfig
USE_GNOME=	glib20
USE_QT4=	qmake_build moc_build
QT_NONSTANDARD=	yes
QT_DIST=	yes

HAS_CONFIGURE=	yes
USE_LDCONFIG=	${PREFIX}/lib/qt4

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib:$$LD_LIBRARY_PATH \
		PATH=${WRKSRC}/bin:$$PATH INSTALL_ROOT=${FAKE_DESTDIR}
FAKE_MAKEENV+= INSTALL_ROOT=${FAKE_DESTDIR}

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake tools translations \
		src/activeqt src/dbus src/gui src/multimedia src/network \
		src/opengl src/openvg src/phonon src/qt3support \
		src/s60installs src/s60main src/script src/scripttools src/sql \
		src/svg src/testlib src/tools src/winmain src/xml \
		src/xmlpatterns src/3rdparty/clucene src/3rdparty/freetype \
		src/3rdparty/libjpeg src/3rdparty/libmng src/3rdparty/libpng \
		src/3rdparty/libtiff src/3rdparty/phonon src/3rdparty/webkit
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

.include "${.CURDIR}/../../devel/qt4/files/Makefile.options"

.if empty(QT4_OPTIONS:MCUPS)
CONFIGURE_ARGS+=	-no-cups
.endif

.if empty(QT4_OPTIONS:MNAS)
CONFIGURE_ARGS+=	-no-nas-sound
.endif

.if empty(QT4_OPTIONS:MQGTKSTYLE)
CONFIGURE_ARGS+=	-no-gtkstyle
.endif

post-patch:
	${REINPLACE_CMD} -e '${QT4_OPTIONS_REPLACE}' ${WRKSRC}/configure

pre-configure:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/qt4/mkspecs/
	${MKDIR} ${WRKSRC}/mkspecs
	${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/bin
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/bin/moc
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${FAKE_DESTDIR}${LOCALBASE}/bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${FAKE_DESTDIR}${LOCALBASE}/bin/moc
	${LN} -sf ${LOCALBASE}/share/qt4/mkspecs/freebsd-g++ ${FAKE_DESTDIR}${LOCALBASE}/share/qt4/mkspecs/freebsd-g++

post-configure:
	${REINPLACE_CMD} -e 's|${PREFIX}/lib/qt4/pkgconfig|${PREFIX}/libdata/pkgconfig|g' \
		-e 's|.*$$(QMAKE).*||g' \
		${BUILD_WRKSRC}/Makefile
	${REINPLACE_CMD} -E -e 's|-L.[^[:space:]]*qt-x11-opensource.[^[:space:]]*lib||g' \
		-E -e 's|(.*location=).*moc|\1${PREFIX}/bin/moc-qt4|g' \
		-E -e 's|(.*location=).*uic|\1${PREFIX}/bin/uic-qt4|g' \
		${WRKSRC}/lib/pkgconfig/QtCore.pc

post-install:
	${MKDIR} ${PREFIX}/lib/qt4/plugins
	${TOUCH} ${PREFIX}/lib/qt4/plugins/.keep_me
	${INSTALL_DATA} ${WRKSRC}/mkspecs/qconfig.pri ${PREFIX}/share/qt4/mkspecs/

.include <bsd.port.mk>
