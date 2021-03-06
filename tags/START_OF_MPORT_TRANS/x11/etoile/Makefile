# New ports collection makefile for:    etoile
# Date created:         21 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/x11/etoile/Makefile,v 1.8 2007/01/31 18:18:12 dinoex Exp $
#

PORTNAME=	etoile
PORTVERSION=	0.1.0
PORTREVISION=	4
CATEGORIES=	x11 gnustep
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Metaport for Etoile desktop

NO_BUILD=	yes
NO_INSTALL=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_GUI=	yes
USE_GNUSTEP_BACK=	yes
.if !defined(WITH_GNUSTEP_SINGLE_BACKEND)
USE_GNUSTEP_XLIB=	yes
USE_GNUSTEP_LIBART=	yes
USE_GNUSTEP_CAIRO=	yes
.endif

USE_GNUSTEP_SYSTEM_LIBS+=	\
	TrackerKit:deskutils/etoile-trackerkit \
	ServicesBarKit:deskutils/etoile-servicesbarkit \
	IconKit:x11-themes/etoile-iconkit \
	ExtendedWorkspace:deskutils/etoile-extendedworkspacekit \
	XWindowServerKit:x11/etoile-xwindowserverkit \
	WorkspaceCommKit:sysutils/etoile-system \

USE_GNUSTEP_LOCAL_LIBS+=	\
	Addresses:mail/addresses \
	SQLClient:databases/sqlclient \
	UnitKit:devel/etoile-unitkit \
	BookmarkKit:www/etoile-bookmarkkit \
	RSSKit:www/etoile-rsskit \
	PopplerKit:graphics/popplerkit \
	OgreKit:textproc/etoile-ogrekit \
	LuceneKit:textproc/etoile-lucenekit \
	CollectionKit:devel/etoile-collectionkit \
	EtoileFoundation:devel/etoile-foundation \
	PaneKit:deskutils/etoile-panekit \
	SystemConfig:deskutils/etoile-systemconfig \
	MultimediaKit:multimedia/etoile-multimediakit \
	EtoileUI:deskutils/etoile-ui \

#	DistributedView:deskutils/etoile-distributedview \

USE_GNUSTEP_SYSTEM_BUNDLES+=	\
	EtoileMenus:x11-themes/etoile-etoilemenus \
	EtoileBehavior:sysutils/etoile-behavior \

USE_GNUSTEP_LOCAL_BUNDLES+=	\

USE_GNUSTEP_SYSTEM_THEMES+=	\
	Camaelon:x11-themes/etoile-camaelon \

USE_GNUSTEP_LOCAL_THEMES+=	\
	WildMenus:x11-themes/etoile-wildmenus \

USE_GNUSTEP_SYSTEM_APPS+=	\
	AZDock:x11-wm/etoile-azdock \
	AZBackground:x11-themes/etoile-azbackground \

USE_GNUSTEP_LOCAL_APPS+=	\
	DictionaryReader:deskutils/etoile-dictionaryreader \
	iTerm:x11/etoile-iterm \
	Installer:sysutils/etoile-installer \
	Hardware:deskutils/etoile-hardware \
	LookAndBehavior:deskutils/etoile-lookandbehavior \
	Azalea:x11-wm/etoile-azalea \
	EtoileMenuServer:deskutils/etoile-menuserver \
	Vindaloo:graphics/vindaloo \
	Typewriter:editors/etoile-typewriter \
	Babbler:multimedia/etoile-babbler \
	Mollusk:www/etoile-mollusk \

#	Mantella:www/etoile-mantella \

USE_GNUSTEP_LOCAL_TOOLS+=	\
	ioobjc:lang/etoile-io \

.include <bsd.port.mk>
