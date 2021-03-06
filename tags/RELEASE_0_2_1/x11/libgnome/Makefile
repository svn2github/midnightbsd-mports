# New ports collection makefile for:	libgnome
# Date created:				17 June 1998
# Whom:					Yukihiro Nakai <Nakai@technologist.com>
#
# $MidnightBSD: mports/x11/libgnome/Makefile,v 1.5 2008/06/18 05:07:59 laffer1 Exp $
# $FreeBSD: ports/x11/libgnome/Makefile,v 1.156 2007/03/19 05:13:55 marcus Exp $
#   $MCom: ports/x11/libgnome/Makefile,v 1.100 2007/03/12 15:49:09 ahze Exp $
#

PORTNAME=	libgnome
PORTVERSION=	2.22.0
PORTREVISION?=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for GNOME, a GNU desktop environment
LICENSE=	lgpl

#USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian

USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack esound libbonobo \
		gnomevfs2 ltverhack referencehack
USE_BISON=	build
USE_XORG=	xpm
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

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
		desktop_gnome_thumbnailers.schemas \
		desktop_gnome_typing_break.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/libgnome/libgnome-2.0.pc.in
	@${REINPLACE_CMD} -e '/^$$/d' ${WRKSRC}/po/POTFILES.in

.include <bsd.port.mk>

.endif
