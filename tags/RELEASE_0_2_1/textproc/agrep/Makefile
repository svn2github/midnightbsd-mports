# ex:ts=8
# Ports collection makefile for:  agrep
# Date created:			  Fri May 23, 1997
# Whom:				  David O'Brien (obrien@FreeBSD.org)
#
# $FreeBSD: ports/textproc/agrep/Makefile,v 1.15 2003/11/20 19:22:15 dinoex Exp $
# $MidnightBSD$
#

PORTNAME=	agrep
PORTVERSION=	2.04
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	ftp://ftp.cs.arizona.edu/agrep/
EXTRACT_SUFX=	.tar.Z
#DISTFILES=	${DISTNAME}.${EXTRACT_SUFX} agrep.ps.1.Z  agrep.ps.2.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Approximate grep (fast approximate pattern-matching tool)

ALL_TARGET=
MAKE_ARGS=	CFLAGS="${CFLAGS}"

MAN1=		agrep.1

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/agrep ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/agrep.1 ${PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/share/doc/agrep
	@${INSTALL_MAN} ${WRKSRC}/agrep.algorithms ${PREFIX}/share/doc/agrep
.endif

.include <bsd.port.mk>
