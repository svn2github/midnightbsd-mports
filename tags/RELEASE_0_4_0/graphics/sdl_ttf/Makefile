# New ports collection makefile for:	sdl_ttf
# Date created:				20 September 2000
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/sdl_ttf/Makefile,v 1.36 2007/05/19 20:10:48 flz Exp $
#

PORTNAME=	sdl_ttf
PORTVERSION=	2.0.8
CATEGORIES=	graphics
MASTER_SITES=	http://www.libsdl.org/projects/SDL_ttf/release/
DISTNAME=	SDL_ttf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library to use TrueType fonts to render text in SDL applications
LICENSE=	lgpl

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2

USE_SDL=	sdl
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_LDCONFIG=	yes

.if !defined(WITHOUT_X11) && !defined(WITHOUT_GL)
USE_GL=		yes
.endif

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/glfont ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/.libs/showfont ${PREFIX}/bin

.include <bsd.port.mk>
