# New ports collection makefile for:	performance
# Date created:         28 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/devel/performance/Makefile,v 1.4 2007/01/31 18:17:57 dinoex Exp $
#

PORTNAME=	performance
PORTVERSION=	0.2.5
CATEGORIES=	devel gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	Performance-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help improve the performance of GNUstep applications
LICENSE=	lgpl

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
DEFAULT_LIBVERSION=	0.2
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

USE_LDCONFIG=	yes

.include <bsd.port.mk>
