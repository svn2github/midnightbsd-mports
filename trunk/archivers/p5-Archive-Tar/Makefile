# $MidnightBSD$

PORTNAME=	Archive-Tar
PORTVERSION=	2.00
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:BINGOS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for creation and manipulation of tar files
LICENSE=	perl

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-IO-String>=0:${PORTSDIR}/devel/p5-IO-String

PERL_CONFIGURE=	yes
USE_PERL5=	yes

OPTIONS_DEFINE=	TEXTDIFF
TEXTDIFF_DESC=	Text::Diff support for ptardiff

TEXTDIFF_RUN_DEPENDS=	p5-Text-Diff>=0:${PORTSDIR}/textproc/p5-Text-Diff

post-patch:
	@${REINPLACE_CMD} -e 's/5.009/5.666/' ${WRKSRC}/Makefile.PL
	@${REINPLACE_CMD} -e '/EXE_FILES/d' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
