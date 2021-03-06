# $MidnightBSD: mports/archivers/lzo2/Makefile,v 1.9 2012/02/24 01:47:51 laffer1 Exp $

PORTNAME=	lzo2
PORTVERSION=	2.06
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/ \
		FREEBSD_LOCAL/mandree
DISTNAME=	lzo-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable speedy, lossless data compression library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=  yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd7.0
CONFIGURE_ARGS=	--enable-shared
USE_LDCONFIG=	yes

post-build:
	@${ECHO_MSG} "===>  Running self-tests for ${PKGNAME} (can take a few minutes)"
	@#: override MALLOC_OPTIONS, else tests take excessively long
	cd ${WRKSRC} && ${SETENV} MALLOC_OPTIONS=jz ${MAKE} check test SHELL="${SH} -x"

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${REINPLACE_CMD} -e 's,doc/,,' NEWS README
.for i in AUTHORS BUGS COPYING NEWS README THANKS
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}/
.endfor
	${INSTALL_DATA}	${WRKSRC}/doc/* ${DOCSDIR}/
.endif

.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA}	${WRKSRC}/examples/[a-z]*.[ch] ${EXAMPLESDIR}/
.endif

.include <bsd.port.mk>
