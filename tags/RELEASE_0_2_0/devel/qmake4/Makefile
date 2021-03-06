#
# $MidnightBSD: mports/devel/qmake4/Makefile,v 1.4 2008/06/13 16:54:48 laffer1 Exp $
#

PORTNAME=	qmake
PORTVERSION=	${QT4_VERSION}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_QT}
PKGNAMEPREFIX=	qt4-
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The build utility of the Qt project
LICENSE=	gpl2

QT_NONSTANDARD=	yes
REINPLACE_ARGS=	-i ""
WRKSRC=		${WRKDIR}/${DISTNAME}/qmake
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ENV+=	FILESDIR="${FILESDIR}" ${FAKE_MAKEARGS} destdir=${FAKE_DESTDIR}
#USE_BZIP2=	yes

EXTRACT_AFTER_ARGS=| ${TAR} -xf - \
	'${DISTNAME}/config.tests/unix/padstring' \
	'${DISTNAME}/mkspecs' \
	'${DISTNAME}/include/*/*' \
	'${DISTNAME}/src/*/*.h' '${DISTNAME}/qmake' \
	'${DISTNAME}/src/corelib/tools' \
	'${DISTNAME}/src/corelib/io' \
	'${DISTNAME}/src/corelib/global' \
	'${DISTNAME}/src/corelib/plugin' \
	'${DISTNAME}/src/corelib/kernel' \
	'${DISTNAME}/src/script' \
	'${DISTNAME}/src/3rdparty/md4' \
	'${DISTNAME}/src/3rdparty/md5' \
	'${DISTNAME}/src/3rdparty/sha1'

.if !defined(NOPORTDOCS)
EXTRACT_AFTER_ARGS+='${DISTNAME}/doc/html/qmake*'
DOCSDIR=${PREFIX}/share/doc/qt4
post-install:
	${MKDIR} '${DOCSDIR}'
	${CP} -Rp '${WRKSRC:H}/doc/html' '${DOCSDIR}'
.endif

post-patch:
	@${RM} -fr ${WRKSRC}/examples ${WRKSRC}/tutorial
	@${REINPLACE_CMD} -e 's|-O2|${CXXFLAGS}|' \
		-e 's|gcc.*|${CC}|' \
		-e 's|g++.*|${CXX}|' \
		-e 's|/usr/local|${LOCALBASE}|' \
		-e 's|/usr/X11R6|${LOCALBASE}|' \
		-e 's|release|release thread|' \
		-e 's|-pthread -D_THREAD_SAFE|${PTHREAD_CFLAGS}|' \
		-e 's|-pthread|${PTHREAD_LIBS}|' \
		-e 's|uic|uic-qt4|' \
		-e 's|moc|moc-qt4|' \
		${WRKSRC}/../mkspecs/freebsd-g++/qmake.conf \
		${WRKSRC}/../mkspecs/freebsd-g++34/qmake.conf
	@${REINPLACE_CMD} -e 's|@QMAKE_QTOBJS@||g' ${WRKSRC}/Makefile.unix

do-configure:
	${SED} -e 's|/usr/local|${PREFIX}|g' \
		< ${FILESDIR}/qconfig.cpp \
		> ${WRKSRC:H}/src/corelib/global/qconfig.cpp
	${ECHO} '/* empty */' > ${WRKSRC}/qconfig.h
	${LN} ${WRKSRC}/qconfig.h ${WRKSRC}/../include/QtCore/qconfig.h

.include <bsd.port.pre.mk>
.include "${.CURDIR}/../../Mk/bsd.qt.mk"


.if ${ARCH} == "amd64"
CXXFLAGS+=	-fno-gcse
.endif

.include <bsd.port.post.mk>
