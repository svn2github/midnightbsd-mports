# New ports collection makefile for:	sdl_net
# Date created:				20 September 2000
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/net/sdl_net/Makefile,v 1.24 2006/09/20 11:21:56 stas Exp $
#

PORTNAME=	sdl_net
PORTVERSION=	1.2.6
PORTREVISION=	0
CATEGORIES=	net
MASTER_SITES=	http://www.libsdl.org/projects/SDL_net/release/
DISTNAME=	SDL_net-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small sample cross-platform networking library

USE_SDL=	sdl
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-configure:
	@${REINPLACE_CMD} -e \
		's|^deplibs_check_method=.*|deplibs_check_method=pass_all|' \
			${WRKSRC}/libtool

.include <bsd.port.mk>
