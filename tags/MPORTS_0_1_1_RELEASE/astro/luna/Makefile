# New ports collection makefile for:	luna
# Date created:		03 July 1996
# Whom:			ABURAYER Rewsirow <rewsirow@ff.iij4u.or.jp>
#
# $MidnightBSD$
# $FreeBSD: ports/astro/luna/Makefile,v 1.15 2006/05/03 05:14:05 edwin Exp $
#

PORTNAME=	luna
PORTVERSION=	1.9
CATEGORIES=	astro games
MASTER_SITES=	ftp://ftp.vector.co.jp/pack/dos/edu/science/space/
DISTNAME=	luna19s
EXTRACT_SUFX=	.lzh

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display the moon's phase

EXTRACT_DEPENDS=	lha:${PORTSDIR}/archivers/lha

EXTRACT_CMD=	lha
EXTRACT_BEFORE_ARGS=	xtfq1w=${WRKDIR}
EXTRACT_AFTER_ARGS=	# empty

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/luna
MAKEFILE=	makefile

post-patch:
	@${REINPLACE_CMD} -e 's|varargs.h|stdarg.h|' ${WRKSRC}/iprintf/idoprnt.c

.include <bsd.port.mk>
