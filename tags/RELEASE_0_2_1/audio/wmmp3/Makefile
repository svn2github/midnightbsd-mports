# New ports collection makefile for:	wmmp3
# Date created:		09 December 1999
# Whom:			Jim Mock <jim@FreeBSD.org>
#
# $MidnightBSD: mports/audio/wmmp3/Makefile,v 1.3 2008/02/28 00:18:28 laffer1 Exp $
# $FreeBSD: ports/audio/wmmp3/Makefile,v 1.8 2003/12/15 01:17:26 pav Exp $

PORTNAME=	wmmp3
PORTVERSION=	0.12
PORTREVISION=	1
CATEGORIES=	audio windowmaker
MASTER_SITES=	http://www.dotfiles.com/software/wmmp3/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	A front-end for mpg123 in a Window Maker dockapp
LICENSE=	gpl2

RUN_DEPENDS=	mpg123:${PORTSDIR}/audio/mpg123

GNU_CONFIGURE=	yes
USE_XLIB=	yes
USE_XPM=	yes

post-install:
	@${ECHO} "===>   Installing sample.wmmp3 in ${PREFIX}/share/examples/wmmp3"
	@${MKDIR} ${PREFIX}/share/examples/wmmp3 && ${CHMOD} a+rx ${PREFIX}/share/examples/wmmp3
	@${INSTALL_DATA} ${WRKSRC}/sample.wmmp3 ${PREFIX}/share/examples/wmmp3
.if !defined(NOPORTDOCS)
	@${ECHO} "===>   Installing README in ${PREFIX}/share/doc/wmmp3"
	@${MKDIR} ${PREFIX}/share/doc/wmmp3 && ${CHMOD} a+rx ${PREFIX}/share/doc/wmmp3
	@${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/wmmp3
.endif

.include <bsd.port.mk>
