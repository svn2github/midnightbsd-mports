# $MidnightBSD$
# $FreeBSD: ports/net/p5-Socket6/Makefile,v 1.15 2006/06/13 16:17:15 ume Exp $

PORTNAME=	Socket6
PORTVERSION=	0.25
CATEGORIES=	net perl5 ipv6
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPv6 related part of the C socket.h defines and structure manipulators

LICENSE=	bsd3

PERL_CONFIGURE=	yes

PLIST_FILES=	%%SITE_PERL%%/%%PERL_ARCH%%/Socket6.pm \
		%%SITE_PERL%%/%%PERL_ARCH%%/auto/Socket6/.packlist \
		%%SITE_PERL%%/%%PERL_ARCH%%/auto/Socket6/Socket6.bs \
		%%SITE_PERL%%/%%PERL_ARCH%%/auto/Socket6/Socket6.so
PLIST_DIRS=	%%SITE_PERL%%/%%PERL_ARCH%%/auto/Socket6

.include <bsd.port.mk>
