# $MidnightBSD$
# $FreeBSD: ports/converters/p5-MIME-Base32/Makefile,v 1.2 2005/10/29 06:42:43 nork Exp $

PORTNAME=	MIME-Base32
PORTVERSION=	1.02a
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for Base32 encodings

LICENSE=	perl

WRKSRC=		${WRKDIR}/${PORTNAME}-1.02
PERL_CONFIGURE=	YES

MAN3=		MIME::Base32.3

post-extract:
	@${RM} ${WRKSRC}/test1.pl

.include <bsd.port.mk>
