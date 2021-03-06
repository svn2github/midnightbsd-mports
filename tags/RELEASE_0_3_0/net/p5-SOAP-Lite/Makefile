# New ports collection makefile for:	p5-SOAP-Lite
# Date created:				Oct 11, 2008
# Whom:					Lucas Holt
#
# $MidnightBSD: mports/net/p5-SOAP-Lite/Makefile,v 1.1 2008/10/11 20:19:00 laffer1 Exp $

PORTNAME=	SOAP-Lite
PORTVERSION=	0.69
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SOAP::Lite - Client and server side SOAP implementation
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/MIME/Lite.pm:${PORTSDIR}/mail/p5-MIME-Lite \
		${SITE_PERL}/MIME/Tools.pm:${PORTSDIR}/mail/p5-MIME-Tools \
		${SITE_PERL}/LWP.pm:${PORTSDIR}/www/p5-libwww \
		${SITE_PERL}/${PERL_ARCH}/Crypt/SSLeay.pm:${PORTSDIR}/security/p5-Crypt-SSLeay \
		${SITE_PERL}/IO/Socket/SSL.pm:${PORTSDIR}/security/p5-IO-Socket-SSL \
		${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser
BUILD_DEPENDS=	${RUN_DEPENDS}

CONFLICTS=	p5-SOAP-Lite-0.60*

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	--noprompt
INSTALL_TARGET=	pure_install

MAN1=		SOAPsh.pl.1 XMLRPCsh.pl.1 stubmaker.pl.1
MAN3=		Apache::SOAP.3 \
		Apache::XMLRPC::Lite.3 \
		OldDocs::SOAP::Lite.3 \
		OldDocs::SOAP::Transport::FTP.3 \
		OldDocs::SOAP::Transport::HTTP.3 \
		OldDocs::SOAP::Transport::IO.3 \
		OldDocs::SOAP::Transport::JABBER.3 \
		OldDocs::SOAP::Transport::LOCAL.3 \
		OldDocs::SOAP::Transport::MAILTO.3 \
		OldDocs::SOAP::Transport::MQ.3 \
		OldDocs::SOAP::Transport::POP3.3 \
		OldDocs::SOAP::Transport::TCP.3 \
		SOAP::Client.3 \
		SOAP::Constants.3 \
		SOAP::Data.3 \
		SOAP::Deserializer.3 \
		SOAP::Fault.3 \
		SOAP::Header.3 \
		SOAP::Lite.3 \
		SOAP::Packager.3 \
		SOAP::SOM.3 \
		SOAP::Schema.3 \
		SOAP::Serializer.3 \
		SOAP::Server.3 \
		SOAP::Test.3 \
		SOAP::Trace.3 \
		SOAP::Transport.3 \
		SOAP::Transport::POP3.3 \
		SOAP::Utils.3 \
		UDDI::Lite.3 \
		XML::Parser::Lite.3 \
		XMLRPC::Lite.3 \
		XMLRPC::Test.3 \
		XMLRPC::Transport::HTTP.3 \
		XMLRPC::Transport::POP3.3 \
		XMLRPC::Transport::TCP.3

post-patch:
	@${REINPLACE_CMD} -i '' -e 's|^#!.*perl|#!${PERL}|' \
		${WRKSRC}/bin/* ${WRKSRC}/t/*

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501000
RUN_DEPENDS+=	${SITE_PERL}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib
.endif

.include <bsd.port.post.mk>
