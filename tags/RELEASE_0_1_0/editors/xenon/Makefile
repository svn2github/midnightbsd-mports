# New ports collection makefile for:	xenon
# Date created:				22 October 1999
# Whom:					Chris D. Faulhaber <jedgar@fxp.org>
#
# $MidnightBSD$
# $FreeBSD: ports/editors/xenon/Makefile,v 1.17 2007/05/19 20:04:22 flz Exp $
#

PORTNAME=	xenon
PORTVERSION=	1.0.0
PORTREVISION=	3
CATEGORIES=	editors
MASTER_SITES=	http://sydney.proximity.com.au/~ben/xenon/dist/ \
		ftp://yankee.proximitygroup.com/pub/xenon/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple X-based text editor

USE_GMAKE=	yes
USE_GCC=	3.4+
USE_X_PREFIX=	yes
USE_XPM=	yes
MAKEFILE=	${WRKSRC}/makefiles/Makefile.Linux

MAN1=		xe.1

FIX_FILES=	Xe.h XeApp.C XeApp.h XeFontTable.C XeKeyTable.C \
		XeKeyTable.h XeObject.C XeObject.h XeObjectTable.h XeText.C \
		XeText.h

.include <bsd.port.pre.mk>

do-configure:
.for file in ${FIX_FILES}
	@${REINPLACE_CMD} -e 's|#include <ext/|#include <|' \
		-e 's|ulong|u_long|g' -e 's|uint|u_int|g' \
		-e 's|#include <slist>|#include <list>|' \
		-e 's|std::slist|std::list|g' \
		-e 's|#include <hash_map>|#include <ext/hash_map>|' \
		-e 's|std::hash_map|__gnu_cxx::hash_map|g' \
		-e 's|std::hash|__gnu_cxx::hash|g' \
		${WRKSRC}/${file}
.endfor

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xe ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/xe.1 ${PREFIX}/man/man1
	@${MKDIR} ${PREFIX}/share/examples/xe
	${INSTALL_DATA} ${WRKSRC}/xerc ${PREFIX}/share/examples/xe/sample.xerc

.include <bsd.port.post.mk>
