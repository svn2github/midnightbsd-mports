# New ports collection makefile for:    netclasses
# Date created:         007 Sep 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD$
# $FreeBSD: ports/net/netclasses/Makefile,v 1.1 2006/09/10 08:15:09 dinoex Exp $
#

PORTNAME=	netclasses
PORTVERSION=	1.06
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Objective-C framework for socket programming with GNUstep

WRKSRC=		${WRKDIR}/${DISTNAME}
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
# broken
#USE_LDCONFIG=	yes
INSTALLS_SHLIB=	yes
MAKEFILE=	GNUmakefile

.include <bsd.port.mk>
