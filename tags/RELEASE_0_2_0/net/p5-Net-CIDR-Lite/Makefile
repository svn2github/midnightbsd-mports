# New ports collection makefile for:    p5-Net-CIDR-Lite
# Date created:                         Fri Jan 16 12:32:39 PST 2004
# Whom:                                 mharo@FreeBSD.org
#
# $MidnightBSD: mports/net/p5-Net-CIDR-Lite/Makefile,v 1.1 2007/03/21 01:13:41 laffer1 Exp $
# $FreeBSD: ports/net/p5-Net-CIDR-Lite/Makefile,v 1.4 2006/04/03 02:20:14 leeym Exp $
#

PORTNAME=	Net-CIDR-Lite
PORTVERSION=	0.20
CATEGORIES=	net perl5 ipv6
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Net
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for merging IPv4 or IPv6 CIDR addresses

BUILD_DEPENDS=	${SITE_PERL}/Test/More.pm:${PORTSDIR}/devel/p5-Test-Simple

PERL_CONFIGURE=	yes

MAN3=		Net::CIDR::Lite.3

.include <bsd.port.mk>
