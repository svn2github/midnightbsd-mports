# New ports collection makefile for:	math/p5-Math-BigInt
# Date created:				12 October 2001
# Whom:					tobez
#
# $MidnightBSD$
# $FreeBSD: ports/math/p5-Math-BigInt/Makefile,v 1.16 2007/02/07 14:52:57 tobez Exp $
#

PORTNAME=	Math-BigInt
PORTVERSION=	1.79
CATEGORIES=	math perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Math
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Math::BigInt - Arbitrary size integer math package

PERL_CONFIGURE=	yes

MAN3=		Math::BigFloat.3 \
		Math::BigInt.3 \
		Math::BigInt::Calc.3 \
		Math::BigInt::CalcEmu.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		requires perl 5.6.0 or later. Install lang/perl5.8 and try again
.endif

.include <bsd.port.post.mk>
