# New ports collection makefile for:	cowsay
# Date created:		01 Sep 2000
# Whom:			Kris Kennaway <kris@FreeBSD.org>
#
# $MidnightBSD: mports/games/cowsay/Makefile,v 1.2 2008/03/22 18:24:27 laffer1 Exp $
# $FreeBSD: ports/games/cowsay/Makefile,v 1.6 2004/12/09 03:01:44 kris Exp $
#

PORTNAME=	cowsay
PORTVERSION=	3.03
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	ftp://ftp.nog.net/pub/tony/cowsay/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configurable talking characters in ASCII art
LICENSE=	artistic

USE_PERL5=	yes

NO_BUILD=	# defined

MAN1=		cowsay.1
MLINKS=		cowsay.1 cowthink.1

do-install:
	cd ${WRKSRC}; ${SH} install.sh ${PREFIX}
	@${INSTALL_DATA} ${FILESDIR}/box.cow ${PREFIX}/share/cows
	@${INSTALL_DATA} ${FILESDIR}/jkh.cow ${PREFIX}/share/cows
	@${INSTALL_DATA} ${FILESDIR}/tux-stab.cow ${PREFIX}/share/cows

.include <bsd.port.mk>
