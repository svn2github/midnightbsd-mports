# $MidnightBSD$

PORTNAME=	gorm
PORTVERSION=	1.2.16
CATEGORIES=	devel gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	dev-apps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical Object Relationship Modeller

LICENSE=	gpl3

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
DEFAULT_LIBVERSION=	1.1.0

MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

.include <bsd.port.mk>
