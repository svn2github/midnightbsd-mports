# New ports collection makefile for:	Mail-DomainKeys
# Date created:	   23 May 2005
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/mail/p5-Mail-DomainKeys/Makefile,v 1.10 2006/11/10 16:06:42 skv Exp $
#

PORTNAME=	Mail-DomainKeys
PORTVERSION=	0.88
CATEGORIES=	mail perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Mail
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl implementation of DomainKeys

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Net/DNS.pm:${PORTSDIR}/dns/p5-Net-DNS \
		${SITE_PERL}/${PERL_ARCH}/Crypt/OpenSSL/RSA.pm:${PORTSDIR}/security/p5-Crypt-OpenSSL-RSA \
		${SITE_PERL}/Email/Address.pm:${PORTSDIR}/mail/p5-Email-Address
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Mail::DomainKeys.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		requires Perl 5.6 or newer. Install lang/perl5.8 and try again
.endif

.if ${PERL_LEVEL} < 500800
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64
.endif

post-patch:
	@${PERL} -pi -e '$$_="" if $$.>=6 && $$.<=38' ${WRKSRC}/Makefile.PL

.include <bsd.port.post.mk>
