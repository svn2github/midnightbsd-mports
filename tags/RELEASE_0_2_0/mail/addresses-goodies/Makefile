# New ports collection makefile for:    addresses-goodies
# Date created:         29 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/mail/addresses-goodies/Makefile,v 1.2 2007/11/07 20:20:14 ctriv Exp $
# $FreeBSD: ports/mail/addresses-goodies/Makefile,v 1.4 2007/01/31 18:18:04 dinoex Exp $
#

PORTNAME=	addresses
PORTVERSION=	0.4.7
PORTREVISION=	0
CATEGORIES=	mail gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
PKGNAMESUFFIX=	-goodies${PKGNAMESUFFIX2}
DISTNAME=	Addresses-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Goodies for addressbook for GNUstep
LICENSE=	lgpl

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	Inspector:${GWORKSPACE_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	Addresses:${ADDRESSES_PORT}
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/Addresses/Goodies

ADDRESSES_PORT?=	mail/addresses
GWORKSPACE_PORT?=	deskutils/gworkspace

post-patch:
	${REINPLACE_CMD} -e 's|LDAPAddressBook||' \
		-e 's|VCFViewer||' \
		${WRKSRC}/GNUmakefile
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		-e 's|Library/GWorkspace|Library/Bundles|' \
		-e 's|-lGWorkspace|-lInspector|' \
		${WRKSRC}/VCFViewer/GNUmakefile
	${REINPLACE_CMD} -e 's|<GWorkspace/|<Inspector/|' \
		${WRKSRC}/VCFViewer/VCFViewer.h

.include <bsd.port.mk>
