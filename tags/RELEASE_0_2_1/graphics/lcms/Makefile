# New ports collection makefile for:	lcms
# Date created:		October 30, 2000
# Whom:			Mikhail Teterin <mi@aldan.algebra.com>
#
# $MidnightBSD: mports/graphics/lcms/Makefile,v 1.2 2008/06/25 16:01:07 laffer1 Exp $
# $FreeBSD: ports/graphics/lcms/Makefile,v 1.23 2006/08/10 20:59:53 miwi Exp $
#

PORTNAME=	lcms
PORTVERSION=	1.17
PORTEPOCH=	1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://www.littlecms.com/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Light Color Management System -- a color management library
LICENSE=	mit

USE_GNOME=	gnomehack gnometarget lthack
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-jpeg --without-tiff
CONFIGURE_ENV=	CFLAGS="${CFLAGS} -I${LOCALBASE}/include" \
		CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|^SUBDIRS =.*$$|SUBDIRS = src include|g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's|-O3||g' ${WRKSRC}/src/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in doc/LCMSAPI.TXT doc/TUTORIAL.TXT tifficc/tifficc.c \
	jpegicc/jpegicc.c jpegicc/iccjpeg.c samples/wtpt.c samples/icctrans.c
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

post-build test:
	cd ${WRKSRC}/testbed && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.mk>
