# New ports collection makefile for:	p5-Test-Pod-Coverage
# Date created:				20 november 2004
# Whom:					Lars Thegler <lth@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Test-Pod-Coverage/Makefile,v 1.6 2007/09/08 00:59:11 linimon Exp $
#

PORTNAME=	Test-Pod-Coverage
PORTVERSION=	1.08
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check for pod coverage in your distribution

RUN_DEPENDS=	p5-Pod-Coverage>0:${PORTSDIR}/devel/p5-Pod-Coverage \
		p5-Test-Simple>0:${PORTSDIR}/devel/p5-Test-Simple
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		Test::Pod::Coverage.3

.include <bsd.port.mk>
