# $MidnightBSD: mports/comms/p5-SMS-Send/Makefile,v 1.1 2008/08/17 22:49:16 laffer1 Exp $

PORTNAME=	SMS-Send
PORTVERSION=	1.06
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver-based API for sending SMS messages
LICENSE=	perl

BUILD_DEPENDS=	p5-Class-Adapter>=1.05:${PORTSDIR}/devel/p5-Class-Adapter \
		p5-Params-Util>=1.00:${PORTSDIR}/devel/p5-Params-Util
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		SMS::Send.3 \
		SMS::Send::AU::Test.3 \
		SMS::Send::Driver.3 \
		SMS::Send::Test.3

.include <bsd.port.mk>
