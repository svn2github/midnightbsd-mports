# New ports collection makefile for:	libcheck
# Date created:		December 4, 2003
# Whom:			mikeh@FreeBSD.org
#
# $FreeBSD: ports/devel/libcheck/Makefile,v 1.4 2006/12/25 22:42:18 mikeh Exp $
# $MidnightBSD$
#

PORTNAME=	libcheck
PORTVERSION=	0.9.5
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	check
DISTNAME=	check-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A unit test framework for C
LICENSE=	gpl

GNU_CONFIGURE=	yes
PLIST_SUB=	CHECK_VERSION=${PORTVERSION}
USE_GMAKE=	yes

DOCSDIR=	${PREFIX}/share/doc/check-${PORTVERSION}
EXAMPLESDIR=	${PREFIX}/share/examples/check-${PORTVERSION}

.include <bsd.port.mk>
