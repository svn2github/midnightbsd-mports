# New ports collection makefile for: unace
# URL: http://members.aol.com/mlemke6413/ace.html
# Date created:         23 February 1999
# Whom:                 Joao Carlos Mendes Luis <jonny@jonny.eng.br>
#
# $MidnightBSD$
# $FreeBSD: ports/archivers/unace/Makefile,v 1.10 2006/08/12 13:06:26 erwin Exp $
#

PORTNAME=	unace
PORTVERSION=	1.2b
PORTREVISION=	2
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SUNSITE}
MASTER_SITE_SUBDIR=	utils/compress

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extract, view & test ACE archives

USE_GMAKE=	yes
ALL_TARGET=	clean unace
PLIST_FILES=	bin/unace

post-patch:
	@${REINPLACE_CMD} -e "s|CFLAGS =|CFLAGS ?=|" \
			-e "s|CC =|CC ?=|" \
			-e 's|gcc $$(CFLAGS)|$${CC} $$(CFLAGS)|' \
			${WRKSRC}/Makefile
	@${REINPLACE_CMD} 's|(CHAR \* s, thead \* head, INT nopath);|(CHAR \* s, thead \* head, INT nopath, unsigned int size);|' \
			${WRKSRC}/uac_crt.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unace ${TARGETDIR}/bin

.include <bsd.port.mk>
