# $MidnightBSD$
# $FreeBSD: ports/devel/libsigsegv/Makefile,v 1.16 2010/12/25 20:46:32 sunpoet Exp $

PORTNAME=	libsigsegv
PORTVERSION=	2.9
CATEGORIES=	devel
MASTER_SITES=	GNU/libsigsegv

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handling page faults in user mode
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

PLIST_FILES=	include/sigsegv.h \
		lib/libsigsegv.a \
		lib/libsigsegv.la \
		lib/libsigsegv.so.2 \
		lib/libsigsegv.so

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check

.include <bsd.port.mk>
