# $MidnightBSD$

PORTNAME=	Data-OptList
PORTVERSION=	0.106
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and validate simple name/value option pairs
LICENSE=	perl

RUN_DEPENDS=	p5-Params-Util>=0.14:${PORTSDIR}/devel/p5-Params-Util \
		p5-Sub-Install>=0.92:${PORTSDIR}/devel/p5-Sub-Install
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	Data::OptList.3

.include <bsd.port.mk>
