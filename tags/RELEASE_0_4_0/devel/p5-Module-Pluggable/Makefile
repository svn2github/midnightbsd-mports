# New ports collection makefile for:	p5-Module-Pluggable
# Date created:		2004-07-26
# Whom:			Lars Thegler <lth@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Module-Pluggable/Makefile,v 1.1 2008/03/21 20:31:57 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Module-Pluggable/Makefile,v 1.22 2007/04/08 15:21:39 lth Exp $
#

PORTNAME=	Module-Pluggable
PORTVERSION=	3.6
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically give your module the ability to have plugins
LICENSE=	perl

RUN_DEPENDS=	p5-PathTools>=3.0:${PORTSDIR}/devel/p5-PathTools
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		Devel::InnerPackage.3 \
		Module::Pluggable.3 \
		Module::Pluggable::Object.3

.include <bsd.port.mk>
