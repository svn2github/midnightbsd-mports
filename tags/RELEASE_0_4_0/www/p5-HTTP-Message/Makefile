# $MidnightBSD$
# $FreeBSD: ports/www/p5-HTTP-Message/Makefile,v 1.2 2011/04/19 17:50:24 culot Exp $

PORTNAME=	HTTP-Message
PORTVERSION=	6.02
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Representation of HTTP style messages
LICENSE=	perl

RUN_DEPENDS=	p5-Compress-Raw-Zlib>=0:${PORTSDIR}/archivers/p5-Compress-Raw-Zlib \
		p5-Encode-Locale>=1:${PORTSDIR}/converters/p5-Encode-Locale \
		p5-HTML-Parser>=3.33:${PORTSDIR}/www/p5-HTML-Parser \
		p5-HTTP-Date>=6:${PORTSDIR}/www/p5-HTTP-Date \
		p5-IO-Compress>=2.021:${PORTSDIR}/archivers/p5-IO-Compress \
		p5-LWP-MediaTypes>=6:${PORTSDIR}/www/p5-LWP-MediaTypes \
		p5-URI>=1.10:${PORTSDIR}/net/p5-URI
BUILD_DEPENDS:=	${RUN_DEPENDS}

CONFLICTS=	p5-libwww-5*

PERL_CONFIGURE=	yes

MAN3=		HTTP::Config.3 \
		HTTP::Headers.3 \
		HTTP::Headers::Util.3 \
		HTTP::Message.3 \
		HTTP::Request.3 \
		HTTP::Request::Common.3 \
		HTTP::Response.3 \
		HTTP::Status.3

.include <bsd.port.mk>
