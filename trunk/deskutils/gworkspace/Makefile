# New ports collection makefile for:    gworkspace
# Date created:         04 Feb 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/deskutils/gworkspace/Makefile,v 1.27 2006/09/01 17:12:26 dinoex Exp $
#

PORTNAME=	gworkspace
PORTVERSION=	0.9.1
CATEGORIES=	deskutils gnustep
#MASTER_SITES=	http://www.gnustep.it/enrico/gworkspace/
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	usr-apps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep workspace manager
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

GNU_CONFIGURE=	yes
ADDITIONAL_LDFLAGS+=	-L${WRKSRC}/FSNode/FSNode.framework/Versions/A
DEFAULT_LIBVERSION2=	0.1.0
DEFAULT_LIBVERSION3=	1.0.0
PLIST_SUB+=	LIBVERSION2=${DEFAULT_LIBVERSION2}
PLIST_SUB+=	MAJORLIBVERSION2=${DEFAULT_LIBVERSION2:C/([0-9]).*/\1/1}
PLIST_SUB+=	LIBVERSION3=${DEFAULT_LIBVERSION3}
PLIST_SUB+=	MAJORLIBVERSION3=${DEFAULT_LIBVERSION3:C/([0-9]).*/\1/1}
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

.if defined(WITHOUT_GHOSTSCRIPT)
PLIST_SUB+=	PDFVIEW="@comment "
.else
PLIST_SUB+=	PDFVIEW=""
USE_GHOSTSCRIPT=	yes
.endif

pre-configure:
	${RM} -rf ${WRKSRC}/GWMetadata

.include <bsd.port.mk>
