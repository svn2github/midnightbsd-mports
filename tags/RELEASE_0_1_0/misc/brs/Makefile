# New ports collection makefile for:	brs
# Date created:				10 July 2000
# Whom:					Kim Scarborough <user@unknown.nu>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/brs/Makefile,v 1.10 2005/10/20 20:13:42 vs Exp $
#

PORTNAME=	brs
PORTVERSION=	4.03
CATEGORIES=	misc
MASTER_SITES=	http://mirrors.playboy.com/misc/ \
		http://www.unknown.nu/ports/ \
		ftp://mirrors.playboy.com/misc/
DISTFILES=	bible.data.tar.bz2 bible.tar.bz2
DIST_SUBDIR=	brs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An interactive King James Bible

USE_BZIP2=	yes
NO_WRKSUBDIR=	yes
ALL_TARGET=
MAN1=		bible.1

.include <bsd.port.pre.mk>

post-patch:
	@${MV} ${WRKSRC}/brl.c ${WRKSRC}/brl.c.sed
	${SED} -e "s=%%PREFIX%%=${PREFIX}=g" \
		${WRKSRC}/brl.c.sed > ${WRKSRC}/brl.c
	@${MV} ${WRKSRC}/bible.1 ${WRKSRC}/bible.1.sed
	${SED} -e "s=%%PREFIX%%=${PREFIX}=g" \
		${WRKSRC}/bible.1.sed > ${WRKSRC}/bible.1

.include <bsd.port.post.mk>
