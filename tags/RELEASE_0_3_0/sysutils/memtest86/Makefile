# $MidnightBSD: mports/sysutils/memtest86/Makefile,v 1.3 2010/06/01 23:05:43 laffer1 Exp $

PORTNAME=	memtest86
PORTVERSION=	3.5
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.memtest86.com/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}.iso.zip
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stand alone memory test for x86 architecture computers
LICENSE=	gpl2

EXTRACT_DEPENDS=	${LOCALBASE}/bin/unzip:${PORTSDIR}/archivers/unzip

ONLY_FOR_ARCHS=	i386

NO_BUILD=	yes

PORTDOCS=	README
PLIST_FILES=	%%DATADIR%%/floppy.bin %%DATADIR%%/Memtest86-3.5.iso
PLIST_DIRS=	%%DATADIR%%

SUB_FILES=	pkg-message

post-extract:
	@${UNZIP_CMD} -qo ${DISTDIR}/${DISTNAME}.iso.zip -d ${WRKSRC}

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/precomp.bin ${DATADIR}/floppy.bin
	${INSTALL_DATA} ${WRKSRC}/Memtest86_${PORTVERSION}.iso \
			${DATADIR}/Memtest86-${PORTVERSION}.iso
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
