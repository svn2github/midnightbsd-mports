#
# $MidnightBSD$
#

PORTNAME=	eigen
PORTVERSION=	1.0.5
CATEGORIES=	math
MASTER_SITES=	http://download.tuxfamily.org/eigen/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight library for vector and matrix math
LICENSE=	gpl2

USE_CMAKE=	yes
CMAKE_SOURCE_PATH=	..
WRKSRC=		${WRKDIR}/${PORTNAME}/build

post-extract:
	${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
