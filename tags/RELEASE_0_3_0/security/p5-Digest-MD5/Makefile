# New ports collection makefile for:    p5-Digest-MD5
# Date created:				1999/04/07
# Whom:					ache
#
# $FreeBSD: ports/security/p5-Digest-MD5/Makefile,v 1.31 2006/04/14 20:45:41 linimon Exp $
# $MidnightBSD: mports/security/p5-Digest-MD5/Makefile,v 1.2 2008/06/04 17:59:28 laffer1 Exp $
#

PORTNAME=	Digest-MD5
PORTVERSION=	2.39
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to the MD5 algorithm
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Digest.pm:${PORTSDIR}/security/p5-Digest
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Digest::MD5.3

.include <bsd.port.pre.mk>

post-patch:
	${PERL} -pi -e 's/^our\s+([\$$\@\%]\w+)/use vars qw($$1); $$1/;' ${WRKSRC}/MD5.pm
	${PERL} -pi -e '$$_ = "" if m{5.006}' ${WRKSRC}/Makefile.PL

.include <bsd.port.post.mk>
