# New ports collection makefile for:	fpx
# Date created:				Jan 10 2001
# Whom:					Mikhail Teterin <mi@aldan.algebra.com>
#
# $FreeBSD: ports/graphics/libfpx/Makefile,v 1.19 2005/03/01 17:43:34 mi Exp $
# $MidnightBSD: mports/graphics/libfpx/Makefile,v 1.1 2007/01/20 16:08:21 laffer1 Exp $
#

PORTNAME=	libfpx
PORTVERSION=	1.2.0.12
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	ftp://gd.tuwien.ac.at/pub/graphics/%SUBDIR%/ \
		ftp://ftp.sunet.se/pub/multimedia/graphics/%SUBDIR%/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/ImageMagick,} \
		ftp://ftp.crc.ca/pub/packages/graphics/imagemagick/ \
		ftp://ftp.imagemagick.org/pub/%SUBDIR%/ \
		ftp://ftp.planetmirror.com/pub/%SUBDIR%/ \
		ftp://ftp.fu-berlin.de/unix/X11/graphics/%SUBDIR%/ \
		ftp://zoffy.asahi-net.or.jp/pub/graphics/%SUBDIR%/ \
		ftp://ftp.u-aizu.ac.jp/pub/graphics/image/%SUBDIR%/ \
		ftp://ftp.eos.hokudai.ac.jp/pub/graphics/%SUBDIR%/ \
		ftp://ftp.kddlabs.co.jp/graphics/%SUBDIR%/ \
		ftp://ftp.icm.edu.pl/pub/graphics/%SUBDIR%/ \
		ftp://giswitch.sggw.waw.pl/pub/graphics/%SUBDIR%/ \
		ftp://ftp.fifi.org/pub/%SUBDIR%/ \
		ftp://ftp.simplesystems.org/pub/%SUBDIR%/
MASTER_SITE_SUBDIR=ImageMagick/delegates

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library routines for working with Flashpix images
LICENSE=	unknown

MAKE_ARGS+=	-j2
USE_BZIP2=	yes

post-patch:
	${RM} ${WRKSRC}/ri_image/wchar.c

INSTALLS_SHLIB=	yes
MAKEFILE=	${FILESDIR}/Makefile.bsd

.include <bsd.port.mk>
