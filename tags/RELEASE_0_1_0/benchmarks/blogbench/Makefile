# New ports collection makefile for:	blogbench
# Date created:			Feb 14, 2005
# Whom:				janos.mohacsi@bsd.hu
#
# $MidnightBSD$
# $FreeBSD: ports/benchmarks/blogbench/Makefile,v 1.1 2005/02/14 21:04:04 pav Exp $
#

PORTNAME=	blogbench
PORTVERSION=	1.0
CATEGORIES=	benchmarks
MASTER_SITES=	ftp://ftp.blogbench.pureftpd.org/blogbench/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance Test of Filesystem I/O

GNU_CONFIGURE=	yes
USE_BZIP2=	yes

MAN8=		blogbench.8
PLIST_FILES=	bin/blogbench
PORTDOCS=	README

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
