# New ports collection makefile for:    The GIMP
# Date created:         Mon Nov 18 21:28:43 CST 1996
# Whom:                 erich@FreeBSD.org
#
# $MidnightBSD$
#

PORTNAME=	gimp-app
DISTVERSION=	2.4.5
PORTREVISION?=	0
PORTEPOCH?=	1
CATEGORIES?=	graphics gnome
MASTER_SITES=	ftp://ftp.gimp.org/pub/%SUBDIR%/ \
		http://gimp.mirrors.hoobly.com/%SUBDIR%/ \
		http://ftp.gwdg.de/pub/misc/grafik/gimp/%SUBDIR%/ \
		ftp://ftp.fh-heilbronn.de/mirrors/ftp.gimp.org/%SUBDIR%/ \
		ftp://ftp.insync.net/pub/mirrors/ftp.gimp.org/%SUBDIR%/ \
		http://www.mirrorservice.org/sites/ftp.gimp.org/pub/%SUBDIR%/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/%SUBDIR%,}
MASTER_SITE_SUBDIR=	gimp/v${PORTVERSION:R}
DISTNAME=	gimp-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNU Image Manipulation Program
LICENSE=	gpl2

LIB_DEPENDS=	exif.12:${PORTSDIR}/graphics/libexif \
		wmf.2:${PORTSDIR}/graphics/libwmf \
		poppler-glib.2:${PORTSDIR}/graphics/poppler-gtk \
		aa.1:${PORTSDIR}/graphics/aalib \
		mng.1:${PORTSDIR}/graphics/libmng \
		png.5:${PORTSDIR}/graphics/png \
		jpeg.9:${PORTSDIR}/graphics/jpeg \
		tiff.4:${PORTSDIR}/graphics/tiff \
		lcms.1:${PORTSDIR}/graphics/lcms

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XORG=	xpm xmu xext
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
USE_GNOME+=	gnomehack intltool intlhack gtk20 libartlgpl2 ltverhack desktopfileutils
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
LIBTOOLFLAGS=	--disable-ltlibs --release-ignore
CONFIGURE_ARGS?=--disable-perl \
		--with-html-dir=${PREFIX}/share/doc/gimp \
		--disable-gtk-doc \
		--without-print \
		--disable-python \
		--with-desktop-dir=${PREFIX}/share \
		--docdir=${PREFIX}/share/doc/gimp \
		--enable-default-binary
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		GIMP_THREAD_LIBS=${PTHREAD_LIBS}

.if !defined(GIMP_SLAVE)
OPTIONS?=	DEBUG "debugging" off \
		DBUS "D-BUS support" on \
		GNOMEVFS "Use GNOME VFS for the URI plug-in" on \
		HELPBROWSER "internal help browser" on \
		MP "multiple processor support" off \
		RSVG "SVG format support" on
.endif

.include <bsd.port.pre.mk>

.if defined(GIMP_SLAVE)
PKG_CONFIG?=	${LOCALBASE}/bin/pkg-config
GIMP_LIBS=	`${PKG_CONFIG} --libs gimp-2.0`
GIMP_THUMB_LIBS=`${PKG_CONFIG} --libs gimpthumb-2.0`
GIMP_UI_LIBS=	`${PKG_CONFIG} --libs gimpui-2.0`

LIB_DEPENDS+=	gimp-2.0.0:${PORTSDIR}/graphics/gimp-app

.else

MAN1+=	gimp-2.4.1 gimp-remote-2.4.1 gimptool-2.0.1
MAN5+=	gimprc-2.4.5
MLINKS=	gimp-2.4.1 gimp.1 \
	gimp-2.4.1 gimp-console-2.4.1 \
	gimp-console-2.4.1 gimp-console.1 \
	gimp-remote-2.4.1 gimp-remote.1 \
	gimprc-2.4.5 gimprc.5

.if defined(WITHOUT_RSVG)
CONFIGURE_ARGS+=	--without-librsvg
PLIST_SUB+=		SVG="@comment "
.else
USE_GNOME+=		librsvg2
PLIST_SUB+=		SVG=""
.endif

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_MP)
CONFIGURE_ARGS+=	--enable-mp
.else
CONFIGURE_ARGS+=	--disable-mp
.endif

.if ${HAVE_GNOME:Mgnomehier}!="" || defined(WITH_GNOME)
USE_GNOME+=		desktopfileutils gnomehier
PLIST_SUB+=		GNOME=""
.else
PLIST_SUB+=		GNOME="@comment "
.endif

.if defined(WITH_HELPBROWSER)
USE_GNOME+=		libgtkhtml
CONFIGURE_ARGS+=	--with-gtkhtml2
PLIST_SUB+=		HELPBROWSER=""
.else
CONFIGURE_ARGS+=	--without-gtkhtml2
PLIST_SUB+=		HELPBROWSER="@comment "
.endif

.if defined(WITH_DBUS)
LIB_DEPENDS+=		dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
CONFIGURE_ARGS+=	--with-dbus
.else
CONFIGURE_ARGS+=	--without-dbus
.endif

.if defined(WITH_GNOMEVFS) || ${HAVE_GNOME:Mgnomevfs2}!=""
LIB_DEPENDS+=	gnome-keyring.0:${PORTSDIR}/security/gnome-keyring
USE_GNOME+=	gnomevfs2
.endif

.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%GIMP_LIBS%%|${GIMP_LIBS}|; \
		s|%%GIMP_THUMB_LIBS%%|${GIMP_THUMB_LIBS}|; \
		s|%%GIMP_UI_LIBS%%|${GIMP_UI_LIBS}|' \
			${WRKSRC}/plug-ins/pygimp/Makefile.in
	@${REINPLACE_CMD} -e 's|"libpng"|"libpng12"|' \
		${WRKSRC}/configure

post-install:
.if !defined(GIMP_SLAVE)
.if ${HAVE_GNOME:Mgnomehier}!="" || defined(WITH_GNOME)
	${MKDIR} ${PREFIX}/share/mime-info ${PREFIX}/share/application-registry
	${INSTALL_DATA} ${WRKSRC}/desktop/gimp.applications ${PREFIX}/share/application-registry
	${INSTALL_DATA} ${WRKSRC}/desktop/gimp.keys ${PREFIX}/share/mime-info
.endif
.endif
	@-update-desktop-database

.include <bsd.port.post.mk>
