# $MidnightBSD$

PORTNAME=	nasm
PORTVERSION=	2.10.03
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel lang
MASTER_SITES=	http://www.nasm.us/pub/nasm/releasebuilds/${PORTVERSION}/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}-xdoc${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-purpose multi-platform x86 and x86-64 assembler
LICENSE=	gpl2

USES=		gmake tar:bzip2
GNU_CONFIGURE=	yes
DESTDIRNAME=  INSTALLROOT
INSTALL_TARGET=	install install_rdf

MAN1=		ldrdf.1 nasm.1 ndisasm.1 rdf2bin.1 rdf2com.1 rdf2ihx.1 \
		rdf2ith.1 rdf2srec.1 rdfdump.1 rdflib.1 rdx.1
PORTDOCS=	*

post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/nasmdoc.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
