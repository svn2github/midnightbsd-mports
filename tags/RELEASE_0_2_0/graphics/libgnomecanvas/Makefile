# New ports collection makefile for:	gnomecanvas
# Date created:				18 May 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/graphics/libgnomecanvas/Makefile,v 1.2 2008/05/31 21:41:12 crash Exp $
# $FreeBSD: ports/graphics/libgnomecanvas/Makefile,v 1.51 2006/10/14 08:35:17 marcus Exp $
#   $MCom: ports/graphics/libgnomecanvas/Makefile,v 1.60 2006/09/10 00:51:11 mezz Exp $

PORTNAME=	libgnomecanvas
PORTVERSION=	2.20.1.1
PORTREVISION?=	2
CATEGORIES=	graphics gnome
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphics library for GNOME

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_XORG=	x11
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack libglade2 libartlgpl2 ltverhack referencehack gail
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>

.endif
