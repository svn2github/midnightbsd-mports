# $MidnightBSD$

PORTNAME=	threads-shared
PORTVERSION=	1.40
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/J/JD/JDHEDDEN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for sharing data structures between threads
LICENSE=	perl

RUN_DEPENDS=	p5-threads>=1.75:${PORTSDIR}/devel/p5-threads
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		threads::shared.3

.include <bsd.port.mk>
