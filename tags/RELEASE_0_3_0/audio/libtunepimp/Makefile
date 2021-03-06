# New ports collection makefile for:	tunepimp
# Date Created:				11 Aug 2004
# Whom:					Lauri Watts <lauri@kde.org>
#
# $MidnightBSD: mports/audio/libtunepimp/Makefile,v 1.2 2009/09/20 00:40:06 laffer1 Exp $
# $FreeBSD: ports/audio/libtunepimp/Makefile,v 1.21 2008/06/20 15:41:49 tabthorpe Exp $
#

PORTNAME=	libtunepimp
PORTVERSION=	0.5.3
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	audio
MASTER_SITES=	http://ftp.musicbrainz.org/pub/musicbrainz/ \
		ftp://ftp.au.musicbrainz.org/pub/musicbrainz/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client library for musicbrainz
LICENSE=	gpl2
# allows us to use mp3 features

LIB_DEPENDS=	FLAC:${PORTSDIR}/audio/flac \
		expat:${PORTSDIR}/textproc/expat2 \
		mad:${PORTSDIR}/audio/libmad \
		mp4v2:${PORTSDIR}/multimedia/mpeg4ip-libmp4v2 \
		musicbrainz:${PORTSDIR}/audio/libmusicbrainz \
		ogg:${PORTSDIR}/audio/libogg \
		tag:${PORTSDIR}/audio/taglib \
		vorbis:${PORTSDIR}/audio/libvorbis \
		ofa:${PORTSDIR}/audio/libofa

CONFLICTS=	trm-0*
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -liconv"
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|^CFLAGS=|#CFLAGS=|g ; \
		 s|^CPPFLAGS=|#CPPFLAGS=|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|-lthr|${PTHREAD_LIBS}|g' \
		${WRKSRC}/lib/threads/posix/Makefile.in

post-configure:
	@${REINPLACE_CMD} -e 's|\(^LDFLAGS =.*\)|\1 ${PTHREAD_LIBS} -liconv|g' \
		${WRKSRC}/examples/Makefile
	@${REINPLACE_CMD} -e 's|plugins/wv|plugins/tta|' \
		${WRKSRC}/plugins/tta/Makefile

.include <bsd.port.mk>
