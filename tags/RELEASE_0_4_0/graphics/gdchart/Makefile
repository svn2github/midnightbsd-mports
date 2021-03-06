# New ports collection makefile for:	gdchart
# Date created:         4 June 2001
# Whom:                 Anders Nordby <anders@fix.no>
#
# $MidnightBSD: mports/graphics/gdchart/Makefile,v 1.2 2010/03/25 01:28:08 laffer1 Exp $
# $FreeBSD: ports/graphics/gdchart/Makefile,v 1.18 2007/05/19 20:09:09 flz Exp $
#

PORTNAME=	gdchart
PORTVERSION=	0.11.5
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://www.fred.net/brv/chart/ \
		ftp://ftp.nuug.no/pub/anders/distfiles/
DISTNAME=	${PORTNAME}${PORTVERSION}dev

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy to use, fast C API for creating charts and graphs
LICENSE=	other

LIB_DEPENDS=	gd.4:${PORTSDIR}/graphics/gd \
		jpeg:${PORTSDIR}/graphics/jpeg \
		freetype:${PORTSDIR}/print/freetype2

MAKEFILE=	${FILESDIR}/Makefile
MAKE_ARGS=	PREFIX="${PREFIX}" LOCALBASE="${LOCALBASE}"
USE_LDCONFIG=	yes

DOCS=		README.txt
EXAMPLES=	ft_samp.c gdc_pie_samp.c gdc_samp1.c gdc_samp2.c

.if defined(NOPROFILE)
PLIST_SUB+=	PROFILE="@comment "
.else
PLIST_SUB+=	PROFILE=
.endif

post-patch:
	${REINPLACE_CMD} \
		-e 's/^#ifdef HAVE_JPEG/#ifndef NO_JPEG/' \
		-e 's/^#ifdef HAVE_LIBFREETYPE/#ifndef NO_LIBFREETYPE/' \
			${WRKSRC}/*.[ch]
# ft_samp.c and gdc_samp?.c miss #include "gdcpie.h"
	${REINPLACE_CMD} \
		-e 's/^#include "gdc\.h"/#include "gdcpie.h"/' \
			${WRKSRC}/ft_samp.c \
			${WRKSRC}/gdc_samp?.c
# gdc_pie_samp.c misses #include "gdchart.h"
	${REINPLACE_CMD} \
		-e 's/^#include "gdc\.h"/#include "gdchart.h"/' \
			${WRKSRC}/gdc_pie_samp.c

post-install:
.if !defined(NOPORTDOCS)
.for f in ${DOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
.endif
.if !defined(NOPORTEXAMPLES)
.for f in ${EXAMPLES}
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/${f} ${EXAMPLESDIR}/
.endfor
.endif

.include <bsd.port.mk>
