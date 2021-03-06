# New ports collection makefile for:	jpeg
# Date created:		6 November 1994
# Whom:			smace
#
# $MidnightBSD: mports/graphics/jpeg/Makefile,v 1.3 2008/06/13 02:24:56 laffer1 Exp $
# $FreeBSD: ports/graphics/jpeg/Makefile,v 1.43 2006/02/23 10:37:06 ade Exp $
#
# PLEASE update print/ghostscript5 (there's a symlink that uses a hardwired
# version number) when updating this port.  Thank you.

PORTNAME=	jpeg
PORTVERSION=	6b
PORTREVISION=	4
CATEGORIES=	graphics
MASTER_SITES=	http://www.ijg.org/files/ \
		ftp://ftp.uu.net/graphics/jpeg/ \
		http://sylvana.net/jpegcrop/:exif
DISTNAME=	jpegsrc.v${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		jpegexiforient.c:exif exifautotran.txt:exif
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IJG's jpeg compression utilities
LICENSE=	other

WRKSRC=		${WRKDIR}/jpeg-6b

USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-shared --enable-static

ADDITIONAL_HEADER=	jinclude.h jpegint.h

# define J_MAXMEM like "make J_MAXMEM=32" to limit max processing memory to 32Mb
.if defined(J_MAXMEM)
CONFIGURE_ARGS+=	--enable-maxmem=${J_MAXMEM}
.endif

MAN1=		cjpeg.1 djpeg.1 jpegtran.1 rdjpgcom.1 wrjpgcom.1

post-extract:
	@${CP} ${DISTDIR}/jpegexiforient.c ${WRKSRC}/
	@${CP} ${DISTDIR}/exifautotran.txt ${WRKSRC}/exifautotran

post-build:
	@cd ${WRKSRC} && ${CC} ${CFLAGS} -o jpegexiforient jpegexiforient.c

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/share/doc/jpeg
	@${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/jpeg
	@${INSTALL_DATA} ${WRKSRC}/*.doc ${PREFIX}/share/doc/jpeg
.endif
.for header in ${ADDITIONAL_HEADER}
	@${INSTALL_DATA} ${WRKSRC}/${header} ${PREFIX}/include
.endfor
	${INSTALL_PROGRAM} ${WRKSRC}/jpegexiforient ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/exifautotran ${PREFIX}/bin

.include <bsd.port.mk>
