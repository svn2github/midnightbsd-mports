# $MidnightBSD$

PORTNAME=	libotf
PORTVERSION=	0.9.13
PORTREVISION=	1
CATEGORIES=	print devel
MASTER_SITES=	${MASTER_SITE_SAVANNAH}:m17n
MASTER_SITE_SUBDIR=	m17n

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for handling OpenType fonts

LICENSE=	lgpl2.1

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2

USES=		pathfix pkgconfig libtool:keepla
USE_XORG=	x11 xt xaw xmu
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
