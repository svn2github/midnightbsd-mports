# New ports collection makefile for:    gnustep-cdplayer
# Date created:         17 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/audio/gnustep-cdplayer/Makefile,v 1.3 2007/01/31 18:17:49 dinoex Exp $
#

PORTNAME=	cdplayer
PORTVERSION=	0.4.2
CATEGORIES=	audio gnustep
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	gsburn
PKGNAMEPREFIX=	gnustep-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep CD player with CDDB support

LIB_DEPENDS+=	cdaudio.1:${PORTSDIR}/audio/libcdaudio

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_BUNDLES+=	Cddb:${CDDB_BUNDLE_PORT}
USE_GNUSTEP_SYSTEM_LIBS+=	PrefsModule:${PREFERENCES_PORT}

WRKSRC=		${WRKDIR}/${PORTNAME}

CDDB_BUNDLE_PORT?=	audio/cddb-bundle
PREFERENCES_PORT?=	deskutils/preferences.app

pre-configure:
	${LN} -s ${GNUSTEP_SYSTEM_ROOT}/Library/Frameworks/PrefsModule.framework/Versions/A/Headers ${WRKSRC}/AudioCD/AudioCDPrefs/PrefsModule

post-install:
	${MKDIR} ${GNUSTEP_PREFIX}/Local/Library/Headers/CDPlayer
	${INSTALL_DATA} ${WRKSRC}/CDPlayer/AudioCDProtocol.h \
		 ${GNUSTEP_PREFIX}/Local/Library/Headers/CDPlayer/

.include <bsd.port.mk>
