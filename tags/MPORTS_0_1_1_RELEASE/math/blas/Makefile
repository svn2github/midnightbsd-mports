# New ports collection makefile for:    blas
# Date created:         27 October 1994
# Whom:                 ljo
#
# $MidnightBSD$
# $FreeBSD: ports/math/blas/Makefile,v 1.41 2007/01/23 08:09:59 maho Exp $
#

PORTNAME=	blas
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	math
MASTER_SITES=	ftp://netlib.bell-labs.com/netlib/blas/ \
		ftp://ftp.mirrorservice.org/sites/netlib.bell-labs.com/netlib/blas/ \
		http://www.netlib.org/blas/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic Linear Algebra, level 1, 2, and 3

USE_LDCONFIG=	yes

NO_WRKSUBDIR=	yes
WANT_FORTRAN=	yes
WANT_FORTRAN=	yes #dummy but future use
BUILD_DEPENDS+= gfortran42:${PORTSDIR}/lang/gcc42
FC=             gfortran42
F77=            gfortran42
MAKE_ENV+=      FC="${FC}" F77="${F77}" FFLAGS="${FFLAGS}"

PLIST_FILES=	lib/libblas.a lib/libblas.so lib/libblas.so.2

do-configure:
	@${INSTALL_DATA} ${FILESDIR}/makefile.lib ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's+@FFLAGS@+${FFLAGS}+g' ${WRKSRC}/Makefile

.include <bsd.port.mk>
