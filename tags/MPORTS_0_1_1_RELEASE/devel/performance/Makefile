# New ports collection makefile for:	performance
# Date created:         28 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/devel/performance/Makefile,v 1.1 2006/10/31 06:08:05 dinoex Exp $
# $MidnightBSD$
#

PORTNAME=	performance
PORTVERSION=	0.1.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	Performance-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help improve the performance of GNUstep applications

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
LDCONFIG_DIRS=	${LOCALLIBDIR}
INSTALLS_SHLIB=	yes
NO_FILTER_SHLIBS=	yes

.include <bsd.port.mk>
