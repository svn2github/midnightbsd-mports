#
# $MidnightBSD: ports/archivers/unzoo/Makefile,v 1.11 2007/08/04 11:40:38 gabor Exp $
#

PORTNAME=	unzoo
PORTVERSION=	4.4
PORTREVISION=	2
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_DEBIAN_POOL}
DISTNAME=	${PORTNAME}_${PORTVERSION}.orig

PATCH_SITES=	${MASTER_SITES}
PATCHFILES=	unzoo_4.4-4.diff.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A zoo archive extractor
LICENSE=	publicdom

EXTRA_DEFINES=	-DSYS_IS_UNIX -DSYS_HAS_MKDIR

MAN1=		unzoo.1
PLIST_FILES=	bin/unzoo

.include <bsd.port.pre.mk>

CFLAGS+=	-trigraphs

post-extract:
	@${MKDIR} ${WRKSRC}
	@${MV} ${WRKDIR}/${PORTNAME}.c ${WRKSRC}

do-build:
	${CC} ${CFLAGS} ${EXTRA_DEFINES} -o ${WRKSRC}/${PORTNAME} \
		${WRKSRC}/${PORTNAME}.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/debian/${PORTNAME}.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.post.mk>
