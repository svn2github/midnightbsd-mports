# New ports collection makefile for:	p5-Image-Info
# Date Created:				25 Aug 2001
# Whom:					Shell Hung <shell@shellhung.org>
#
# $MidnightBSD: mports/graphics/p5-Image-Info/Makefile,v 1.1 2007/03/11 04:53:16 laffer1 Exp $
# $FreeBSD: ports/graphics/p5-Image-Info/Makefile,v 1.13 2006/12/03 12:45:57 demon Exp $
#

PORTNAME=	Image-Info
PORTVERSION=	1.28
CATEGORIES=	graphics perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Image
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for getting image information
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib \
		${SITE_PERL}/IO/String.pm:${PORTSDIR}/devel/p5-IO-String \
		${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Image::Info.3 Image::Info::BMP.3 Image::Info::SVG.3 \
		Image::Info::TIFF.3 Image::Info::PPM.3 \
		Image::Info::XBM.3 Image::Info::XPM.3

.include <bsd.port.mk>

