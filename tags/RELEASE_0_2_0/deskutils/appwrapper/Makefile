# New ports collection makefile for:    appwrapper
# Date created:         3 Dec 2007
# Whom:                 luke@midnightbsd.org
#
# $MidnightBSD: mports/deskutils/appwrapper/Makefile,v 1.1 2007/12/03 05:43:08 laffer1 Exp $
# $FreeBSD: ports/deskutils/appwrapper/Makefile,v 1.4 2007/05/19 20:01:21 flz Exp $
#

PORTNAME=	appwrapper
PORTVERSION=	0.1
PORTREVISION=	1
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	AppWrapper.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep application wrapper
LICENSE=	unknown

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=		${WRKDIR}/AppWrapper

post-patch:
	${RMDIR} ${WRKSRC}/AppWrapper.app/ix86/linux-gnu
	${RMDIR} ${WRKSRC}/AppWrapper.app/ix86

.include <bsd.port.mk>
