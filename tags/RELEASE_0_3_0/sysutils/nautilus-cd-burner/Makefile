# New ports collection makefile for:	nautilus-cd-burner
# Date created:				13 April 2003
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/nautilus-cd-burner/Makefile,v 1.5 2009/09/20 02:06:00 laffer1 Exp $
# $FreeBSD: ports/sysutils/nautilus-cd-burner/Makefile,v 1.42 2007/05/29 04:07:21 mezz Exp $
#

PORTNAME=	nautilus-cd-burner
PORTVERSION=	2.24.0
PORTREVISION=	7
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CD burner view for Nautilus
LICENSE=	gpl2

BUILD_DEPENDS=	gnome-mount:${PORTSDIR}/sysutils/gnome-mount
RUN_DEPENDS=	gnome-mount:${PORTSDIR}/sysutils/gnome-mount \
		cdrdao:${PORTSDIR}/sysutils/cdrdao

CONFIGURE_ARGS=	--enable-gnome-mount
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
GNOME_DESKTOP_VERSION=2
USE_GNOME=	gnomeprefix gnomehack intlhack nautilus2 ltverhack \
		desktopfileutils ltasneededhack eel2 libgnomeui
USE_CDRTOOLS=	yes
INSTALLS_ICONS=	yes
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	nautilus-cd-burner.schemas

OPTIONS=	DVD "Enable DVD support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_DVD)
RUN_DEPENDS+=	growisofs:${PORTSDIR}/sysutils/dvd+rw-tools
.endif

post-install:
	-@update-desktop-database

.include <bsd.port.post.mk>
