# $MidnightBSD: mports/devel/p5-Time-Local/Makefile,v 1.4 2011/09/15 03:08:57 laffer1 Exp $

PORTNAME=	Time-Local
PORTVERSION=	1.23.00
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Efficiently compute time from local and GMT time
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Time::Local.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
