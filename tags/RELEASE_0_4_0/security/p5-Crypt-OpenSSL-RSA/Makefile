# $MidnightBSD: mports/security/p5-Crypt-OpenSSL-RSA/Makefile,v 1.1 2007/03/21 01:35:11 laffer1 Exp $

PORTNAME=	Crypt-OpenSSL-RSA
PORTVERSION=	0.25
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to RSA encode and decode strings using OpenSSL
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Crypt/OpenSSL/Random.pm:${PORTSDIR}/security/p5-Crypt-OpenSSL-Random \
		${SITE_PERL}/${PERL_ARCH}/Crypt/OpenSSL/Bignum.pm:${PORTSDIR}/security/p5-Crypt-OpenSSL-Bignum
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Crypt::OpenSSL::RSA.3

.include <bsd.port.mk>
