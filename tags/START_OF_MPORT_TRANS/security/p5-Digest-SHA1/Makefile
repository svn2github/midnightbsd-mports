# New ports collection makefile for:	p5-Digest-SHA1
# Date created:				30 March 2001
# Whom:					Yen-Ming Lee <leeym@cae.ce.ntu.edu.tw>
#
# $MidnightBSD$
# $FreeBSD: ports/security/p5-Digest-SHA1/Makefile,v 1.13 2006/01/19 14:34:54 erwin Exp $
#

PORTNAME=	Digest-SHA1
PORTVERSION=	2.11
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Digest
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl interface to the SHA-1 Algorithm

PERL_CONFIGURE=	yes

MAN3=		Digest::SHA1.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500800
BUILD_DEPENDS+=	${SITE_PERL}/Digest.pm:${PORTSDIR}/security/p5-Digest
RUN_DEPENDS+=	${BUILD_DEPENDS}
.endif

.include <bsd.port.post.mk>
