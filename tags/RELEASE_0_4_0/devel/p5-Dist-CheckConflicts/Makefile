# $MidnightBSD: mports/devel/p5-Dist-CheckConflicts/Makefile,v 1.1 2013/06/21 02:24:07 laffer1 Exp $

PORTNAME=	Dist-CheckConflicts
PORTVERSION=	0.02
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DOY
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Declare version conflicts for your dist
LICENSE=	perl

USE_PERL=	yes

RUN_DEPENDS=	p5-List-MoreUtils>=0.12:${PORTSDIR}/lang/p5-List-MoreUtils \
		p5-Sub-Exporter>=0:${PORTSDIR}/devel/p5-Sub-Exporter

TEST_DEPENDS=	p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal

.include <bsd.mport.options.mk>

PERL_CONFIGURE=	YES

MAN3=		Dist::CheckConflicts.3

.include <bsd.port.mk>
