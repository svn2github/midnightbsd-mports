# New ports collection makefile for:	kooka
# Date created:				July 09 2004
# Whom:					Michael Nottebrock <lofi@FreeBSD.org>
#
# $FreeBSD: ports/graphics/kooka/Makefile,v 1.14 2006/09/12 23:26:18 lofi Exp $
# $MidnightBSD: mports/graphics/kooka/Makefile,v 1.1 2007/01/26 03:34:00 laffer1 Exp $
#

PORTNAME=	kooka
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
PKGNAMEPREFIX=	kdegraphics-
DISTNAME=	kdegraphics-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Raster image scan program for KDE

LIB_DEPENDS=	sane.1:${PORTSDIR}/graphics/sane-backends
RUN_DEPENDS=	${LOCALBASE}/bin/gocr:${PORTSDIR}/graphics/gocr

CONFLICTS=	kdegraphics-3.1.* kdegraphics-3.2.[0-3]

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool:15
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/kdegraphics-${PORTVERSION}
USE_LDCONFIG=	yes

pre-configure:
	${ECHO_CMD} libkscan ${PORTNAME} doc > ${WRKSRC}/inst-apps
	${REINPLACE_CMD} \
	's|^SUBDIRS =.*${PORTNAME}.*$$|SUBDIRS =\. ${PORTNAME}|g' \
		${WRKSRC}/doc/Makefile.in

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.mk>
