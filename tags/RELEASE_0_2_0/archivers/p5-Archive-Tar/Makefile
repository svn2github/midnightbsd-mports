# New ports collection makefile for:	p5-Archive-Tar
# Date created:				Nov 14 2000
# Whom:	      				Roman Shterenzon <roman@xpert.com>
#
# $MidnightBSD: mports/archivers/p5-Archive-Tar/Makefile,v 1.2 2007/07/22 08:23:59 laffer1 Exp $
# $FreeBSD: ports/archivers/p5-Archive-Tar/Makefile,v 1.25 2006/08/02 15:33:47 clsung Exp $
#

PORTNAME=	Archive-Tar
PORTVERSION=	1.38
CATEGORIES=	archivers perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Archive
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for creation and manipulation of tar files
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/IO/Zlib.pm:${PORTSDIR}/archivers/p5-IO-Zlib \
		${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools \
		${SITE_PERL}/IO/String.pm:${PORTSDIR}/devel/p5-IO-String
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	YES

MAN1=		ptardiff.1 ptar.1
MAN3=		Archive::Tar.3 Archive::Tar::File.3

OPTIONS=	TEXT_DIFF "Text::Diff support for ptardiff" off

.include <bsd.port.pre.mk>

.if defined(WITH_TEXT_DIFF)
RUN_DEPENDS+=	${SITE_PERL}/Text/Diff.pm:${PORTSDIR}/textproc/p5-Text-Diff
.endif

.include <bsd.port.post.mk>
