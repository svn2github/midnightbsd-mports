# $MidnightBSD$

PORTNAME=	Text-Reform
PORTVERSION=	1.11
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Text
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manual text wrapping and reformatting
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Text::Reform.3

pre-configure:
	@${FIND} ${WRKSRC} -name \*.orig -delete

.include <bsd.port.mk>
