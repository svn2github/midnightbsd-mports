# $MidnightBSD$

PORTNAME=	memtest86
PORTVERSION=	4.0b
CATEGORIES=	sysutils
MASTER_SITES=	http://www.memtest86.com/
DISTFILES=	${DISTNAME:S,b,s,}${EXTRACT_SUFX} ${DISTNAME:S,b,s,}.iso.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stand alone memory test for x86 architecture computers
LICENSE=	gpl2

EXTRACT_DEPENDS=	${LOCALBASE}/bin/unzip:${PORTSDIR}/archivers/unzip

ONLY_FOR_ARCHS=	i386

NO_BUILD=	yes

PORTDOCS=	README
PLIST_FILES=	%%DATADIR%%/floppy.bin \
		%%DATADIR%%/Memtest86_4.0.iso
PLIST_DIRS=	%%DATADIR%%

SUB_FILES=	pkg-message

post-extract:
	@${UNZIP_CMD} -qo ${DISTDIR}/${DISTNAME:S,b,s,}.iso.zip -d ${WRKSRC}

do-install:
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC:S,b,s,}/precomp.bin ${DATADIR}/floppy.bin
	${INSTALL_DATA} ${WRKSRC}/Memtest86_${PORTVERSION:S,b,s,}.iso \
			${DATADIR}/Memtest86_${PORTVERSION:S,b,,}.iso
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC:S,b,s,}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
