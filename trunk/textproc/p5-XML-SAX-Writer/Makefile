# $MidnightBSD$

PORTNAME=	XML-SAX-Writer
PORTVERSION=	0.50
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SAX2 XML Writer
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/XML/SAX/Exception.pm:${PORTSDIR}/textproc/p5-XML-SAX \
		${SITE_PERL}/XML/NamespaceSupport.pm:${PORTSDIR}/textproc/p5-XML-NamespaceSupport \
		${SITE_PERL}/${PERL_ARCH}/Text/Iconv.pm:${PORTSDIR}/converters/p5-Text-Iconv \
		${SITE_PERL}/XML/Filter/BufferText.pm:${PORTSDIR}/textproc/p5-XML-Filter-BufferText
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		XML::SAX::Writer.3 XML::SAX::Writer::XML.3

.include <bsd.port.mk>
