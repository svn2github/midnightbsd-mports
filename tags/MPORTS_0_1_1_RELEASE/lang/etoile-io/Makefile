# New ports collection makefile for:    etoile-io
# Date created:         19 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/lang/etoile-io/Makefile,v 1.3 2007/01/31 18:18:03 dinoex Exp $
# $MidnightBSD$
#

PORTNAME=	io
PORTVERSION=	0.1.${SNAPSHOT}
CATEGORIES=	lang gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        bsd2
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project Io Language

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
#USE_GNUSTEP_SYSTEM_LIBS+=       XWindowServerKit:${XWINDOWSERVERKIT_PORT}

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Languages/Io
#HEADER_DIR=	Local/Library/Headers/Io
#PLIST_FILES=	Local/Tools/ioobjc

.include <bsd.port.mk>
