# $MidnightBSD$
# $FreeBSD: ports/devel/libexecinfo/Makefile,v 1.7 2006/06/29 13:21:47 itetcu Exp $

PORTNAME=	libexecinfo
PORTVERSION=	1.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	itetcu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for inspecting program's backtrace

LICENSE=	bsd2

USES=		tar:bzip2 uidfix
USE_LDCONFIG=	yes
FAKE_MAKEARGS=	LIBDIR=${FAKE_DESTDIR}${PREFIX}/lib \
		INCLUDEDIR=${FAKE_DESTDIR}${PREFIX}/include

PORTDOCS=	README

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=      -fno-omit-frame-pointer
.endif

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
