# New ports collection makefile for:	915resolution
# Date created:				30 Apr 2004
# Whom:					Remington Lang <MrL0Lz@gmail.com>
#
# $FreeBSD: ports/sysutils/915resolution/Makefile,v 1.5 2006/11/05 09:57:49 lawrance Exp $
# $MidnightBSD$

PORTNAME=	915resolution
PORTVERSION=	0.5.2
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.geocities.com/stomljen/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	ehaupt

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Resolution tool for Intel i915 video cards

PLIST_FILES=	bin/915resolution
ALL_TARGET=	915resolution

ONLY_FOR_ARCHS=	i386

.include <bsd.port.pre.mk>

do-build:
	cd ${WRKSRC} && \
		${CC} ${CFLAGS} 915resolution.c -o 915resolution

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/915resolution ${PREFIX}/bin

.include <bsd.port.post.mk>
