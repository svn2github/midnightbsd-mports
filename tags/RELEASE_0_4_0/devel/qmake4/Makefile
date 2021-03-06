# $MidnightBSD: mports/devel/qmake4/Makefile,v 1.13 2013/03/03 17:05:45 laffer1 Exp $

PORTNAME=	qmake
DISTVERSION=	${QT4_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The build utility of the Qt project
LICENSE=	gpl3

EXTENSIONS=	qt
QT_NONSTANDARD=	yes
QT_DIST=	yes
REINPLACE_ARGS=	-i ""
WRKSRC=		${WRKDIR}/${DISTNAME}/qmake
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ENV+=	FILESDIR="${FILESDIR}"

FAKE_OPTS=	trueprefix

MAKE_JOBS_SAFE=	yes
TODAY_CMD=	/bin/date +%Y-%m-%d

post-patch:
	@${REINPLACE_CMD} -e 's|-O2|${CXXFLAGS}|' \
		-e 's|/usr/local|${LOCALBASE}|' \
		-e 's|/usr/X11R6|${LOCALBASE}|' \
		-e 's|release|release thread|' \
		-e 's|uic|uic-qt4|' \
		-e 's|moc|moc-qt4|' \
		${WRKSRC}/../mkspecs/freebsd-*/qmake.conf
	@${REINPLACE_CMD} -e 's|@QMAKE_QTOBJS@||g' ${WRKSRC}/Makefile.unix

# FIXME: This is ugly
	@${RM} ${WRKSRC}/../mkspecs/freebsd-g++/*.orig
	@${RM} ${WRKSRC}/../mkspecs/freebsd-g++46/*.orig

# Add mkspec for clang
	@${CP} -PpR ${WRKSRC}/../mkspecs/freebsd-g++46 ${WRKSRC}/../mkspecs/freebsd-clang
	@${REINPLACE_CMD} -e 's|g++-unix.conf|clang.conf|g' \
		-e 's|freebsd-g++46|freebsd-clang|g' \
		-e 's|gcc46|clang|g' \
		-e 's|g++46|clang++|g' \
		${WRKSRC}/../mkspecs/freebsd-clang/qmake.conf

# Add mkspecs for the different GCC versions in the ports tree
.for v in 42 44 47 48
	@${CP} -PpR ${WRKSRC}/../mkspecs/freebsd-g++46 ${WRKSRC}/../mkspecs/freebsd-g++${v}
	@${REINPLACE_CMD} -e 's|46|${v}|g' \
		${WRKSRC}/../mkspecs/freebsd-g++${v}/qmake.conf
.endfor

do-configure:
	${SED} -e 's|/usr/local|${PREFIX}|g' \
		-e "s|TODAY|$$(${TODAY_CMD})|g" \
		< ${FILESDIR}/qconfig.cpp \
		> ${WRKSRC:H}/src/corelib/global/qconfig.cpp
	${ECHO} '/* empty */' > ${WRKSRC}/qconfig.h
	${LN} ${WRKSRC}/qconfig.h ${WRKSRC}/../src/corelib/global/qconfig.h

post-install:
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/share/qt4/mkspecs
	${LN} -sf ${PREFIX}/share/qt4/mkspecs/freebsd-${QMAKE_BASE_COMPILER} ${PREFIX}/share/qt4/mkspecs/default

.include <bsd.port.mk>
