# New ports collection makefile for:	p5-Template-Toolkit
# Date Created:				3 Mar, 2001
# Whom:					clive
#
# $MidnightBSD: mports/www/p5-Template-Toolkit/Makefile,v 1.1 2007/03/11 05:44:06 laffer1 Exp $
# $FreeBSD: ports/www/p5-Template-Toolkit/Makefile,v 1.24 2007/02/08 14:38:13 clsung Exp $
#

PORTNAME=	Template-Toolkit
PORTVERSION=	2.18
CATEGORIES=	www textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Template
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensive Toolkit for template processing

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools \
		${SITE_PERL}/File/Temp.pm:${PORTSDIR}/devel/p5-File-Temp \
		${SITE_PERL}/AppConfig.pm:${PORTSDIR}/devel/p5-AppConfig
RUN_DEPENDS=	${BUILD_DEPENDS}

OPTIONS=TEXT_AUTOFORMAT "With Text::Autoformat Plugin"		off \
	IMAGE_INFO	"With Image::Info Plugin"		off \
	IMAGE_SIZE	"With Image::Size Plugin"		off \
	DATE_CALC	"With Date::Calc Plugin"		off \
	POD_POM		"With Pod::POM Plugin"			off

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	TT_ACCEPT=y

MASTER_SITE_BACKUP+=	http://www.template-toolkit.org/download/

.include <bsd.port.pre.mk>

.if defined(WITH_TEXT_AUTOFORMAT)
BUILD_DEPENDS+=${SITE_PERL}/Text/Autoformat.pm:${PORTSDIR}/textproc/p5-Text-Autoformat
.endif
.if defined(WITH_IMAGE_INFO)
BUILD_DEPENDS+=${SITE_PERL}/Image/Info.pm:${PORTSDIR}/graphics/p5-Image-Info
.endif
.if defined(WITH_IMAGE_SIZE)
BUILD_DEPENDS+=${SITE_PERL}/Image/Size.pm:${PORTSDIR}/graphics/p5-Image-Size
.endif
.if defined(WITH_DATE_CALC)
BUILD_DEPENDS+=${SITE_PERL}/${PERL_ARCH}/Date/Calc.pm:${PORTSDIR}/devel/p5-Date-Calc
.endif
.if defined(WITH_POD_POM)
BUILD_DEPENDS+=${SITE_PERL}/Pod/POM.pm:${PORTSDIR}/textproc/p5-Pod-POM
.endif

.if defined(BATCH)
CONFIGURE_ENV=	|
.endif

.include "Makefile.man"

post-patch:
	${PERL} -pi -e 's,/usr/local/tt2,${TARGETDIR}/share/tt2,g' \
		${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}

.if ${PERL_LEVEL} < 500600
IGNORE=		requires perl 5.6.0 or later. Install lang/perl5.8 and try again
.endif

.include <bsd.port.post.mk>
