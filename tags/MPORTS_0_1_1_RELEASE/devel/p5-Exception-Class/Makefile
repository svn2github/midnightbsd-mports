# ex:ts=8
# New ports collection makefile for:	p5-Exception-Class
# Date created:			Jul 28, 2001
# Whom:	      			ijliao
#
# $FreeBSD: ports/devel/p5-Exception-Class/Makefile,v 1.25 2006/07/15 08:22:10 erwin Exp $
# $MidnightBSD$
#

PORTNAME=	Exception-Class
PORTVERSION=	1.23
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Exception
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	A module that allows you to declare real exception classes in Perl
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Devel/StackTrace.pm:${PORTSDIR}/devel/p5-Devel-StackTrace \
		${SITE_PERL}/Class/Data/Inheritable.pm:${PORTSDIR}/devel/p5-Class-Data-Inheritable
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Exception::Class.3

.include <bsd.port.mk>

