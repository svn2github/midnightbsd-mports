# $MidnightBSD: mports/comms/kermit/Makefile,v 1.1 2008/08/17 22:04:59 laffer1 Exp $

PORTNAME=	kermit
PORTVERSION=	9.0.302
CATEGORIES=	comms ftp net
MASTER_SITES=	ftp://kermit.columbia.edu/kermit/archives/ \
		ftp://ftp.icm.edu.pl/pub/kermit/archives/
DISTNAME=	cku${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serial and network communications package
LICENSE=	bsd3

USE_OPENSSL=	yes
NO_WRKSUBDIR=	yes
MAKEFILE=	makefile
ALL_TARGET=	freebsd9
MAKE_ARGS=	CC2=${CC} SSLINC=-I${OPENSSLINC} SSLLIB=-L${OPENSSLLIB} HAVE_FBSD9='-DFREEBSD9' FREEBSD9=yes HAVE_UTMPX='-DHAVEUTMPX'

PORTDOCS=	*
PORTEXAMPLES=	*
MAN1=		kermit.1

post-patch:
	@${REINPLACE_CMD} -e 's,-O2 -pipe,${CFLAGS},' ${WRKSRC}/${MAKEFILE}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wermit ${PREFIX}/bin/kermit
	${INSTALL_MAN} ${WRKSRC}/ckuker.nr ${MANPREFIX}/man/man1/kermit.1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.txt ${DOCSDIR}
	${LN} -sf ckaaaa.txt ${DOCSDIR}/READ.ME
.endif
.if !defined(NOPORTEXAMPLES)
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/ckermit.ini ${EXAMPLESDIR}/dot.kermrc
	${INSTALL_DATA} ${WRKSRC}/ckermod.ini ${EXAMPLESDIR}/dot.mykermrc
.endif

.include <bsd.port.mk>
