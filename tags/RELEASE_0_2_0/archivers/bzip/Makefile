# New ports collection makefile for:    bzip
# Date created:         Fr  27 Sep 1996 11:47:35 MET DST
# Whom:                 Andreas Klemm <andreas@klemm.gtn.com>
#
# $MidnightBSD: mports/archivers/bzip/Makefile,v 1.1 2006/09/18 00:43:38 laffer1 Exp $
# $FreeBSD: ports/archivers/bzip/Makefile,v 1.29 2006/08/14 12:33:28 jmelo Exp $
#

PORTNAME=	bzip
PORTVERSION=	0.21
CATEGORIES=	archivers
MASTER_SITES=	http://www.freebsdbrasil.com.br/~jmelo/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A block-sorting file compressor
LICENSE=	restricted
# its gpl2 but patent issues

DEPRECATED=	see full description
RESTRICTED=	may be covered by patents
MAN1=		bzip.1 bunzip.1

PLIST_FILES=	bin/bzip bin/bunzip

pre-install:
	@${CAT} ${FILESDIR}/COPYRIGHT

do-install:
	${RM} -f ${PREFIX}/bin/bzip ${TARGETDIR}/bin/bunzip
	${INSTALL_PROGRAM} ${WRKSRC}/bzip ${TARGETDIR}/bin/bzip
	${LN} -fs ${TARGETDIR}/bin/bzip ${TARGETDIR}/bin/bunzip
	${INSTALL_MAN} ${WRKSRC}/bzip.1 ${MAN1PREFIX}/man/man1/bzip.1
	${INSTALL_MAN} ${WRKSRC}/bzip.1 ${MAN1PREFIX}/man/man1/bunzip.1

.include <bsd.port.mk>
