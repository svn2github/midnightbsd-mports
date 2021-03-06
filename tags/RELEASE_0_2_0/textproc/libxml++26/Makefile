# ex:ts=8
# New ports collection makefile for:	libxml++
# Date created:			Feb 26, 2001
# Whom:				Ying-Chieh Liao <ijliao@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/libxml++26/Makefile,v 1.40 2007/05/28 04:24:28 marcus Exp $
#   $MCom: ports/textproc/libxml++26/Makefile,v 1.18 2007/03/07 19:06:06 marcus Exp $
#

PORTNAME=	libxml++
PORTVERSION=	2.18.0
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML API for C++
LICENSE=	lgpl

LIB_DEPENDS=	glibmm-2.4.1:${PORTSDIR}/devel/glibmm
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

LATEST_LINK=	libxml++26

USE_GMAKE=	yes
USE_GCC=	3.4+
USE_GNOME=	gnomehack gnometarget libxml2 pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

PLIST_SUB=	VERSION="2.6" API_VERSION="2.6" DOC_VERSION=${PORTVERSION:R}

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/examples//' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e '/^gentoo_ltmain_version=/s/`.*`/$$gentoo_lt_version/' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/^library_configdir =/s/libdir/includedir/' \
	    	${WRKSRC}/libxml++/Makefile.in
	@${REINPLACE_CMD} -e '/^Cflags:/s/libdir/includedir/' \
	    	${WRKSRC}/libxml++-2.6.pc.in
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -E '/^SUBDIRS = /s/(docs|examples)//g' ${WRKSRC}/Makefile.in
.endif

.if !defined(NOPORTDOCS)
post-configure:
	@${TOUCH} ${WRKSRC}/docs/reference/${PORTVERSION:R}/html/index.html
.endif

.include <bsd.port.mk>
