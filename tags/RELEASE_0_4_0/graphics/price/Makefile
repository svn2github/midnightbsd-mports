# $MidnightBSD$

PORTNAME=	price
PORTVERSION=	0.9.1
CATEGORIES=	graphics gnustep
MASTER_SITES=	SF/${PORTNAME}/PRICE%20source/${PORTVERSION}
DISTNAME=	PRICE-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image filtering and manipulation using GNUstep
LICENSE=	gpl

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

WRKSRC=		${WRKDIR}/PRICE-${PORTVERSION}

post-patch:
	${RM} ${WRKSRC}/Resources/Convolve55.gorm/.#*.*
	${RM} ${WRKSRC}/Resources/MainMenu.gorm/.#*.*

.include <bsd.port.mk>
