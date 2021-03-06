# New ports collection makefile for:	evince
# Date created:				09 January 2005
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/evince/Makefile,v 1.33 2008/02/26 18:35:39 ahze Exp $
#   $MCom: ports-stable/graphics/evince/Makefile,v 1.1 2007/12/01 19:16:37 marcus Exp $
#

PORTNAME=	evince
PORTVERSION=	2.20.2
CATEGORIES=	graphics print gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 multi-format document viewer
LICENSE=	gpl2

LIB_DEPENDS=	poppler-glib.2:${PORTSDIR}/graphics/poppler-gtk

USE_LDCONFIG=	yes
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GHOSTSCRIPT=yes
INSTALLS_OMF=	yes
USE_GNOME=	gnomehack intlhack gnomeprefix libgnomeui libgnomeprintui \
		desktopfileutils gnomedocutils
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	evince.schemas evince-thumbnailer.schemas \
		evince-thumbnailer-ps.schemas

MAN1=		evince.1

OPTIONS=	DVI		"Enable DVI viewer support"		off \
		T1LIB		"Enable T1LIB for TYPE1 fonts to DVI (Enables DVI)"	off \
		NAUTILUS	"Enable Nautilus plugin"		on  \
		DBUS		"Enable D-BUS support"			on \
		COMICS		"Enable comic book archives support"	off \
		IMPRESS		"Enable Impress presentations support"	off \
		DJVU		"Enable DJVU support"			off

.include <bsd.port.pre.mk>

.if defined(PACKAGE_BUILDING) || exists(${LOCALBASE}/lib/libdbus-glib-1.so)
WITH_DBUS=	yes
.endif

.if defined(WITH_DVI) || defined(WITH_T1LIB)
BUILD_DEPENDS+=	tex:${PORTSDIR}/print/teTeX-base
RUN_DEPENDS+=	tex:${PORTSDIR}/print/teTeX-base

CONFIGURE_ARGS+=	--enable-dvi
GCONF_SCHEMAS+=	evince-thumbnailer-dvi.schemas
. if defined(WITH_T1LIB)
LIB_DEPENDS+=	t1.5:${PORTSDIR}/devel/t1lib

CONFIGURE_ARGS+=	--enable-t1lib
. endif
.endif

.if !defined(WITHOUT_NAUTILUS)
USE_GNOME+=		nautilus2
CONFIGURE_ARGS+=	--enable-nautilus
PLIST_SUB+=		NAUTILUS=""
.else
CONFIGURE_ARGS+=	--disable-nautilus
PLIST_SUB+=		NAUTILUS="@comment "
.endif

.if defined(WITH_IMPRESS)
CONFIGURE_ARGS+=	--enable-impress
.else
CONFIGURE_ARGS+=	--disable-impress
.endif

.if exists(${LOCALBASE}/bin/djview)
DJVU_DIR?=	# empty
.else
DJVU_DIR?=	-nox11
.endif

.if defined(WITH_DJVU)
LIB_DEPENDS+=		djvulibre.20:${PORTSDIR}/graphics/djvulibre${DJVU_DIR}
CONFIGURE_ARGS+=	--enable-djvu
GCONF_SCHEMAS+=		evince-thumbnailer-djvu.schemas
.else
CONFIGURE_ARGS+=	--disable-djvu
.endif

.if !defined(WITHOUT_DBUS)
LIB_DEPENDS+=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
.endif

.if defined(WITH_COMICS)
CONFIGURE_ARGS+=	--enable-comics
GCONF_SCHEMAS+=	evince-thumbnailer-comics.schemas

RUN_DEPENDS+=	unrar:${PORTSDIR}/archivers/unrar \
		unzip:${PORTSDIR}/archivers/unzip
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|execinfo.h|#|g' \
		${WRKSRC}/configure

post-install:
	@-update-desktop-database

.include <bsd.port.post.mk>
