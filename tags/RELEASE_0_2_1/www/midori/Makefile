# New ports collection makefile for:	midori
# Date created:		2007-10-21
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/www/midori/Makefile,v 1.2 2008/06/07 21:21:32 laffer1 Exp $
# $FreeBSD: ports/www/midori/Makefile,v 1.1 2008/03/24 03:50:49 marcus Exp $
#    $MCom: ports/www/midori/Makefile,v 1.3 2008/03/21 18:31:39 ahze Exp $

PORTNAME=	midori
PORTVERSION=	0.0.18
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	http://software.twotoasts.de/media/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight web browser using WebKit browser engine
LICENSE=	lgpl

LIB_DEPENDS=	webkit-1.0.1:${PORTSDIR}/www/webkit-gtk2 \
		sexy.2:${PORTSDIR}/x11-toolkits/libsexy

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include/WebKit/webkit -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
GNU_CONFIGURE=	yes
USE_GMAKE=	yes

pre-install:
	${CHMOD} +x ${WRKSRC}/install-sh

.include <bsd.port.mk>
