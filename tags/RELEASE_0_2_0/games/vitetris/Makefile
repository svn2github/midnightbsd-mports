# New ports collection makefile for:	vitetris
# Date created:				27 April 2008
# Whom:					<smultron@midnightbsd.org>
#
# $MidnightBSD: mports/games/vitetris/Makefile,v 1.3 2008/04/28 00:56:07 smultron Exp $
#

PORTNAME=	vitetris
PORTVERSION=	0.43
CATEGORIES=	games
MASTER_SITES=	http://victornils.net/tetris/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	vitetris is a terminal-based Tetris clone by Victor Nilsson.
LICENSE=	bsd2

USE_GMAKE=	yes
ALL_TARGET=	tetris
USE_XLIB=	yes
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-with-x

do-install:
	${CP} ${WRKSRC}/tetris ${FAKE_DESTDIR}${LOCALBASE}/bin/

.include <bsd.port.mk>
