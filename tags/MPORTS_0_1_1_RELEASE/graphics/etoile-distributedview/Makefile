# New ports collection makefile for:    etoile-distributedview
# Date created:         25 Aug 2007
# Whom:                 seirei@MidnightBSD.org
#
# $MidnightBSD: mports/graphics/etoile-distributedview/Makefile,v 1.1 2007/08/27 18:54:20 seirei Exp $
#

PORTNAME=	distributedview
PORTVERSION=	0.1.${SNAPSHOT}
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        gpl2
PKGNAMEPREFIX=	etoile-
DISTNAME=       etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project DistributedView framework

#LIB_DEPENDS=	onig:${PORTSDIR}/${ONIGURUMA4_PORT}

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
#NO_FILTER_SHLIBS=	yes

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
#MAKE_ENV+= old=yes
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/DistributedView

#UNITKIT_PORT?=	devel/etoile-unitkit
#ONIGURUMA4_PORT?=	devel/oniguruma4

.include <bsd.port.mk>
