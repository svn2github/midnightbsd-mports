# $MidnightBSD: mports/devel/p5-DateTime-Format-Mail/Makefile,v 1.3 2010/10/19 15:35:35 laffer1 Exp $

PORTNAME=	DateTime-Format-Mail
PORTVERSION=	0.30.01
PORTREVISION=	2
DISTVERSION=	${PORTVERSION:C/\.(..)$/\1/}
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert between DateTime and RFC2822/822 formats
LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Params-Validate>=0:${PORTSDIR}/devel/p5-Params-Validate \
		${SITE_PERL}/${PERL_ARCH}/DateTime.pm:${PORTSDIR}/devel/p5-DateTime

PERL_MODBUILD=	yes

MAN3=		DateTime::Format::Mail.3

.include <bsd.port.mk>
