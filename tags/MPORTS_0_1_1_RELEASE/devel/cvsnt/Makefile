# New ports collection makefile for:	cvsnt
# Date created:				21 Jan 2004
# Whom:					Max Khon <fjoe@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/cvsnt/Makefile,v 1.24 2006/11/12 11:59:56 fjoe Exp $
#

PORTNAME=	cvsnt
PORTVERSION=	2.5.03.2382
CATEGORIES=	devel
MASTER_SITES=	http://www.cvsnt.org/archive/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CVS clone

CONFLICTS=	cvs-1*

GNU_CONFIGURE=	yes
USE_RC_SUBR=	cvslockd.sh
CONFIGURE_ARGS=	--enable-fork\
		--disable-odbc --disable-postgres\
		--disable-mysql --disable-sqlite
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GETOPT_LONG=yes
USE_ICONV=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} ${PTHREAD_CFLAGS} -I${LOCALBASE}/include"\
		LDFLAGS="${LDFLAGS} ${PTHREAD_LIBS} -L${LOCALBASE}/lib"\
		ac_cv_have_howl=no ac_cv_search_sw_discovery_run=no
LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2\
		pcre.0:${PORTSDIR}/devel/pcre

MAN1=		cvs.1
MAN5=		cvs.5
MLINKS=		cvs.1 cvsnt.1 cvs.5 cvsnt.5

.include <bsd.port.mk>
