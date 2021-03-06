# New ports collection makefile for:	GNU Pth
# Date Created:				23 May 1999
# Whom:					Ralf S. Engelschall <rse@gnu.org>
#
# $FreeBSD: ports/devel/pth/Makefile,v 1.81 2006/06/19 09:06:13 vd Exp $
# $MidnightBSD: mports/devel/pth/Makefile,v 1.1 2007/01/24 19:28:59 laffer1 Exp $
#

PORTNAME=	pth
PORTVERSION=	2.0.7
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	pth

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Portable Threads
LICENSE=	lgpl

USE_LDCONFIG=	${PREFIX}/lib/pth
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-optimize \
		--enable-batch \
		--includedir="${PREFIX}/include/pth" \
		--libdir="${PREFIX}/lib/pth"

MAN1=		pth-config.1
MAN3=		pth.3

OPTIONS=	OPTIMIZED_CFLAGS "Build with optimized CFLAGS" on \
		SYSCALL_HARD "Build with hard syscalls" off

.include <bsd.port.pre.mk>

.if defined(WITH_SYSCALL_HARD)
CONFIGURE_ARGS+=	--enable-syscall-hard --disable-syscall-soft
PLIST_SUB=	PTHREAD="@comment "
.else
CONFIGURE_ARGS+=	--enable-syscall-soft --enable-pthread
PLIST_SUB=	PTHREAD=""
MAN1+=		pthread-config.1
MAN3+=		pthread.3
.endif

post-patch:
.if defined(WITHOUT_OPTIMIZED_CFLAGS)
	${REINPLACE_CMD} -e \
		's|-funroll-loops -fstrength-reduce -fomit-frame-pointer -ffast-math||' \
		${WRKSRC}/configure
.endif

post-build:
	@${ECHO_MSG} "===>  Use 'make test' to run a quick test suite."

test: build
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} test

.include <bsd.port.post.mk>
