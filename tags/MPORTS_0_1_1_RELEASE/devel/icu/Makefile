# New ports collection makefile for:	icu
# Date created:				22 Jan 2001
# Whom:					dwm
#
# $FreeBSD: ports/devel/icu/Makefile,v 1.22 2006/09/27 13:33:14 mi Exp $
# $MidnightBSD$
#

PORTNAME=	icu
PORTVERSION=	3.6
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}	\
		ftp://ftp.software.ibm.com/software/globalization/icu/${PORTVERSION}/
MASTER_SITE_SUBDIR=${PORTNAME}
DISTNAME=	icu4c-${PORTVERSION:S/./_/g}
EXTRACT_SUFX=	-src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	International Components for Unicode (from IBM)

OPTIONS=	THREADS "Build multi-threaded version of the library" off
CONFLICTS=	icu2-[0-9]*

INSTALLS_SHLIB=		yes
NO_FILTER_SHLIBS=	yes

WRKSRC=			${WRKDIR}/icu/source

GNU_CONFIGURE=		yes
CONFIGURE_SCRIPT=	runConfigureICU
CONFIGURE_ARGS+=	${OPSYS}
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-static
CONFIGURE_ARGS+=	--enable-samples=no

USE_GMAKE=		yes
CONFIGURE_ENV+=		CFLAGS="${CFLAGS:N-funroll-loops:N-O*} -O2" CXX="${CXX}"
CONFIGURE_ENV+=		CXXFLAGS="${CXXFLAGS:N-funroll-loops:N-O*} -O2" CC="${CC}"

MAN1+=	derb.1
MAN1+=	genbrk.1
MAN1+=	gencnval.1
MAN1+=	genctd.1
MAN1+=	genrb.1
MAN1+=	icu-config.1
MAN1+=	makeconv.1
MAN1+=	pkgdata.1
MAN1+=	uconv.1
MAN8+=	icupkg.8
MAN8+=	genccode.8
MAN8+=	gencmn.8
MAN8+=	gensprep.8
MAN8+=	genuca.8

ICUMAJOR=	${PORTVERSION:S/.//:R}
PLIST_SUB+=	ICUMAJOR=${ICUMAJOR} ICUMINOR=0
PLIST_SUB+=	ICUVER=${PORTVERSION}

.include <bsd.port.pre.mk>

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threads=yes
post-patch:
	${REINPLACE_CMD} -e 's,\(THREADSC.*FLAGS\).*,\1=${PTHREAD_CFLAGS},g' ${WRKSRC}/config/mh-bsd-gcc
.else
CONFIGURE_ARGS+=	--enable-threads=no
.endif

iotest cintltst intltest:
	-${GMAKE} -C ${WRKSRC}/test
	cd ${WRKSRC}/test/${.TARGET} && ${SETENV} \
	    LD_LIBRARY_PATH=${WRKSRC}/lib:${WRKSRC}/tools/ctestfw \
	    ./${.TARGET}

post-build test: iotest cintltst intltest

.include <bsd.port.post.mk>
