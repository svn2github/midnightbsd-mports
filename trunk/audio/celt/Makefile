# $MidnightBSD$

PORTNAME=	celt
PORTVERSION=	0.11.3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.us.xiph.org/releases/celt/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The CELT ultra-low delay audio codec

LICENSE=	bsd3

LIB_DEPENDS=	libogg.so:${PORTSDIR}/audio/libogg

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE}
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack
USE_GCC=	4.2+

.include <bsd.port.mk>
