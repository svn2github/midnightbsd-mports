# New ports collection makefile for:    stepulator.app
# Date created:         30 Aug 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD$
# $FreeBSD: ports/math/stepulator/Makefile,v 1.1 2006/09/07 17:18:40 dinoex Exp $
#

PORTNAME=	stepulator
PORTVERSION=	1.0
CATEGORIES=	math
MASTER_SITES=	http://www.linuks.mine.nu/stepulator/ \
		http://florida.ethz.ch/ports/distfiles/
DISTNAME=	${PORTNAME}-gs-${PORTVERSION}
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scientific calculator implementing RPN notation for GNUstep

WRKSRC=		${WRKDIR}/Stepulator-gs
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile

.include <bsd.port.mk>
