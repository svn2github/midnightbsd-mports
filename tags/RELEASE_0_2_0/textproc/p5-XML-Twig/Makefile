# New ports collection makefile for:	p5-XML-Twig
# Date created:		13 August 2001
# Whom:	      		Johann Visagie <wjv@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/p5-XML-Twig/Makefile,v 1.1 2007/03/19 16:38:36 laffer1 Exp $
# $FreeBSD: ports/textproc/p5-XML-Twig/Makefile,v 1.19 2007/01/23 13:22:33 miwi Exp $
#

PORTNAME=	XML-Twig
PORTVERSION=	3.29
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Process huge XML documents by chunks via a tree interface

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Text/Iconv.pm:${PORTSDIR}/converters/p5-Text-Iconv \
		${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${SITE_PERL}/Tie/IxHash.pm:${PORTSDIR}/devel/p5-Tie-IxHash \
		${SITE_PERL}/XML/Handler/YAWriter.pm:${PORTSDIR}/textproc/p5-XML-Handler-YAWriter \
		${SITE_PERL}/XML/SAX/Writer.pm:${PORTSDIR}/textproc/p5-XML-SAX-Writer \
		${SITE_PERL}/XML/XPath.pm:${PORTSDIR}/textproc/p5-XML-XPath \
		${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple \
		${SITE_PERL}/LWP.pm:${PORTSDIR}/www/p5-libwww \
		p5-HTML-Tree>3:${PORTSDIR}/www/p5-HTML-Tree
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES
CONFIGURE_ARGS+=	-y

MAN1=		xml_grep.1 xml_merge.1 xml_pp.1 xml_spellcheck.1 xml_split.1
MAN3=		XML::Twig.3

.include <bsd.port.mk>
