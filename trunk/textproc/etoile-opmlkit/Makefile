# $MidnightBSD$

PORTNAME=	opmlkit
PORTVERSION=	0.2
CATEGORIES=	textproc gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

PORTSCOUT=	limit:^0\.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project OPMLKit framework
LICENSE=	unknown

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/OPMLKit

.include <bsd.port.mk>
