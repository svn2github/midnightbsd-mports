# $MidnightBSD$

PORTNAME=	Class-Accessor-Chained
PORTVERSION=	0.01
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Make chained accessors

LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Class/Accessor.pm:${PORTSDIR}/devel/p5-Class-Accessor
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		Class::Accessor::Chained.3 \
		Class::Accessor::Chained::Fast.3

.include <bsd.port.mk>
