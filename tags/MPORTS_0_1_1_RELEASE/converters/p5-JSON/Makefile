# New ports collection makefile for:	JSON
# Date created:		19 Aug 2005
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $FreeBSD: ports/converters/p5-JSON/Makefile,v 1.8 2007/04/21 10:16:51 kuriyama Exp $
# $MidnightBSD: mports/converters/p5-JSON/Makefile,v 1.1 2007/09/01 17:48:57 ctriv Exp $
#

PORTNAME=	JSON
PORTVERSION=	1.14
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../../authors/id/M/MA/MAKAMAKA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Perl extension to convert to JSON (JavaScript Object Notation)
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/HTTP/Request.pm:${PORTSDIR}/www/p5-libwww
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
MAN3=		Apache::JSONRPC.3 JSON.3 JSON::Converter.3 \
		JSON::PP.3 JSON::Parser.3 \
		JSONRPC.3 JSONRPC::Transport::HTTP.3

.include <bsd.port.mk>

