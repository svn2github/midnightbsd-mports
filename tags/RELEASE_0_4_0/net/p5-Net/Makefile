# $MidnightBSD: mports/net/p5-Net/Makefile,v 1.4 2010/05/26 00:07:07 laffer1 Exp $

PORTNAME=	Net
PORTVERSION=	1.22
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	libnet-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 modules to access and use network protocols
LICENSE=	perl

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	< /dev/null

MAN3=		Net::Cmd.3 \
		Net::Config.3 \
		Net::Domain.3 \
		Net::FTP.3 \
		Net::NNTP.3 \
		Net::Netrc.3 \
		Net::POP3.3 \
		Net::SMTP.3 \
		Net::Time.3 \
		Net::libnetFAQ.3

.include <bsd.port.pre.mk>

RUN_DEPENDS+=	${SITE_PERL}/Authen/SASL.pm:${PORTSDIR}/security/p5-Authen-SASL

.include <bsd.port.post.mk>
