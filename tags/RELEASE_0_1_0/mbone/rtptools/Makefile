# New ports collection makefile for:	rtptools
# Date created:		5 January 1998
# Whom:			fenner
#
# $MidnightBSD$
# $FreeBSD: ports/mbone/rtptools/Makefile,v 1.10 2006/03/16 02:54:18 sobomax Exp $
#

PORTNAME=	rtptools
PORTVERSION=	1.18
CATEGORIES=	mbone
MASTER_SITES=	http://www.cs.columbia.edu/IRT/software/rtptools/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of tools to record, playback and monitor RTPv2 data streams

GNU_CONFIGURE=	yes

DOCFILES=	README ChangeLog.html rtptools.html

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/rtptools
.for i in ${DOCFILES}
	${INSTALL_DATA} ${WRKSRC}/${i} ${PREFIX}/share/doc/rtptools
.endfor
.endif

.include <bsd.port.mk>
