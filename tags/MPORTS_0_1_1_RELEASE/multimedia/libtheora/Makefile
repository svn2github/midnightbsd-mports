# New ports collection makefile for:	theora
# Date created:				09 februari 2003
# Whom:					Koop Mast <kwm@rainbow-runner.nl>
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/libtheora/Makefile,v 1.12 2006/06/29 19:27:59 stefan Exp $
#

PORTNAME=	libtheora
DISTVERSION=	1.0alpha6
CATEGORIES=	multimedia
MASTER_SITES=	http://downloads.xiph.org/releases/theora/ \
		http://distfiles.master.finkmirrors.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Theora video codec for the Ogg multimedia streaming system

LIB_DEPENDS=	vorbis.3:${PORTSDIR}/audio/libvorbis

USE_BZIP2=	yes
USE_GCC=	3.4+
INSTALLS_SHLIB=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include " \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="${PTHEAD_LIBS}"
CONFIGURE_ARGS=	--disable-sdltest \
		--enable-shared

post-patch:
	@${REINPLACE_CMD} -e 's|sdl-config|sdl11-config|g; \
		s|-O2||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|SDL/SDL.h|SDL11/SDL.h|g; \
		s|machine/soundcard.h|sys/soundcard.h|g' \
		${WRKSRC}/examples/player_example.c
	@${REINPLACE_CMD} -e 's|-pthread|${PTHREAD_LIBS}|g' \
		${WRKSRC}/examples/Makefile.in
	@${REINPLACE_CMD} -e 's|doc||g' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
