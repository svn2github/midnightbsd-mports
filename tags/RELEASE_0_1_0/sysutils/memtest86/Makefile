# New ports collection makefile for:	memtest86
# Date created:		27 Mar 2004
# Whom:			Radim Kolar
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/memtest86/Makefile,v 1.2 2004/12/11 18:21:27 krion Exp $
#

PORTNAME=	memtest86
PORTVERSION=	3.2
CATEGORIES=	sysutils
MASTER_SITES=	http://www.memtest86.com/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}.iso.zip
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stand alone memory test for x86 architecture computers

EXTRACT_DEPENDS=	unzip:${PORTSDIR}/archivers/unzip

ONLY_FOR_ARCHS=	i386

NO_BUILD=	yes

PORTDOCS=	README
PLIST_FILES=	%%DATADIR%%/floppy.bin %%DATADIR%%/memtest.iso.gz
PLIST_DIRS=	%%DATADIR%%

SUB_FILES=	pkg-message

post-extract:
	@${UNZIP_CMD} -qo ${DISTDIR}/${DISTNAME}.iso.zip -d ${WRKSRC}

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/precomp.bin ${DATADIR}/floppy.bin
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME}.iso ${DATADIR}/memtest.iso
	${GZIP_CMD} ${DATADIR}/memtest.iso
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
