# New ports collection makefile for:	gnomemag
# Date created:			12 April 2003
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/accessibility/gnome-mag/Makefile,v 1.3 2008/03/11 23:32:04 laffer1 Exp $
# $FreeBSD: ports/accessibility/gnome-mag/Makefile,v 1.43 2007/10/24 23:34:40 marcus Exp $
#   $MCom: ports/accessibility/gnome-mag/Makefile,v 1.37 2007/09/17 16:05:19 ahze Exp $
#

PORTNAME=	gnome-mag
PORTVERSION=	0.14.10
PORTREVISION=	2
CATEGORIES=	accessibility gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME screen magnifier
LICENSE=	lgpl

USE_BZIP2=	yes
USE_XORG=	xfixes xdamage ice xcomposite sm
USE_GNOME=	gnomehack gnomeprefix atspi libbonobo intlhack ltverhack
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

DOCSDIR=	${PREFIX}/share/doc/gnome-mag-${PORTVERSION}

MAN1=		magnifier.1

.include <bsd.port.mk>
