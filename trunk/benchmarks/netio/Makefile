# $MidnightBSD$
# $FreeBSD: ports/benchmarks/netio/Makefile,v 1.5 2006/09/02 12:07:20 arved Exp $

PORTNAME=	netio
PORTVERSION=	1.26
CATEGORIES=	benchmarks net ipv6
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	arved
DISTNAME=	netio126

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network benchmark

LICENSE=	netio
LICENSE_NAME=	netio license
LICENSE_FILE=	${WRKSRC}/netio.doc
LICENSE_PERMS=	dist-mirror pkg-mirror

RESTRICTED=	No commercial use

WRKSRC=		${WRKDIR}
USE_ZIP=	yes
USE_GMAKE=	yes
PLIST_FILES=	bin/netio

CFLAGS+=	-DUNIX ${PTHREAD_CFLAGS}
MAKE_ENV+=	OUT="-o" LIBS=${PTHREAD_LIBS}
.if defined(WITH_IPV6)
PLIST_FILES+=	bin/netio6
.endif

do-build:
	cd ${WRKSRC}; \
	${SETENV} ${MAKE_ENV} O=.o CFLAGS="${CFLAGS}" ${GMAKE} all
.if defined(WITH_IPV6)
	cd ${WRKSRC}; \
	${MAKE_ENV} O=.6o X=6 CFLAGS="${CFLAGS} -DUSE_IPV6" ${GMAKE} all
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/netio ${PREFIX}/bin
.if defined(WITH_IPV6)
	${INSTALL_PROGRAM} ${WRKSRC}/netio6 ${PREFIX}/bin
.endif

.include <bsd.port.mk>
