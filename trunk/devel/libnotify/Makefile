# $MidnightBSD$

PORTNAME=	libnotify
PORTVERSION=	0.7.5
PORTREVISION=	3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for desktop notifications

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext gmake libtool:keepla pathfix pkgconfig tar:xz
USE_GNOME=	intlhack glib20 gdkpixbuf2 introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
