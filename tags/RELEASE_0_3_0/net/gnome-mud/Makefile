# New ports collection makefile for:	amcl
# Date created:				15 Apr 2000
# Whom:					will
#
# $MidnightBSD$
# $FreeBSD: ports/net/gnome-mud/Makefile,v 1.33 2008/03/25 22:44:42 miwi Exp $
#

PORTNAME=	gnome-mud
PORTVERSION=	0.10.7
PORTREVISION=	4
CATEGORIES=	net gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK-based MUD client with triggers, aliases, colors, etc
LICENSE=	gpl2

USE_GETTEXT=	yes
USE_GNOME=	gnomehack gnometarget gnomeprefix intlhack libgnomeui \
		pygtk2 vte
USE_PYTHON=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--enable-mccp
INSTALLS_OMF=	yes

MAN6=		gnome-mud.6
GCONF_SCHEMAS=	gnome-mud.schemas

post-patch:
	@${REINPLACE_CMD} -e \
		's|prefix)/games|prefix)/bin|g' ${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
