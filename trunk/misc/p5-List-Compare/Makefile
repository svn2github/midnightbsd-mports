# New ports collection makefile for:	p5-List-Compare
# Date created:				23 Oct 2004
# Whom:					Dmitry Morozovsky <marck@FreeBSD.org>
#
# $FreeBSD: ports/misc/p5-List-Compare/Makefile,v 1.3 2006/05/29 13:45:51 erwin Exp $
# $MidnightBSD$
#

PORTNAME=		List-Compare
PORTVERSION=	0.37
CATEGORIES=		misc perl5
MASTER_SITES=		CPAN
PKGNAMEPREFIX=		p5-

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Perl extension for comparing lists
LICENSE=		perl

PERL_CONFIGURE=		yes

MAN3=			List::Compare.3 \
			List::Compare::Base::_Auxiliary.3 \
			List::Compare::Base::_Engine.3 \
			List::Compare::Functional.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
