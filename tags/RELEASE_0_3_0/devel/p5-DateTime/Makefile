# $MidnightBSD: mports/devel/p5-DateTime/Makefile,v 1.2 2009/10/07 00:30:55 laffer1 Exp $

PORTNAME=	DateTime
PORTVERSION=	0.63
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A date and time object
LICENSE=	perl

RUN_DEPENDS=	p5-DateTime-Locale>=0.41:${PORTSDIR}/devel/p5-DateTime-Locale \
		p5-DateTime-TimeZone>=1.09:${PORTSDIR}/devel/p5-DateTime-TimeZone \
		p5-Params-Validate>=0.76:${PORTSDIR}/devel/p5-Params-Validate
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		DateTime.3 DateTime::Duration.3 \
		DateTime::Infinite.3 \
		DateTime::LeapSecond.3

.if !defined(NOPORTDOCS)
PORTDOCS=	CREDITS Changes TODO

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
