# New ports collection makefile for:	libbonoboui
# Date created:				04 April 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/libbonoboui/Makefile,v 1.57 2007/03/19 05:14:01 marcus Exp $
#    $MCom: ports/x11-toolkits/libbonoboui/Makefile,v 1.55 2007/03/12 18:11:27 marcus Exp $
#

PORTNAME=	libbonoboui
PORTVERSION=	2.18.0
PORTREVISION?=	0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GUI frontend to the libbonobo component of GNOME 2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomeprefix gnomehack gnomehier intlhack \
		libgnomecanvas libgnome referencehack
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

.include <bsd.port.mk>

.endif
