# New ports collection makefile for:	py-orbit2
# Date created:				04 March 2003
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/py-orbit/Makefile,v 1.20 2007/05/28 23:34:38 mezz Exp $
#   $MCom: ports/devel/py-orbit2/Makefile,v 1.11 2006/04/13 07:52:34 bland Exp $

PORTNAME=	orbit
PORTVERSION=	2.14.3
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/pyorbit/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyorbit-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for ORBit2

CONFLICTS=	py*-omniorb-[0-9]*

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack orbit2
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
ORBIT_CONFIG=	${LOCALBASE}/bin/orbit2-config
CONFIGURE_ENV=	LDFLAGS="${PTHREAD_LIBS}"

.include <bsd.port.mk>
