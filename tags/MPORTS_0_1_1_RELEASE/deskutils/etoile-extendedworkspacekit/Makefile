# New ports collection makefile for:    etoile-extendedworkspacekit
# Date created:         18 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/etoile-extendedworkspacekit/Makefile,v 1.2 2007/08/20 06:39:34 laffer1 Exp $
# $FreeBSD: ports/deskutils/etoile-extendedworkspacekit/Makefile,v 1.6 2007/01/31 18:17:52 dinoex Exp $
#

PORTNAME=	extendedworkspacekit
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project ExtendedWorkspaceKit framework

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	TrackerKit:${TRACKERKIT_PORT}
DEFAULT_LIBVERSION=	0.1
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
MAKE_ENV+=      GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
NO_FILTER_SHLIBS=	yes

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Frameworks/ExtendedWorkspaceKit

TRACKERKIT_PORT?=	deskutils/etoile-trackerkit

.include <bsd.port.mk>
