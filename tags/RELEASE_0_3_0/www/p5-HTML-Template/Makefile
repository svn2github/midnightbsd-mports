# New ports collection makefile for:	p5-HTML-Template
# Date Created:				26 Oct, 2000
# Whom:					Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $MidnightBSD: mports/www/p5-HTML-Template/Makefile,v 1.3 2008/08/21 16:46:40 laffer1 Exp $
# $FreeBSD: ports/www/p5-HTML-Template/Makefile,v 1.17 2006/01/30 14:47:01 kuriyama Exp $
#

PORTNAME=	HTML-Template
PORTVERSION=	2.9
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to use HTML Templates from CGI scripts
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		HTML::Template.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501000
BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools \
		${SITE_PERL}/${PERL_ARCH}/Digest/MD5.pm:${PORTSDIR}/security/p5-Digest-MD5
RUN_DEPENDS+=	${BUILD_DEPENDS}
.endif

.include <bsd.port.post.mk>
