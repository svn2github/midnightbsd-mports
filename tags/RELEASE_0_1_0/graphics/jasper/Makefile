# New ports collection makefile for:	jasper
# Date created:				6 November 1994
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $FreeBSD: ports/graphics/jasper/Makefile,v 1.17 2006/08/14 23:06:34 clsung Exp $
# $MidnightBSD$
#

PORTNAME=	jasper
PORTVERSION=	1.701.0
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://www.ece.uvic.ca/~mdadams/jasper/software/ \
		${MASTER_SITE_IMAGEMAGICK}
MASTER_SITE_SUBDIR=	ImageMagick/delegates

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the codec specified in the JPEG-2000 standard

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg

USE_ZIP=	yes
USE_GNOME=	gnometarget lthack
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--enable-shared --enable-static
USE_LDCONFIG=	yes

MASTER_SITE_IMAGEMAGICK=	\
	ftp://ftp.imagemagick.org/pub/%SUBDIR%/ \
	${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/&,}

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/* ${DOCSDIR}
.endif

.include <bsd.port.mk>
