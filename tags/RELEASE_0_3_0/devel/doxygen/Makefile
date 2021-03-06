# New ports collection makefile for:   doxygen
# Date created:        20 March 1998
# Whom:                Joep Grooten <joep@di.nl>
#
# $MidnightBSD: mports/devel/doxygen/Makefile,v 1.2 2008/08/14 14:30:06 laffer1 Exp $
# $FreeBSD: ports/devel/doxygen/Makefile,v 1.53 2006/06/27 14:14:17 mi Exp $
#

PORTNAME=	doxygen
PORTVERSION=	1.5.6
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.stack.nl/pub/users/dimitri/ \
		http://ftp.stack.nl/pub/users/dimitri/
EXTRACT_SUFX=	.src.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A documentation system for C, C++ and other languages
LICENSE=	gpl2

BUILD_DEPENDS=	tmake:${PORTSDIR}/devel/tmake
LIB_DEPENDS=	png:${PORTSDIR}/graphics/png

USE_BISON=	yes
USE_ICONV=	yes
ALL_TARGET=	all

EXTRACT_AFTER_ARGS=|${TAR} -xpf - --exclude '*/libmd5'	\
	--exclude '*/libpng' --exclude '*/tmake'

CONFIGURE_ENV+=	CXX="${CXX}"
.if !defined(NOPORTDOCS)
ALL_TARGET+=	docs
USE_PYTHON_BUILD=	yes
BUILD_DEPENDS+=	dot:${PORTSDIR}/graphics/graphviz

.if !defined(WITHOUT_LATEX)
ALL_TARGET+=	pdf
BUILD_DEPENDS+=	dvips:${PORTSDIR}/print/dvipsk-tetex \
		latex:${PORTSDIR}/print/teTeX
USE_GHOSTSCRIPT_BUILD=	yes
MAKE_ARGS+=	HAVE_LATEX=yes
.endif # !defined(WITHOUT_LATEX)
.endif # !defined(NOPORTDOCS)

.if !defined(WITHOUT_DOXYWIZARD)
USE_QT_VER=	3
QT_INC=		${LOCALBASE}/include
QTNAME=		qt-mt
QT_OPENGL=
THREADLIBS=	${PTHREAD_LIBS}
CFLAGS+=	${PTHREAD_CFLAGS}

# Need this in env for build
QTDIR?=		${QT_PREFIX}
CONFIGURE_ENV+=	QTDIR="${QTDIR}"
CONFIGURE_ARGS+=--with-doxywizard
.endif # !WITHOUT_DOXYWIZARD

USE_PERL5=	yes
HAS_CONFIGURE=	yes
USE_GMAKE=	yes
QT_NONSTANDARD=	yes	# non-standard configure arguments
CONFIGURE_ARGS+=--prefix ${PREFIX} --perl ${PERL} --make ${GMAKE} \
		--install "${INSTALL}"
PLIST=		${WRKDIR}/plist
TMPDOCDEST=	${WRKDIR}/tmpdocdest

PLIST_FILES=	bin/doxygen \
		bin/doxytag

.ifndef WITHOUT_DOXYWIZARD
PLIST_FILES+= bin/doxywizard
.endif

pre-configure:
	@cd ${WRKSRC};for pro in src/*.pro.in addon/doxywizard/doxywizard.pro.in;do \
		${ECHO} "unix:LIBS += -liconv" >> $$pro; done
	@${CHMOD} +x ${WRKSRC}/configure

post-configure:
	@${REINPLACE_CMD} -e 's|TMAKE *=.*|TMAKE=${LOCALBASE}/bin/tmake|' \
		-e 's|TMAKEPATH *=.*|TMAKEPATH=${LOCALBASE}/share/tmake/freebsd-g++|' \
			${WRKSRC}/Makefile ${WRKSRC}/*/Makefile \
			${WRKSRC}/addon/doxywizard/Makefile

post-build:
	cd ${BUILD_WRKSRC}/examples; \
	${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} Makefile ${MAKE_ARGS} all

pre-install:
	${RM} -rf ${TMPDOCDEST} ${PLIST}
	${TOUCH} ${PLIST}
.ifndef NOPORTDOCS
	${MKDIR} ${TMPDOCDEST}/doxygen
	${RM} -f ${WRKSRC}/examples/diagrams/html/*.md5 \
		 ${WRKSRC}/examples/diagrams/html/*.map
	${TAR} -C ${WRKSRC} --exclude '*/_*' -cf - html \
		| ${TAR} -C ${TMPDOCDEST}/doxygen --unlink -xf -
	${TAR} -C ${WRKSRC} --exclude '*/Makefile*' --exclude '*.dot' \
		-cf - examples \
	    | ${TAR} -C ${TMPDOCDEST}/doxygen --unlink -xf -
.ifndef WITHOUT_LATEX
	${INSTALL_DATA} ${WRKSRC}/latex/doxygen_manual.dvi \
			${WRKSRC}/latex/doxygen_manual.pdf \
			${WRKSRC}/latex/doxygen_manual.ps \
			${WRKSRC}/latex/archoverview.eps \
			${WRKSRC}/latex/doxygen_logo.eps \
			${TMPDOCDEST}/doxygen
.endif # WITHOUT_LATEX
	@cd ${TMPDOCDEST} \
	&& ${FIND} -s * -type f -o -type l \
		| ${SED} -e 's|^|share/doc/|'>> ${PLIST} \
	&& ${FIND} -d * -type d \
		| ${SED} -e 's|^|@dirrm share/doc/|' >> ${PLIST}
.endif # ! NOPORTDOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/doxygen ${PREFIX}/bin/
	${INSTALL_PROGRAM} ${WRKSRC}/bin/doxytag ${PREFIX}/bin/
.ifndef WITHOUT_DOXYWIZARD
	${INSTALL_PROGRAM} ${WRKSRC}/bin/doxywizard ${PREFIX}/bin/
.endif
.ifndef NOPORTDOCS
	${MKDIR} ${PREFIX}/share/doc/doxygen
	${TAR} -C ${TMPDOCDEST} -cf - doxygen \
		| ${TAR} -C ${PREFIX}/share/doc --unlink -xf -
.endif # ! NOPORTDOCS

.include <bsd.port.mk>
