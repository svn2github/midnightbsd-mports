# $MidnightBSD: mports/games/oolite/Makefile,v 1.3 2009/04/05 16:07:53 laffer1 Exp $

PORTNAME=		oolite
PORTVERSION=		1.65
PORTREVISION=		2
CATEGORIES=		games gnustep
MASTER_SITES=		${MASTER_SITE_BERLIOS} \
			ftp://ftp.alioth.net/%SUBDIR%/:alioth
MASTER_SITE_SUBDIR=	oolite-linux oolite/:alioth
DISTFILES=		${PORTNAME}-${PORTVERSION}-src${EXTRACT_SUFX}:DEFAULT,alioth \
			${PORTNAME}-${PORTVERSION}-data${EXTRACT_SUFX}:DEFAULT,alioth

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Trade and combat space simulator, clone of Elite
LICENSE=		gpl2

WRKSRC=			${WRKDIR}/${PORTNAME}-${PORTVERSION}-src
USE_GL=			yes
USE_SDL=		mixer image gfx
USE_GMAKE=		yes
USE_GNUSTEP=		yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
MAKEFILE=		GNUmakefile
MAKE_FLAGS+=		debug=no
SUB_FILES=		pkg-message
PKGMESSAGE=		${WRKDIR}/pkg-message

post-patch:
	${REINPLACE_CMD} -e "s|sdl-config|${SDL_CONFIG}|g" ${WRKSRC}/${MAKEFILE}
	${REINPLACE_CMD} -e "s|shared_obj|obj|g" ${WRKSRC}/${MAKEFILE}.postamble

do-install:
	${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Applications
	${CP} -R ${WRKSRC}/oolite.app ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Applications
	${STRIP_CMD} ${FAKE_DESTDIR}${GNUSTEP_PREFIX}/Local/Applications/oolite.app/oolite

.include <bsd.port.mk>
