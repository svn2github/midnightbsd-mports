# New ports collection makefile for:    mpack
# Date created:         1 May 1995
# Whom:                 ache
#
# $MidnightBSD$
# $FreeBSD: ports/converters/mpack/Makefile,v 1.20 2006/10/31 15:52:49 dinoex Exp $
#

PORTNAME=	mpack
PORTVERSION=	1.6
PORTREVISION=	0
CATEGORIES=	converters mail news
MASTER_SITES=	ftp://ftp.andrew.cmu.edu/pub/mpack/
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	External MIME packer/unpacker
LICENSE=	bsd3

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
GNU_CONFIGURE=	yes

MAN1=		mpack.1 munpack.1

PLIST_FILES=	bin/mpack bin/munpack

.include <bsd.port.mk>
