# New ports collection makefile for:    popplerkit
# Date created:         21 Jan 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/popplerkit/Makefile,v 1.3 2007/01/31 18:18:02 dinoex Exp $
#

PORTNAME=	popplerkit
PORTVERSION=	0.0.${SNAPSHOT}
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/gsimageapps/PopplerKit/
DISTNAME=	PopplerKit-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework that supports rendering of PDF content

LIB_DEPENDS=	poppler:${PORTSDIR}/graphics/poppler

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
USE_GNOME=	gnomeprefix gnomehack gtk20

SNAPSHOT=	20050720
WRKSRC=		${WRKDIR}/PopplerKit
MAKE_ENV+=	CXX=${CXX}
ADDITIONAL_CPPFLAGS+=	-DPOPPLER_0_5

post-patch:
	${REINPLACE_CMD} -e 's|poppler-cairo|poppler-cairo-broken|' \
		${WRKSRC}/config.sh

.include <bsd.port.mk>
