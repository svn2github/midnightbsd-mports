# $MidnightBSD$
# $FreeBSD: ports/x11-wm/metacity/Makefile,v 1.57 2007/06/19 04:38:36 marcus Exp $

PORTNAME=	metacity
PORTVERSION=	2.30.3
PORTREVISION=	2
CATEGORIES=	x11-wm
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Window manager for the adult in you

LICENSE=	gpl2

BUILD_DEPENDS=	zenity:${PORTSDIR}/x11/zenity
LIB_DEPENDS=	libstartup-notification-1.so:${PORTSDIR}/x11/startup-notification \
		libcanberra-gtk.so:${PORTSDIR}/audio/libcanberra
RUN_DEPENDS=	zenity:${PORTSDIR}/x11/zenity

USE_XORG=	x11 xcomposite xdamage
USES=		gettext gmake libtool:keepla pathfix pkgconfig tar:bzip2
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
USE_GNOME=	gnomeprefix intlhack gconf2 gtk20
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_ENV=	G_CHARSET_ALIAS="${LOCALBASE}/libdata/charset.alias"

GCONF_SCHEMAS=	metacity.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|-Werror||g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
