# New ports collection makefile for:	user-selector-applet
# Date created:		8 May 2004
# Whom:			Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD: mports/x11/fast-user-switch-applet/Makefile,v 1.4 2008/04/06 19:16:55 laffer1 Exp $
# $FreeBSD: ports/x11/fast-user-switch-applet/Makefile,v 1.22 2007/10/24 23:36:52 marcus Exp $
#    $MCom: ports/x11/fast-user-switch-applet/Makefile,v 1.28 2007/09/18 15:01:12 ahze Exp $

PORTNAME=	fast-user-switch-applet
PORTVERSION=	2.22.0
PORTREVISION=	3
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast user switching applet for GNOME
LICENSE=	gpl2

USE_XORG=       x11 xmu xau ice
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack intlhack gnomeprefix gtk20 gnomepanel
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-gdm-config=${LOCALBASE}/etc/gdm/custom.conf \
		--with-gdm-setup=${LOCALBASE}/sbin/gdmsetup

GCONF_SCHEMAS=	fast-user-switch-applet.schemas
INSTALLS_OMF=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|\$$"\$$|"$$|' ${WRKSRC}/configure

.include <bsd.port.mk>
