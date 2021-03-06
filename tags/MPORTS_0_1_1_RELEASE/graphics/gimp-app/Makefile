# New ports collection makefile for:    The GIMP
# Date created:         Mon Nov 18 21:28:43 CST 1996
# Whom:                 erich@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/gimp-app/Makefile,v 1.210 2007/07/23 15:45:04 ahze Exp $
#    $MCom: ports/graphics/gimp-app/Makefile,v 1.12 2007/03/30 18:22:45 ahze Exp $

PORTNAME=	gimp-app
PORTVERSION=	2.2.17
PORTEPOCH=	1
CATEGORIES=	graphics gnome
MASTER_SITES=	ftp://ftp.gimp.org/pub/%SUBDIR%/ \
		http://gimp.mirrors.hoobly.com/%SUBDIR%/ \
		http://ftp.gwdg.de/pub/misc/grafik/gimp/%SUBDIR%/ \
		ftp://ftp.fh-heilbronn.de/mirrors/ftp.gimp.org/%SUBDIR%/ \
		ftp://ftp.insync.net/pub/mirrors/ftp.gimp.org/%SUBDIR%/ \
		http://www.mirrorservice.org/sites/ftp.gimp.org/pub/%SUBDIR%/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/%SUBDIR%,}
MASTER_SITE_SUBDIR=	gimp/v${PORTVERSION:R}
DISTNAME=	gimp-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNU Image Manipulation Program

LIB_DEPENDS=	wmf.2:${PORTSDIR}/graphics/libwmf \
		aa.1:${PORTSDIR}/graphics/aalib \
		exif.12:${PORTSDIR}/graphics/libexif \
		mng.1:${PORTSDIR}/graphics/libmng \
		png.5:${PORTSDIR}/graphics/png \
		jpeg.9:${PORTSDIR}/graphics/jpeg \
		tiff.4:${PORTSDIR}/graphics/tiff

CONFLICTS=	gimp-1.* gimpshop-[0-9]* gimp-app-devel-[0-9]*

SHLIBVER?=	200

USE_BZIP2=	yes
USE_XPM=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack intltool intlhack gtk20 libartlgpl2
WANT_GNOME=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
PLIST_SUB=	SHLIBVER="${SHLIBVER}"
CONFIGURE_ARGS=	--disable-perl \
		--with-html-dir=${PREFIX}/share/doc/gimp \
		--docdir=${PREFIX}/share/doc/gimp \
		--disable-gtk-doc \
		--enable-static \
		--disable-print
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"

MAN1=	gimp.1 gimp-2.2.1 gimp-remote.1 gimp-remote-2.2.1 gimptool-2.0.1
MAN5=	gimprc.5 gimprc-2.2.5

OPTIONS=	DEBUG "debugging" off \
		PYTHON "Python-Fu support" off \
		RSVG "SVG format support" on \
		HTML_HELP_BROWSER "GIMP help browser" on \
		MP "multiple processor support" off

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_PYTHON)
USE_PYTHON=		yes
# we need to manually include this, because USE_PYTHON is defined
# after including bsd.port.pre.mk
.include "${PORTSDIR}/Mk/bsd.python.mk"
USE_GNOME+=		pygtk2
CONFIGURE_ARGS+=	--enable-python
PLIST_SUB+=		PYTHON:=""
.else
CONFIGURE_ARGS+=	--disable-python
PLIST_SUB+=		PYTHON:="@comment "
.endif

.if defined(WITHOUT_RSVG)
CONFIGURE_ARGS+=	--without-librsvg
PLIST_SUB+=		SVG="@comment "
.else
USE_GNOME+=		librsvg2
PLIST_SUB+=		SVG=""
.endif

.if defined(WITH_MP)
CONFIGURE_ARGS+=	--enable-mp
.endif

.if ${HAVE_GNOME:Mgnomepanel}!=""
USE_GNOME+=		gnomepanel desktopfileutils
CONFIGURE_ARGS+=	--with-desktop-dir=${LOCALBASE}/share/gnome
CONFIGURE_ENV+=		GIMP_THREAD_LIBS=${PTHREAD_LIBS}
PLIST_SUB+=		GNOMEPANEL:=""
GNOME_ENABLED=		yes
.else
PLIST_SUB+=		GNOMEPANEL:="@comment "
CONFIGURE_ENV+=		GIMP_THREAD_LIBS=${PTHREAD_LIBS}
.endif

.if defined(WITH_HTML_HELP_BROWSER)
USE_GNOME+=		libgtkhtml
PLIST_SUB+=		HELPBROWSER:=""
.else
PLIST_SUB+=		HELPBROWSER:="@comment "
post-patch:
	@${REINPLACE_CMD} -e 's|\(have_gtkhtml2=\)yes|\1no|' ${WRKSRC}/configure
.endif

.if defined(GNOME_ENABLED)
post-install:
	@-update-desktop-database
.endif

.include <bsd.port.post.mk>
