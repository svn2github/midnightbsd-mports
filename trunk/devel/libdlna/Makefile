# $MidnightBSD$

PORTNAME=	libdlna
PORTVERSION=	0.2.3
CATEGORIES=	devel
MASTER_SITES=	http://libdlna.geexbox.org/releases/ \
		http://critical.ch/distfiles/ \
		http://energy.critical.ch/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference DLNA open-source implementation
LICENSE=	lgpl

LIB_DEPENDS+=	avcodec:${PORTSDIR}/multimedia/ffmpeg

HAS_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes

CONFIGURE_ARGS+=	--prefix="${PREFIX}" --disable-optimize \
			--includedir=${LOCALBASE}/include \
			--libdir=${LOCALBASE}/lib

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e \
		's#\(PKGCONFIG_DIR = \).*#\1${LOCALBASE}/libdata/pkgconfig#' \
		${WRKSRC}/Makefile

.include <bsd.port.mk>
