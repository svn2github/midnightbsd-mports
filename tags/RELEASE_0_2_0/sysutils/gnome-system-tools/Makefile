# New ports collection makefile for:	gnomesystemtools
# Date created:				17 May 2004
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/gnome-system-tools/Makefile,v 1.30 2008/06/06 14:03:06 edwin Exp $
#   $MCom: ports/sysutils/gnome-system-tools/Makefile,v 1.78 2008/03/09 18:58:47 mezz Exp $
#

PORTNAME=	gnome-system-tools
PORTVERSION=	2.22.0
PORTREVISION=	0
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to configure workstations
LICENSE=	gpl2

LIB_DEPENDS=	oobs-1.4:${PORTSDIR}/devel/liboobs

USE_BZIP2=	yes
USE_GMAKE=	yes
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
GNOME_DESKTOP_VERSION=2
USE_GNOME=	gnomehack gnomeprefix gnometarget intlhack nautilus2
USE_AUTOTOOLS=	libtool:15
INSTALLS_OMF=	yes
CONFIGURE_ARGS=	--enable-services
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-system-tools.schemas

.include <bsd.port.mk>
