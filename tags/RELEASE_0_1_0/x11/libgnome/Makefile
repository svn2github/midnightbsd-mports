# New ports collection makefile for:	libgnome
# Date created:				17 June 1998
# Whom:					Yukihiro Nakai <Nakai@technologist.com>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/libgnome/Makefile,v 1.156 2007/03/19 05:13:55 marcus Exp $
#   $MCom: ports/x11/libgnome/Makefile,v 1.100 2007/03/12 15:49:09 ahze Exp $
#

PORTNAME=	libgnome
PORTVERSION=	2.18.0
PORTREVISION?=	0
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for GNOME, a GNU desktop environment

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	scrollkeeper-config:${PORTSDIR}/textproc/scrollkeeper
RUN_DEPENDS=	scrollkeeper-config:${PORTSDIR}/textproc/scrollkeeper

USE_GETTEXT=	yes
USE_XPM=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack esound \
		gnomevfs2 libxslt ltverhack referencehack
USE_BISON=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

SUB_FILES=	pkg-deinstall

#MAN7=		gnome-options.7

GCONF_SCHEMAS=	desktop_gnome_accessibility_keyboard.schemas \
		desktop_gnome_accessibility_startup.schemas \
		desktop_gnome_applications_browser.schemas \
		desktop_gnome_applications_help_viewer.schemas \
		desktop_gnome_applications_terminal.schemas \
		desktop_gnome_applications_window_manager.schemas \
		desktop_gnome_background.schemas \
		desktop_gnome_file_views.schemas \
		desktop_gnome_interface.schemas desktop_gnome_lockdown.schemas \
		desktop_gnome_peripherals_keyboard.schemas \
		desktop_gnome_peripherals_mouse.schemas \
		desktop_gnome_sound.schemas desktop_gnome_thumbnailers.schemas \
		desktop_gnome_typing_break.schemas \
		desktop_gnome_applications_at_mobility.schemas \
		desktop_gnome_applications_at_visual.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/libgnome/libgnome-2.0.pc.in
	@${REINPLACE_CMD} -e '/^$$/d' ${WRKSRC}/po/POTFILES.in

.include <bsd.port.mk>

.endif
