# $MidnightBSD$

PORTNAME=	libGLw
PORTVERSION=	8.0.0
CATEGORIES=	graphics
MASTER_SITES=	ftp://ftp.freedesktop.org/pub/mesa/glw/
DISTNAME=	glw-${PORTVERSION}
DIST_SUBDIR=	GL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL widgets library

LICENSE=	mit

USES=		motif libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
USE_GL=		gl
USE_XORG=	x11 xt xext
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-static --enable-motif
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
