# New ports collection makefile for:	p5-threads-shared
# Date created:		2007-03-18
# Whom:			Ruben van Staveren
#
# $MidnightBSD: mports/devel/p5-threads-shared/Makefile,v 1.3 2008/01/05 05:44:31 laffer1 Exp $
# $FreeBSD: ports/devel/p5-threads-shared/Makefile,v 1.1 2007/04/04 08:57:26 clsung Exp $
#

PORTNAME=	threads-shared
PORTVERSION=	1.26
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/J/JD/JDHEDDEN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for sharing data structures between threads
LICENSE=	perl

RUN_DEPENDS=	p5-threads>=1.70:${PORTSDIR}/devel/p5-threads
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	threads::shared.3

.include <bsd.port.mk>
