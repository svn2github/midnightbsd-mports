# New ports collection makefile for:	qt40
# Date created:				Wed Jun 29 11:49:42 CEST 2005
# Whom:					lofi@freebsd.org
#
# $MidnightBSD: mports/devel/qt4-rcc/Makefile,v 1.2 2008/10/14 23:14:34 ctriv Exp $
# $FreeBSD: ports/devel/qt4-rcc/Makefile,v 1.7 2008/08/04 23:30:34 miwi Exp $
#

PORTNAME=	rcc
PORTVERSION=	${QT4_VERSION}
CATEGORIES?=	devel
MASTER_SITES=	${MASTER_SITE_QT}
PKGNAMEPREFIX=	qt4-
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt resource compiler
LICENSE=	gpl2

USE_QT_VER=	4
QT_COMPONENTS=	qmake_build
QT_NONSTANDARD=	yes
QT_DIST=	yes
MAKE_JOBS_SAFE=	yes
HAS_CONFIGURE=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH 

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake tools translations \
		src/dbus src/gui src/network src/opengl \
		src/phonon src/qt3support src/script src/sql src/svg \
		src/testlib src/xmlpatterns src/3rdparty/clucene \
		src/3rdparty/kdebase src/3rdparty/kdelibs src/3rdparty/webkit
EXTRACT_AFTER_ARGS=	| ${TAR} -xf -
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

WRKSRC=		${WRKDIR}/${DISTNAME}/src/tools/${PORTNAME}
CONFIGURE_WRKSRC=${WRKSRC}/../../../

pre-configure:
	${CP} ${.CURDIR}/../../devel/qt4/files/configure ${CONFIGURE_WRKSRC}
	${REINPLACE_CMD} -e 's|target.path.*|target.path=${PREFIX}/bin|g' \
		${WRKSRC}/${PORTNAME}.pro
	${MKDIR} ${WRKSRC}/../../../mkspecs
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/../../../bin/qmake

do-build:
	cd ${CONFIGURE_WRKSRC}/src/tools/bootstrap/ && make

.include <bsd.port.mk>
