# New ports collection makefile for:    p5-Mail-SPF
# Date created:                         Thu Feb 8 18:46:25 CET 2007
# Whom:                                 gmc@sonologic.nl
#
# $MidnightBSD: mports/mail/p5-Mail-SPF/Makefile,v 1.4 2009/09/24 03:03:40 laffer1 Exp $
# $FreeBSD: ports/mail/p5-Mail-SPF/Makefile,v 1.1 2007/02/10 16:39:01 miwi Exp $
#

PORTNAME=	Mail-SPF
PORTVERSION=	2.007
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference implementation of the RFC 4408 SPF protocol
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Net/DNS/Resolver/Programmable.pm:${PORTSDIR}/dns/p5-Net-DNS-Resolver-Programmable \
		${SITE_PERL}/${PERL_ARCH}/Net/DNS.pm:${PORTSDIR}/dns/p5-Net-DNS \
		${SITE_PERL}/Error.pm:${PORTSDIR}/lang/p5-Error \
		${SITE_PERL}/${PERL_ARCH}/NetAddr/IP.pm:${PORTSDIR}/net-mgmt/p5-NetAddr-IP \
		${SITE_PERL}/URI.pm:${PORTSDIR}/net/p5-URI
BUILD_DEPENDS=	${RUN_DEPENDS}

CONFLICTS=	p5-Mail-SPF-Query-[0-9]*

PERL_MODBUILD=	yes
CONFIGURE_ARGS=	--install_path sbin=${PREFIX}/sbin

MAN1=		spfquery.1
MAN3=		Mail::SPF.3 Mail::SPF::Mech::PTR.3 Mail::SPF::Mech.3 \
		Mail::SPF::SenderIPAddrMech.3 Mail::SPF::MacroString.3 \
		Mail::SPF::Mech::IP4.3 Mail::SPF::Mech::A.3 \
		Mail::SPF::Request.3 Mail::SPF::Result.3 Mail::SPF::Mod.3 \
		Mail::SPF::Mod::Exp.3 Mail::SPF::Mech::MX.3 \
		Mail::SPF::Server.3 Mail::SPF::Util.3 Mail::SPF::Mech::IP6.3 \
		Mail::SPF::Record.3 Mail::SPF::Mech::Include.3 \
		Mail::SPF::v2::Record.3 Mail::SPF::Mod::Redirect.3 \
		Mail::SPF::Base.3 Mail::SPF::Mech::All.3 Mail::SPF::Term.3 \
		Mail::SPF::v1::Record.3 Mail::SPF::Mech::Exists.3

.include <bsd.port.pre.mk>

DOCSDIR=	${PREFIX}/share/doc/p5-Mail-SPF
DOCS=		CHANGES INSTALL LICENSE README TODO

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.post.mk>
