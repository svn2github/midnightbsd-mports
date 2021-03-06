# -*-mode: makefile-*-
# New ports collection makefile for:	KDE3 Graphics
# Date created:				Saturday 2 September 2000
# Whom:					Will Andrews <will@FreeBSD.org>
#
# $FreeBSD: ports/graphics/kdegraphics3/Makefile,v 1.111 2006/09/12 23:26:17 lofi Exp $
# $MidnightBSD$
#

PORTNAME=	kdegraphics
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphics utilities for the KDE3 integrated X11 desktop

BUILD_DEPENDS=	kpsewhich:${PORTSDIR}/print/teTeX-base
LIB_DEPENDS=	art_lgpl_2:${PORTSDIR}/graphics/libart_lgpl \
		fontconfig:${PORTSDIR}/x11-fonts/fontconfig \
		freetype:${PORTSDIR}/print/freetype2 \
		fribidi:${PORTSDIR}/converters/fribidi \
		glut:${PORTSDIR}/graphics/libglut \
		lcms:${PORTSDIR}/graphics/lcms \
		paper:${PORTSDIR}/print/libpaper \
		poppler-qt:${PORTSDIR}/graphics/poppler-qt

CONFLICTS=	kolourpaint-[0-9]*

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool:15
USE_GMAKE=	yes
WANT_GNOME=	yes
USE_GHOSTSCRIPT=yes

INSTALLS_SHLIB=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib %%PREFIX%%/lib/kde3
DO_NOT_COMPILE+=kooka kuickshow libkscan

OPTIONS=	IMLIB "Build Kuickshow, a fast and versatile image viewer" off \
		GPHOTO2 "Enable support for digital cameras" off \
		SANE "Build Kooka, a SANE scanner frontend for KDE" off

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

.if defined(WITH_IMLIB)
RUN_DEPENDS+=	kuickshow:${PORTSDIR}/graphics/kuickshow
.elif defined(WITHOUT_IMLIB)
CONFIGURE_ARGS+=--without-imlib-config
.endif

.if defined(WITH_GPHOTO2)
RUN_DEPENDS+=	${LOCALBASE}/lib/kde3/kcm_kamera.la:${PORTSDIR}/graphics/kamera
.elif defined(WITHOUT_GPHOTO2)
CONFIGURE_ARGS+=--without-kamera
.endif

.if defined(WITH_SANE)
RUN_DEPENDS+=	kooka:${PORTSDIR}/graphics/kooka
.endif

.if defined(DO_NOT_COMPILE)
CONFIGURE_ENV+=DO_NOT_COMPILE="${DO_NOT_COMPILE}"
.endif # defined(DO_NOT_COMPILE)

pre-configure:
	${REINPLACE_CMD} \
	-E -e '/^SUBDIRS/s/(kamera|kooka|kuickshow)//g' \
		${WRKSRC}/doc/Makefile.in

.include <bsd.port.post.mk>
