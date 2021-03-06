# $MidnightBSD: mports/www/p5-libwww/Makefile,v 1.7 2010/01/17 15:11:28 laffer1 Exp $
# $FreeBSD: ports/www/p5-libwww/Makefile,v 1.72 2006/12/03 12:45:59 demon Exp $

PORTNAME=	libwww
PORTVERSION=	5.836
CATEGORIES=	www perl5 devel
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	LWP
PKGNAMEPREFIX=	p5-
DISTNAME=	libwww-perl-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 library for WWW access
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/URI.pm:${PORTSDIR}/net/p5-URI \
		${SITE_PERL}/Net/FTP.pm:${PORTSDIR}/net/p5-Net \
		${SITE_PERL}/${PERL_ARCH}/HTML/Parser.pm:${PORTSDIR}/www/p5-HTML-Parser
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	--aliases

MAN1=	GET.1 HEAD.1 POST.1 lwp-download.1 lwp-mirror.1 \
	lwp-request.1 lwp-rget.1 lwp-dump.1

MAN3=	Bundle::LWP.3 File::Listing.3 HTML::Form.3 HTTP::Config.3 \
	HTTP::Cookies.3 \
	HTTP::Cookies::Microsoft.3 HTTP::Cookies::Netscape.3 \
	HTTP::Daemon.3 HTTP::Date.3 HTTP::Headers.3 \
	HTTP::Headers::Util.3 HTTP::Message.3 HTTP::Negotiate.3 \
	HTTP::Request.3 HTTP::Request::Common.3 HTTP::Response.3 \
	HTTP::Status.3 LWP.3 LWP::Authen::Ntlm.3 LWP::ConnCache.3 \
	LWP::Debug.3 LWP::MediaTypes.3 \
	LWP::MemberMixin.3 LWP::Protocol.3 LWP::RobotUA.3 LWP::Simple.3 \
	LWP::UserAgent.3 Net::HTTP.3 Net::HTTP::NB.3 WWW::RobotRules.3 \
	WWW::RobotRules::AnyDBM_File.3 lwpcook.3 lwptut.3

post-patch:
	@${PERL} -pi -e "s,/usr/lib/sendmail,/usr/sbin/sendmail," \
		${WRKSRC}/lib/LWP/Protocol/mailto.pm
	@${PERL} -pi -e 's!(?=prompt\()!1 || !g' ${WRKSRC}/Makefile.PL


.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501000
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Digest/MD5.pm:${PORTSDIR}/security/p5-Digest-MD5 \
		${SITE_PERL}/${PERL_ARCH}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib \
                ${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64
BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Digest/MD5.pm:${PORTSDIR}/security/p5-Digest-MD5 \
		${SITE_PERL}/${PERL_ARCH}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib \
                ${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64
.endif

.include <bsd.port.post.mk>

