# $MidnightBSD$

PORTNAME=	melodie
PORTVERSION=	0.4.1
PORTREVISION=	1
CATEGORIES=	audio gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project music player

LIB_DEPENDS=	tag.1:${PORTSDIR}/audio/taglib \
		mp4v2.0:${PORTSDIR}/multimedia/mpeg4ip-libmp4v2

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	EtoileFoundation:${FOUNDATION_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	CoreObject:${COREOBJECT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	IconKit:${ICONKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	MediaKit:${MEDIAKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	EtoileUI:${ETOILE_UI_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	LanguageKit:${LANGUAGEKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	SmalltalkSupport:${SMALLTALKKIT_PORT}
USE_GNUSTEP_LOCAL_LIBS+=	ScriptKit:${SCRIPTKIT_PORT}

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Services/User/Melodie

FOUNDATION_PORT?=	devel/etoile-foundation
COREOBJECT_PORT?=	devel/etoile-coreobject
ICONKIT_PORT?=		x11-themes/etoile-iconkit
MEDIAKIT_PORT?=		multimedia/etoile-mediakit
ETOILE_UI_PORT?=	deskutils/etoile-ui
LANGUAGEKIT_PORT?=	lang/etoile-languagekit
SMALLTALKKIT_PORT?=	lang/etoile-smalltalkkit
SCRIPTKIT_PORT?=	lang/etoile-scriptkit

post-configure:
	${REINPLACE_CMD} -e 's|-Werror||' ${WRKSRC}/etoile.make \
		${WRKSRC}/Services/User/Melodie/GNUmakefile

.include <bsd.port.mk>
