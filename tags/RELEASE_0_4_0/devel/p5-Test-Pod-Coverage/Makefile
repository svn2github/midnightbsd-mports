# $MidnightBSD: mports/devel/p5-Test-Pod-Coverage/Makefile,v 1.2 2008/10/16 21:45:35 laffer1 Exp $

PORTNAME=	Test-Pod-Coverage
PORTVERSION=	1.08
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check for pod coverage in your distribution
LICENSE=	perl

RUN_DEPENDS=	p5-Pod-Coverage>0:${PORTSDIR}/devel/p5-Pod-Coverage \
		p5-Test-Simple>0:${PORTSDIR}/devel/p5-Test-Simple
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		Test::Pod::Coverage.3

.include <bsd.port.mk>
