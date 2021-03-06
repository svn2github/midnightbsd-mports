# New ports collection makefile for:	p5-Net-DNS
# Date created:				April 5th 1997
# Whom:	      				James FitzGibbon <jfitz@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/dns/p5-Net-DNS/Makefile,v 1.66 2006/09/27 23:40:21 dougb Exp $
#

PORTNAME=	Net-DNS
PORTVERSION=	0.61
CATEGORIES=	dns net perl5 ipv6
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Net
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to the DNS resolver, and dynamic updates
LICENSE=	perl

# Warnings during build are harmless, the port does not need these to build
RUN_DEPENDS=	ipcount:${PORTSDIR}/net-mgmt/p5-Net-IP \
		${SITE_PERL}/Digest/HMAC_MD5.pm:${PORTSDIR}/security/p5-Digest-HMAC

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	--online-tests

MAN3=		Net::DNS.3 Net::DNS::Header.3 Net::DNS::Packet.3 \
		Net::DNS::Question.3 Net::DNS::RR.3 Net::DNS::RR::A.3 \
		Net::DNS::RR::AFSDB.3 Net::DNS::RR::CNAME.3 \
		Net::DNS::RR::HINFO.3 Net::DNS::RR::ISDN.3 Net::DNS::RR::MG.3 \
		Net::DNS::RR::MINFO.3 Net::DNS::RR::MR.3 Net::DNS::RR::MX.3 \
		Net::DNS::RR::NS.3 Net::DNS::RR::PTR.3 Net::DNS::RR::RP.3 \
		Net::DNS::RR::RT.3 Net::DNS::RR::SOA.3 Net::DNS::RR::SRV.3 \
		Net::DNS::RR::TXT.3 Net::DNS::RR::X25.3 Net::DNS::Resolver.3 \
		Net::DNS::RR::AAAA.3 Net::DNS::RR::EID.3 Net::DNS::RR::LOC.3 \
		Net::DNS::RR::MB.3 Net::DNS::RR::NAPTR.3 \
		Net::DNS::RR::NIMLOC.3 Net::DNS::RR::NSAP.3 \
		Net::DNS::RR::NULL.3 Net::DNS::RR::PX.3 Net::DNS::Update.3 \
		Net::DNS::Nameserver.3 Net::DNS::RR::CERT.3 \
		Net::DNS::FAQ.3 Net::DNS::RR::TKEY.3 \
		Net::DNS::RR::OPT.3 Net::DNS::RR::TSIG.3 Net::DNS::RR::DNAME.3 \
		Net::DNS::Resolver::Win32.3 Net::DNS::RR::SSHFP.3 \
		Net::DNS::Resolver::Base.3 Net::DNS::Resolver::UNIX.3 \
		Net::DNS::RR::Unknown.3 Net::DNS::Resolver::Recurse.3 \
		Net::DNS::Resolver::Cygwin.3 Net::DNS::RR::SPF.3

OPTIONS=	IPV6 "Enable functionality over IPv6 transport" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_IPV6)
RUN_DEPENDS+=	${SITE_PERL}/IO/Socket/INET6.pm:${PORTSDIR}/net/p5-IO-INET6
.endif

DOCSDIR=	${PREFIX}/share/doc/p5-Net-DNS

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for doc in Changes README TODO
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
