# Ports collection makefile for:	p5-Digest-SHA
# Date created:			Aug 4, 2005
# Whom:				Travis Campbell <hcoyote@ghostar.org>
#
# $MidnightBSD$
# $FreeBSD: ports/security/p5-Digest-SHA/Makefile,v 1.11 2006/10/31 08:18:45 clsung Exp $
#

PORTNAME=	Digest-SHA
PORTVERSION=	5.44
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Digest
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for SHA-1/224/256/384/512

PERL_CONFIGURE=	yes

MAN1=	shasum.1
MAN3=	Digest::SHA.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		requires perl 5.6.0 or later. Install lang/perl5.8 and try again
.endif

.include <bsd.port.post.mk>
