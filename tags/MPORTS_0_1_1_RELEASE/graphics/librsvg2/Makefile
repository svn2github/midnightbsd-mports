# New ports collection makefile for:    librsvg2
# Date created:         		8th May 2001
# Whom:                 		Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/librsvg2/Makefile,v 1.59 2007/07/27 15:50:29 mezz Exp $
#   $MCom: ports/graphics/librsvg2/Makefile,v 1.109 2006/10/02 04:52:51 bland Exp $
#

PORTNAME=	librsvg2
PORTVERSION=	2.18.0
CATEGORIES=	graphics gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME:S/2$//}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	librsvg-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for parsing and rendering SVG vector-graphic files
LICENSE=	gpl2

BUILD_DEPENDS=	freetype-config:${PORTSDIR}/print/freetype2
LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2 \
		croco-${CROCO_VERSION}.3:${PORTSDIR}/textproc/libcroco
RUN_DEPENDS=	gtk-engines2>=2.7.5_1:${PORTSDIR}/x11-themes/gtk-engines2

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack gnomeprefix libgsf gtk20 ltverhack
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-svgz \
		--disable-gtk-doc \
		--without-gimp \
		--with-croco \
		--disable-gnome-vfs \
		--enable-gtk-theme \
		--disable-gnome-print

CROCO_VERSION=	0.6

MAN1=		rsvg.1

OPTIONS=	MOZILLA_PLUGIN "Enable the SVG browser plug-in" no

.include <bsd.port.pre.mk>

.if defined(WITH_MOZILLA_PLUGIN)
USE_GECKO=	firefox mozilla seamonkey xulrunner firefox15
.include "${.CURDIR}/../../www/mozilla/bsd.gecko.mk"
CONFIGURE_ENV+=	MOZILLA_CONFIG=no
CONFIGURE_ARGS+=--enable-mozilla-plugin=yes

PLIST_SUB+=	PLUGIN=""
.else
CONFIGURE_ARGS+=--enable-mozilla-plugin=no

PLIST_SUB+=	PLUGIN="@comment "
.endif

post-patch:
.if defined(WITH_MOZILLA_PLUGIN)
	@${REINPLACE_CMD} -e 's|mozilla-plugin|${GECKO}-plugin|g' \
		${WRKSRC}/configure
.endif

.include <bsd.port.post.mk>
