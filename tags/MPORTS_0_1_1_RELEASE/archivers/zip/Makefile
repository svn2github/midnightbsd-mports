# New ports collection makefile for:    zip
# Date created:		22 Dec 1994
# Whom:			ache
#
# $MidnightBSD$
# $FreeBSD: ports/archivers/zip/Makefile,v 1.33 2006/07/28 14:42:53 sat Exp $
#

PORTNAME=	zip
PORTVERSION=	2.32
CATEGORIES=	archivers
MASTER_SITES=	http://ftp.info-zip.org/pub/infozip/src/ ${MASTER_SITE_TEX_CTAN}
MASTER_SITE_SUBDIR=	tools/zip/info-zip/src
DISTFILES=	zip232${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create/update ZIP files compatible with pkzip

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
MAKEFILE=	unix/Makefile
ALL_TARGET=	generic
MAN1=		zip.1

do-install:
.for file in zip zipcloak zipnote zipsplit
	${INSTALL_PROGRAM} ${WRKSRC}/${file} ${PREFIX}/bin
.endfor
	${INSTALL_MAN} ${WRKSRC}/man/zip.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
