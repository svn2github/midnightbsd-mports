# New ports collection makefile for:	XML::Parser
# Date created:		15 Nov 1998
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/p5-XML-Parser/Makefile,v 1.3 2008/06/08 23:56:53 crash Exp $
# $FreeBSD: ports/textproc/p5-XML-Parser/Makefile,v 1.26 2006/01/30 23:19:59 kuriyama Exp $
#

PORTNAME=	XML-Parser
PORTVERSION=	2.36
PORTREVISION=	2
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension interface to James Clark's XML parser, expat
LICENSE=	perl

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	EXPATLIBPATH=${LOCALBASE}/lib EXPATINCPATH=${LOCALBASE}/include

MAN3=		XML::Parser.3 XML::Parser::Expat.3 \
		XML::Parser::Style::Debug.3 \
		XML::Parser::Style::Objects.3 \
		XML::Parser::Style::Stream.3 \
		XML::Parser::Style::Subs.3 \
		XML::Parser::Style::Tree.3
PLIST_SUB=	EUCJP=${EUCJP} SJIS=${SJIS}

# XMLPARSER_EUCJP=	x-euc-jp-(jisx0221|unicode)
# XMLPARSER_SJIS=	x-sjis-(cp932|jdk117|jisx0221|unicode)
CONV_ENC=	${PERL} -e '$$e=shift @ARGV; undef $$/; $$_=<>; substr($$_,4,40)=pack("a40","$$e"); print'
.if !defined(XMLPARSER_EUCJP)
EUCJP=		"@comment "
.endif
.if !defined(XMLPARSER_SJIS)
SJIS=		"@comment "
.endif

post-patch:
.if defined(XMLPARSER_EUCJP)
	@cd ${WRKSRC}/Parser/Encodings; \
		${CONV_ENC} euc-jp ${XMLPARSER_EUCJP}.enc > euc-jp.enc
	@${ECHO_CMD} Parser/Encodings/euc-jp.enc >> ${WRKSRC}/MANIFEST
.endif
.if defined(XMLPARSER_SJIS)
	@cd ${WRKSRC}/Parser/Encodings; \
		${CONV_ENC} shift_jis ${XMLPARSER_SJIS}.enc > shift_jis.enc
	@${ECHO_CMD} Parser/Encodings/Shift_JIS.enc >> ${WRKSRC}/MANIFEST
.endif

post-configure:
	@${PERL} -i -pe 's|^(CC = ).*|$$1 ${CC}|;' \
		-e 's|^(CCFLAGS = ).*|$$1 ${CFLAGS}|' ${WRKSRC}/Expat/Makefile

.include <bsd.port.mk>
