# New ports collection Makefile for:	iSiloXC
# Date created:		17 Aug 2002
# Whom:			Sergey Skvortsov <skv@FreeBSD.org>
#
# $FreeBSD: ports/palm/iSiloXC/Makefile,v 1.9 2006/01/23 11:31:04 skv Exp $
# $MidnightBSD$
#

PORTNAME=	iSiloXC
PORTVERSION=	4.30
CATEGORIES=	palm textproc
MASTER_SITES=	http://www.isilox.com/download/dl/
DISTNAME=	${PORTNAME}${PORTVERSION:S/.//}BSD

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts documents from text/html files or URLs to iSilo format

USE_ZIP=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
ONLY_FOR_ARCHS=	i386

.include <bsd.port.pre.mk>
LIB_DEPENDS+=       c.4:${PORTSDIR}/misc/compat4x

MAN1=		iSiloXC.1
MAN5=		ixl.5
MANCOMPRESSED=	no
PLIST_FILES=	bin/iSiloXC

post-extract:
	@${CP} ${FILESDIR}/iSiloXC.1 ${FILESDIR}/ixl.5 ${WRKDIR}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/iSiloXC ${PREFIX}/bin
	@${MKDIR} ${MAN1PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/iSiloXC.1 ${MAN1PREFIX}/man/man1
	@${MKDIR} ${MAN5PREFIX}/man/man5
	${INSTALL_MAN} ${WRKSRC}/ixl.5 ${MAN5PREFIX}/man/man5

.include <bsd.port.post.mk>
