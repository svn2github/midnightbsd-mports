# New ports collection makefile for:	p5-ExtUtils-F77
# Date created:				December 7 1999
# Whom:	      				jmz
#
# $FreeBSD: ports/lang/p5-F77/Makefile,v 1.9 2006/06/23 08:49:01 jmz Exp $
# $MidnightBSD$

PORTNAME=	ExtUtils-F77
PORTVERSION=	1.15
CATEGORIES=	lang perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	ExtUtils
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helps link C programs with Fortran subroutines

PERL_CONFIGURE=	yes

MAN3=		ExtUtils::F77.3

.include <bsd.port.pre.mk>
F2CLIB=	-lg2c

post-patch:
	@cd ${WRKSRC}; ${PERL5} -i.orig -pe \
		's/(.*Freebsd.*lib )(-lf2c)(.*)/$$1 ${F2CLIB} $$3/' F77.pm

.include <bsd.port.post.mk>
