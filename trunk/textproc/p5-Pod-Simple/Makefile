# $MidnightBSD$

PORTNAME=	Pod-Simple
PORTVERSION=	3.14
CATEGORIES=	textproc devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for parsing Pod
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Pod::Simple.3 \
		Pod::Simple::Checker.3 \
		Pod::Simple::Debug.3 \
		Pod::Simple::DumpAsText.3 \
		Pod::Simple::DumpAsXML.3 \
		Pod::Simple::HTML.3 \
		Pod::Simple::HTMLBatch.3 \
		Pod::Simple::LinkSection.3 \
		Pod::Simple::Methody.3 \
		Pod::Simple::PullParser.3 \
		Pod::Simple::PullParserEndToken.3 \
		Pod::Simple::PullParserStartToken.3 \
		Pod::Simple::PullParserTextToken.3 \
		Pod::Simple::PullParserToken.3 \
		Pod::Simple::RTF.3 \
		Pod::Simple::Search.3 \
		Pod::Simple::SimpleTree.3 \
		Pod::Simple::Subclassing.3 \
		Pod::Simple::Text.3 \
		Pod::Simple::TextContent.3 \
		Pod::Simple::XHTML.3 \
		Pod::Simple::XMLOutStream.3 \
		perlpod.3 \
		perlpodspec.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500903
RUN_DEPENDS+=	p5-Pod-Escapes>=1.04:${PORTSDIR}/textproc/p5-Pod-Escapes
BUILD_DEPENDS+=	p5-Pod-Escapes>=1.04:${PORTSDIR}/textproc/p5-Pod-Escapes
.endif

.include <bsd.port.post.mk>
