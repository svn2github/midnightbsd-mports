# New ports collection makefile for:	p5-SGML-Parser-OpenSP
# Date created:				27 August 2007
# Whom:					Naram Qashat <cyberbotx@cyberbotx.com>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-SGML-Parser-OpenSP/Makefile,v 1.5 2008/07/04 02:18:55 beech Exp $
#

PORTNAME=	SGML-Parser-OpenSP
PORTVERSION=	0.994
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse SGML documents using OpenSP
LICENSE=	perl

BUILD_DEPENDS=	onsgmls:${PORTSDIR}/textproc/opensp \
		p5-File-Temp>=0:${PORTSDIR}/devel/p5-File-Temp \
		p5-Class-Accessor>=0:${PORTSDIR}/devel/p5-Class-Accessor
RUN_DEPENDS=	${BUILD_DEPENDS}

USE_DOS2UNIX=	yes
PERL_CONFIGURE=	yes
CC=		${CXX}
CONFIGURE_ARGS+="INC=-I${LOCALBASE}/include -I${LOCALBASE}/lib"

MAN3=		SGML::Parser::OpenSP.3 SGML::Parser::OpenSP::Tools.3

.include <bsd.port.mk>
