# New ports collection makefile for:	math/p5-bignum
# Date created:				25 May 2007
# Whom:					Lars Thegler <lth@FreeBSD.org>
#
# $MidnightBSD: mports/math/p5-bignum/Makefile,v 1.1 2007/07/16 02:03:17 laffer1 Exp $
# $FreeBSD: ports/math/p5-bignum/Makefile,v 1.1 2007/05/27 11:48:31 lth Exp $
#

PORTNAME=	bignum
PORTVERSION=	0.22
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../by-authors/id/T/TE/TELS/math
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Transparent BigNumber/BigRational support for Perl

RUN_DEPENDS=	p5-Math-BigInt>=1.87:${PORTSDIR}/math/p5-Math-BigInt \
		p5-Math-BigRat>=0.20:${PORTSDIR}/math/p5-Math-BigRat
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	bigint.3 \
	bignum.3 \
	bigrat.3

.include <bsd.port.mk>
