# $MidnightBSD$

PORTNAME=	twolame
PORTVERSION=	0.3.13
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF \
		http://www.ecs.soton.ac.uk/~njh/twolame/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG Audio Layer 2 encoder

LICENSE=	gpl2

LIB_DEPENDS=	libsndfile.so:${PORTSDIR}/audio/libsndfile \
		libFLAC.so:${PORTSDIR}/audio/flac \
		libvorbis.so:${PORTSDIR}/audio/libvorbis \
		libogg.so:${PORTSDIR}/audio/libogg

USES=		gmake pathfix pkgconfig libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e 's| -O3||g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
