# New ports collection makefile for:	p5-String-Approx
# Date created:				7 Nov 2007
# Whom:	      				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	String-Approx
PORTVERSION=	3.26
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	String
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for approximate matching (fuzzy matching)
LICENSE=	lgpl

BUILD_DEPENDS=	${SITE_PERL}/Test/More.pm:${PORTSDIR}/devel/p5-Test-Simple

PERL_CONFIGURE=	YES

MAN3=		String::Approx.3

.include <bsd.port.mk>
