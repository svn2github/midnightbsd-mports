# New ports collection makefile for:	cdircmp
# Date created:				21 Sep 2005
# Whom:					Emanuel Haupt <ehaupt@critical.ch>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/cdircmp/Makefile,v 1.4 2006/06/01 12:13:51 ehaupt Exp $
#

PORTNAME=	cdircmp
PORTVERSION=	0.3
CATEGORIES=	sysutils
MASTER_SITES=	http://critical.ch/distfiles/ \
		http://energy.critical.ch/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compare directories and select files to copy

LDFLAGS+=	-lncurses -lform

PLIST_FILES=	bin/cdircmp

do-build:
	${CC} ${CFLAGS} -c ${WRKSRC}/main.c -o ${WRKSRC}/main.o
	${CC} ${LDFLAGS} -o ${WRKSRC}/${PORTNAME} ${WRKSRC}/main.o

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
