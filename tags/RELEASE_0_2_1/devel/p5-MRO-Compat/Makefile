# New ports collection makefile for:	devel/p5-MRO-Compat
# Date created:				Jun 18, 2007
# Whom:					Lars Balker Rasmussen <lbr@FreeBSD.org>
#
# $FreeBSD: ports/devel/p5-MRO-Compat/Makefile,v 1.2 2007/07/20 07:26:00 lbr Exp $
# $MidnightBSD$
#

PORTNAME=	MRO-Compat
PORTVERSION=	0.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/B/BL/BLBLACK
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Add mro::* interface compatibility for Perls < 5.9.5
LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-C3>=0.19:${PORTSDIR}/devel/p5-Class-C3

PERL_CONFIGURE=	yes

MAN3=	MRO::Compat.3

post-extract:
	@${PERL} -i.bak -ne 'print unless m,^if, .. m,}$$,' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
