# $MidnightBSD$

PORTNAME=	libv4l
PORTVERSION=	0.8.8
CATEGORIES=	multimedia
MASTER_SITES=	http://linuxtv.org/downloads/v4l-utils/
DISTNAME=	v4l-utils-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video4Linux library

LICENSE=	gpl2

BUILD_DEPENDS=	v4l_compat>=1.0.20120501:${PORTSDIR}/multimedia/v4l_compat
LIB_DEPENDS=	libjpeg.so:${PORTSDIR}/graphics/jpeg

MAKE_ARGS=	CFLAGS="${CFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" LIBDIR="${PREFIX}/lib"
USES=		gmake tar:bzip2
USE_LDCONFIG=	yes

FAKE_OPTS+=	trueprefix
WRKSRC=		${WRKDIR}/${DISTNAME}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|$$(LIBDIR)/pkgconfig|${PREFIX}/libdata/pkgconfig|g' \
		-e 's|-lrt||g' \
		${WRKSRC}/libv4l1/Makefile \
		${WRKSRC}/libv4l2/Makefile \
		${WRKSRC}/libv4lconvert/Makefile
	@${RM} ${WRKSRC}/../include/linux/videodev2.h

.include <bsd.port.mk>
