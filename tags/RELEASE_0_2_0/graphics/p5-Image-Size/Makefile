# New ports collection makefile for:	p5-Image-Size
# Date created:				October 20th 1996
# Whom:	      				James FitzGibbon <jfitz@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/p5-Image-Size/Makefile,v 1.37 2006/12/03 12:45:57 demon Exp $
#

PORTNAME=	Image-Size
PORTVERSION=	3.01
CATEGORIES=	graphics www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Image
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to determine the size of images in several common formats

BUILD_DEPENDS=	${SITE_PERL}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_MODBUILD=	yes

MAN1=		imgsize.1
MAN3=		Image::Size.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
IGNORE=		requires at least Perl 5.6. Please install lang/perl5.8 and try again
.endif

.include <bsd.port.post.mk>
