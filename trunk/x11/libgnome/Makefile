# $MidnightBSD$

PORTNAME=	libgnome
PORTVERSION=	2.32.0
PORTREVISION?=	2
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for GNOME, a GNU desktop environment

LICENSE=	lgpl

USES=		tar:bzip2

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian
LIB_DEPENDS=	canberra-gtk.0:${PORTSDIR}/audio/libcanberra
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian

USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack esound libbonobo \
		gnomevfs2 ltverhack referencehack
USE_BISON=	build
USE_PATHFIX=	yes
USE_XORG=	xpm
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

SUB_FILES=	pkg-deinstall

MAN7=		gnome-options.7

GCONF_SCHEMAS=	desktop_gnome_accessibility_keyboard.schemas \
		desktop_gnome_accessibility_startup.schemas \
		desktop_gnome_applications_at_mobility.schemas \
		desktop_gnome_applications_at_visual.schemas \
		desktop_gnome_applications_browser.schemas \
		desktop_gnome_applications_office.schemas \
		desktop_gnome_applications_terminal.schemas \
		desktop_gnome_applications_window_manager.schemas \
		desktop_gnome_background.schemas \
		desktop_gnome_file_views.schemas \
		desktop_gnome_interface.schemas \
		desktop_gnome_lockdown.schemas \
		desktop_gnome_peripherals_keyboard.schemas \
		desktop_gnome_peripherals_mouse.schemas \
		desktop_gnome_sound.schemas \
		desktop_gnome_thumbnail_cache.schemas \
		desktop_gnome_thumbnailers.schemas \
		desktop_gnome_typing_break.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/libgnome/libgnome-2.0.pc.in
	@${REINPLACE_CMD} -e '/^$$/d' ${WRKSRC}/po/POTFILES.in
	@${REINPLACE_CMD} -e 's|-DG_DISABLE_DEPRECATED||g' \
		${WRKSRC}/libgnome/Makefile.in

.include <bsd.port.mk>

.endif
