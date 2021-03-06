# New ports collection makefile for:	qt40
# Date created:				Wed Jun 29 11:49:42 CEST 2005
# Whom:					lofi@freebsd.org
#
# $MidnightBSD: mports/devel/qt4-qvfb/Makefile,v 1.1 2008/10/10 18:03:21 laffer1 Exp $
# $FreeBSD: ports/devel/qt4-qvfb/Makefile,v 1.12 2008/09/11 15:26:16 gahr Exp $
#

PORTNAME=	qvfb
PORTVERSION=	${QT4_VERSION}
CATEGORIES?=	devel
MASTER_SITES=	${MASTER_SITE_QT}
PKGNAMEPREFIX=	qt4-
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt virtual framebuffer utility
LICENSE=	gpl2

USE_QT_VER=	4
QT_COMPONENTS=	qmake_build moc_build rcc_build uic_build corelib gui opengl
QT_NONSTANDARD=	yes
QT_DIST=	yes
USE_XORG=	xtst
MAKE_JOBS_SAFE=	yes
HAS_CONFIGURE=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH ${FAKE_MAKEARGS} destdir=${FAKE_DESTDIR} \
		INSTALL_ROOT=${FAKE_DESTDIR}

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake translations \
		src/dbus src/network src/phonon \
		src/qt3support src/script src/sql src/svg src/testlib \
		src/tools src/xml src/xmlpatterns src/3rdparty/clucene \
		src/3rdparty/kdebase src/3rdparty/kdelibs src/3rdparty/webkit
EXTRACT_AFTER_ARGS=	| ${TAR} -xf -
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

WRKSRC=		${WRKDIR}/${DISTNAME}/tools/${PORTNAME}
CONFIGURE_WRKSRC=${WRKSRC}/../../

pre-configure:
	${CP} ${.CURDIR}/../../devel/qt4/files/configure ${CONFIGURE_WRKSRC}
	${MKDIR} ${WRKSRC}/../../mkspecs
	${REINPLACE_CMD} -e 's|^TARGET.*|TARGET=qvfb-qt4|g' \
		${WRKSRC}/qvfb.pro
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/../../bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/../../bin/moc
	${LN} -sf ${LOCALBASE}/bin/uic-qt4 ${WRKSRC}/../../bin/uic
	${LN} -sf ${LOCALBASE}/bin/rcc ${WRKSRC}/../../bin/rcc

.include <bsd.port.mk>
