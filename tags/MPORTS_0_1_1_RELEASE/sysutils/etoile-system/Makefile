# New ports collection makefile for:    etoile-system
# Date created:         19 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/sysutils/etoile-system/Makefile,v 1.4 2007/08/27 20:53:02 seirei Exp $
# $FreeBSD: ports/sysutils/etoile-system/Makefile,v 1.4 2007/01/31 18:18:08 dinoex Exp $
#

PORTNAME=	system
PORTVERSION=	0.1.${SNAPSHOT}
PORTREVISION=   1
CATEGORIES=	sysutils gnustep
MASTER_SITES=	http://download.gna.org/etoile/
LICENSE=        lgpl
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-0.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project System Tool

LIB_DEPENDS=    dbus:${PORTSDIR}/devel/dbus

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
#MAKE_ENV+=      GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
NO_FILTER_SHLIBS=       yes

SNAPSHOT=       20070728
WRKSRC=	${WRKDIR}/Etoile-0.2/
USE_GNUSTEP_MAKE_DIRS+=	Services/Private/System

post-install:
	${MKDIR} ${WRKDIR}/${FAKE_INSTALLDIR}/${GNUSTEP_PREFIX}/System/Library/Etoile
	${CP} ${WRKSRC}/Services/Private/System/SystemTaskList.plist \
		${WRKDIR}/${FAKE_INSTALLDIR}${GNUSTEP_PREFIX}/System/Library/Etoile/

.include <bsd.port.mk>
