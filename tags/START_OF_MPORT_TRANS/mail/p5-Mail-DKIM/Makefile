# ports collection makefile for:	p5-Mail-DKIM
# Date created:				16 July 2006
# Whom:					Yoshisato YANAGISAWA
#
# $MidnightBSD$
# $FreeBSD: ports/mail/p5-Mail-DKIM/Makefile,v 1.7 2007/03/16 20:58:23 miwi Exp $
#

PORTNAME=	Mail-DKIM
PORTVERSION=	0.24
CATEGORIES=	mail perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Mail
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to process and/or create DKIM email

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Crypt/OpenSSL/RSA.pm:${PORTSDIR}/security/p5-Crypt-OpenSSL-RSA \
		${SITE_PERL}/${PERL_ARCH}/Digest/SHA.pm:${PORTSDIR}/security/p5-Digest-SHA \
		${SITE_PERL}/${PERL_ARCH}/Digest/SHA1.pm:${PORTSDIR}/security/p5-Digest-SHA1 \
		${SITE_PERL}/Error.pm:${PORTSDIR}/lang/p5-Error \
		${SITE_PERL}/Mail/Address.pm:${PORTSDIR}/mail/p5-Mail-Tools \
		${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64 \
		${SITE_PERL}/${PERL_ARCH}/Net/DNS.pm:${PORTSDIR}/dns/p5-Net-DNS
RUN_DEPENDS=	${BUILD_DEPENDS}

MASTER_SITE_BACKUP+=	http://freebsd.unixfreunde.de/sources/ \
			http://jason.long.name/dkimproxy/

PERL_CONFIGURE=	yes

MAN3=		Mail::DKIM.3 \
		Mail::DKIM::Algorithm::Base.3 \
		Mail::DKIM::Algorithm::rsa_sha1.3 \
		Mail::DKIM::Algorithm::rsa_sha256.3 \
		Mail::DKIM::Canonicalization::Base.3 \
		Mail::DKIM::Canonicalization::DkimCommon.3 \
    		Mail::DKIM::DkSignature.3 \
		Mail::DKIM::Policy.3 \
		Mail::DKIM::Signature.3 \
		Mail::DKIM::Signer.3 \
		Mail::DKIM::SignerPolicy.3 \
		Mail::DKIM::Verifier.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		require Perl 5.8 or newer. Install lang/perl5.8 and try again
.endif

.include <bsd.port.post.mk>
