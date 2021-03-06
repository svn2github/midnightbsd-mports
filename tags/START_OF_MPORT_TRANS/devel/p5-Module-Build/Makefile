# New ports collection makefile for:	Module::Build
# Date created:				29 June 2003
# Whom:                			Dmitry Sivachenko <demon@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Module-Build/Makefile,v 1.1 2007/03/11 05:06:28 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Module-Build/Makefile,v 1.43 2006/12/26 02:22:21 clsung Exp $
#

PORTNAME=	Module-Build
PORTVERSION=	0.28.07
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Module/KWILLIAMS
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/\.(..)$/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build and install Perl modules

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools \
		${SITE_PERL}/Archive/Tar.pm:${PORTSDIR}/archivers/p5-Archive-Tar \
		${SITE_PERL}/ExtUtils/CBuilder.pm:${PORTSDIR}/devel/p5-ExtUtils-CBuilder \
		${SITE_PERL}/ExtUtils/ParseXS.pm:${PORTSDIR}/devel/p5-ExtUtils-ParseXS \
		${SITE_PERL}/YAML.pm:${PORTSDIR}/textproc/p5-YAML
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_MODBUILD=	yes

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes INSTALL README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		requires perl 5.6.0 or later. Install lang/perl5.8 and try again
.endif

MAN3=		Module::Build.3 \
		Module::Build::API.3 \
		Module::Build::Authoring.3 \
		Module::Build::Base.3 \
		Module::Build::Compat.3 \
		Module::Build::ConfigData.3 \
		Module::Build::Cookbook.3 \
		Module::Build::ModuleInfo.3 \
		Module::Build::Notes.3 \
		Module::Build::PPMMaker.3 \
		Module::Build::Platform::Amiga.3 \
		Module::Build::Platform::Default.3 \
		Module::Build::Platform::EBCDIC.3 \
		Module::Build::Platform::MPEiX.3 \
		Module::Build::Platform::MacOS.3 \
		Module::Build::Platform::RiscOS.3 \
		Module::Build::Platform::Unix.3 \
		Module::Build::Platform::VMS.3 \
		Module::Build::Platform::VOS.3 \
		Module::Build::Platform::Windows.3 \
		Module::Build::Platform::aix.3 \
		Module::Build::Platform::cygwin.3 \
		Module::Build::Platform::darwin.3 \
		Module::Build::Platform::os2.3 \
		Module::Build::YAML.3
MAN1=		config_data.1

.if ${PERL_LEVEL} < 500805
RUN_DEPENDS+=	${SITE_PERL}/Pod/Man.pm:${PORTSDIR}/textproc/p5-podlators
.endif

.include <bsd.port.post.mk>
