# $MidnightBSD$

PORTNAME=	zipper
PORTVERSION=	1.3
CATEGORIES=	archivers gnustep
MASTER_SITES=	http://xanthippe.dyndns.org/Zipper/ \
		${MASTER_SITE_GNUSTEP_CH}
DISTNAME=	Zipper-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for inspecting the contents of a compressed archive
LICENSE=	publicdom

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	Renaissance:${RENAISSANCE_PORT}

WRKSRC=		${WRKDIR}/Zipper

RENAISSANCE_PORT?=	x11-toolkits/renaissance

.include <bsd.port.mk>
