# $MidnightBSD$ 

PORTNAME=	Cisco-Reconfig
PORTVERSION=	0.91
PORTREVISION=	1
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and generate Cisco configuration files
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/IO/String.pm:${PORTSDIR}/devel/p5-IO-String
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Cisco::Reconfig.3

.include <bsd.port.mk>
