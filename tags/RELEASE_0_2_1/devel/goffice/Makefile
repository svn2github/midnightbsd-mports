# New ports collection makefile for:	goffice
# Date created:				07 June 2005
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD: ports/devel/goffice/Makefile,v 1.25 2008/05/14 18:29:01 mezz Exp $
#   $MCom: ports/devel/goffice/Makefile,v 1.32 2007/09/06 05:01:28 marcus Exp $
# $MidnightBSD: mports/devel/goffice/Makefile,v 1.1 2008/06/05 21:15:10 crash Exp $

PORTNAME=	goffice
PORTVERSION=	0.6.4
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib/GTK+ set of document centric objects and utilities
LICENSE=        gpl2

LIB_DEPENDS=	pcre.0:${PORTSDIR}/devel/pcre

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeprint libglade2 \
		libgsf_gnome libgnomeui ltverhack
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
