# New ports collection makefile for:    etoile-babbler
# Date created:         22 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/multimedia/etoile-babbler/Makefile,v 1.1 2007/03/13 06:58:38 laffer1 Exp $
# $FreeBSD: ports/multimedia/etoile-babbler/Makefile,v 1.2 2007/01/31 18:18:05 dinoex Exp $
#

PORTNAME=	babbler
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=	1
CATEGORIES=	multimedia gnustep
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMEPREFIX=	etoile-
DISTNAME=	Etoile-${SNAPSHOT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple media player for Etoile

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_SYSTEM_LIBS+=	XWindowServerKit:${XWINDOWSERVERKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=        MultimediaKit:${MULTIMEDIAKIT_PORT}

SNAPSHOT=	20061221
WRKSRC=	${WRKDIR}/Etoile/
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Babbler

XWINDOWSERVERKIT_PORT?=		x11/etoile-xwindowserverkit
MULTIMEDIAKIT_PORT?=	multimedia/etoile-multimediakit

.include <bsd.port.mk>
