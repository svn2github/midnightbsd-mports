# New ports collection makefile for:    etoile-menuserver
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/deskutils/etoile-menuserver/Makefile,v 1.5 2007/01/31 18:17:52 dinoex Exp $
#

PORTNAME=	menuserver
PORTVERSION=	0.1.${SNAPSHOT}
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project MenuServer application

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	XWindowServerKit:${XWINDOWSERVERKIT_PORT}
USE_GNUSTEP_SYSTEM_LIBS+=	WorkspaceCommKit:${ETOILE_SYSTEM_PORT}

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/MenuServer
ADDITIONAL_OBJCFLAGS+=	-I${X11BASE}/include
ADDITIONAL_LDFLAGS+=	-L${X11BASE}/lib

XWINDOWSERVERKIT_PORT?=		x11/etoile-xwindowserverkit
ETOILE_SYSTEM_PORT?=		sysutils/etoile-system

.include <bsd.port.mk>
