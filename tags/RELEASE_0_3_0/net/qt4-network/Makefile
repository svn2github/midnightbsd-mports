# New ports collection makefile for:	qt40
# Date created:				Wed Jun 29 11:49:42 CEST 2005
# Whom:					lofi@freebsd.org
#
# $MidnightBSD: mports/net/qt4-network/Makefile,v 1.2 2008/10/10 19:17:25 laffer1 Exp $
# $FreeBSD: ports/net/qt4-network/Makefile,v 1.12 2008/08/04 23:30:37 miwi Exp $
#

PORTNAME=	network
PORTVERSION=	${QT4_VERSION}
CATEGORIES?=	net ipv6
MASTER_SITES=	${MASTER_SITE_QT}
PKGNAMEPREFIX=	qt4-
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt network library
LICENSE=	gpl2

USE_QT_VER=	4
QT_COMPONENTS=	qmake_build moc_build rcc_build corelib
QT_NONSTANDARD=	yes
QT_DIST=	yes
MAKE_JOBS_SAFE=	yes
HAS_CONFIGURE=	yes
USE_LDCONFIG=	${PREFIX}/lib/qt4
USE_OPENSSL=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH  ${FAKE_MAKEARGS} destdir=${FAKE_DESTDIR} \
		INSTALL_ROOT=${FAKE_DESTDIR}

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake tools translations \
		src/dbus src/gui src/opengl src/phonon \
		src/qt3support src/script src/sql src/svg src/testlib \
		src/tools src/xml src/xmlpatterns src/3rdparty/clucene \
		src/3rdparty/kdebase src/3rdparty/kdelibs src/3rdparty/webkit
EXTRACT_AFTER_ARGS=	| ${TAR} -xf -
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

WRKSRC=		${WRKDIR}/${DISTNAME}/src/${PORTNAME}
CONFIGURE_WRKSRC=${WRKSRC}/../../

pre-configure:
	${CP} ${.CURDIR}/../../devel/qt4/files/configure ${CONFIGURE_WRKSRC}
	${MKDIR} ${WRKSRC}/../../mkspecs
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/../../bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/../../bin/moc
	${LN} -sf ${LOCALBASE}/bin/rcc ${WRKSRC}/../../bin/rcc

post-configure:
	${REINPLACE_CMD} -e 's|${PREFIX}/lib/qt4/pkgconfig|${PREFIX}/libdata/pkgconfig|g' \
			-e 's|.*$$(QMAKE).*||g' ${WRKSRC}/Makefile
	${REINPLACE_CMD} -E -e 's|-L.[^[:space:]]*qt-x11-opensource.[^[:space:]]*lib||g' \
			-E -e 's|(.*location=).*moc|\1${PREFIX}/bin/moc-qt4|g' \
			-E -e 's|(.*location=).*uic|\1${PREFIX}/bin/uic-qt4|g' \
		${WRKSRC}/../../lib/pkgconfig/QtNetwork.pc

.include <bsd.port.mk>
