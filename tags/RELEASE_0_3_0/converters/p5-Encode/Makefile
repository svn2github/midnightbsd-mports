# $MidnightBSD: mports/converters/p5-Encode/Makefile,v 1.4 2009/09/20 03:52:08 laffer1 Exp $

PORTNAME=	Encode
PORTVERSION=	2.40
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides interfaces between strings and the rest of the system
LICENSE=        perl

PERL_CONFIGURE=	5.7.3+

MAN3=		Encode.3 \
		Encode::Alias.3 \
		Encode::CJKConstants.3 \
		Encode::CN::HZ.3 \
		Encode::Config.3 \
		Encode::Encoder.3 \
		Encode::Encoding.3 \
		Encode::GSM0338.3 \
		Encode::Guess.3 \
		Encode::JP::H2Z.3 \
		Encode::JP::JIS7.3 \
		Encode::KR::2022_KR.3 \
		Encode::MIME::Header.3 \
		Encode::MIME::Name.3 \
		Encode::PerlIO.3 \
		Encode::Supported.3 \
		Encode::Unicode::UTF7.3 \
		encoding.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} > 500800
post-patch:
	${PERL} -pi -e '$$_="" if $$.>=24 && $$.<=26; $$_="my \@exe_files=();\n" if $$.==25' ${WRKSRC}/Makefile.PL
.endif

post-configure:
	@${FIND} ${WRKSRC}/ -name Makefile -exec \
		${REINPLACE_CMD} -e 's,^CC =,CC ?=,' {} \;

.include <bsd.port.post.mk>
