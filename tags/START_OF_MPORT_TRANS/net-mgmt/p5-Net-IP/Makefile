# New ports collection makefile for:   p5-Net-IP
# Date created:                30 May 2002
# Whom:                        Kimura Fuyuki <fuyuki@hadaly.org>
#
# $MidnightBSD$
# $FreeBSD: ports/net-mgmt/p5-Net-IP/Makefile,v 1.15 2006/05/29 08:41:07 lth Exp $
#

PORTNAME=	Net-IP
PORTVERSION=	1.25
CATEGORIES=	net-mgmt perl5 ipv6
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Net
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for manipulating IPv4/IPv6 addresses

RUN_DEPENDS=	${SITE_PERL}/Math/BigInt.pm:${PORTSDIR}/math/p5-Math-BigInt
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Net::IP.3

post-configure:
	${PERL} -pi -e 's/-I\S+PERL\S+ //g if m{PERL_DL_NONLAZY}' ${WRKSRC}/Makefile

.include <bsd.port.mk>
