# New ports collection makefile for: nwcc
# Date created: 20. August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD: mports/lang/nwcc/Makefile,v 1.10 2008/05/18 06:36:29 laffer1 Exp $
#

PORTNAME=	nwcc
PORTVERSION=	0.7.6
PORTREVISION=	0
CATEGORIES=	lang
DISTNAME=	${PORTNAME}_${PORTVERSION}
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nwcc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nils Weller's BSD-licensed C-compiler.
LICENSE=	bsd2

HAS_CONFIGURE=	yes
ALL_TARGET=	nwcc

.include <bsd.port.pre.mk>

post-install:
	${CP} -n ${WRKSRC}/nwcc.conf.sample ${PREFIX}/etc/nwcc.conf.sample

.include <bsd.port.post.mk>
