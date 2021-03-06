# New ports collection makefile for:   pango
# Date Created:			18 July 2000
# Whom:				Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/pango/Makefile,v 1.5 2007/04/26 03:48:36 ctriv Exp $
# $FreeBSD: ports/x11-toolkits/pango/Makefile,v 1.85 2006/09/16 05:24:31 ahze Exp $
#   $MCom: ports/x11-toolkits/pango/Makefile,v 1.60 2006/04/27 11:12:49 ahze Exp $
#

PORTNAME=	pango
PORTVERSION=	1.16.5
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_GNOME:S,%SUBDIR%,sources/pango/1.16,}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source framework for the layout and rendering of i18n text

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	freetype-config:${PORTSDIR}/print/freetype2
LIB_DEPENDS=	cairo.2:${PORTSDIR}/graphics/cairo
RUN_DEPENDS=	${FONTSCALE}:${X_FONTS_TTF_PORT} \
		${FONTENCOD}:${X_FONTS_ENCODINGS_PORT}

USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack glib20 ltverhack referencehack
CONFIGURE_ARGS=	--with-qt=no \
		--with-html-dir=${PREFIX}/share/doc \
		--enable-static
SUB_FILES=	pkg-install
# Hmm.. tough one.  Found this one when I had graphics/hdf installed
# (which installs glist.h) which is picked up before the glib-2.0
# stuff, with Bad Results[tm]
#
GLIB2_CFLAGS=	`pkg-config glib-2.0 --cflags`
PLIST_SUB=	VERSION="1.6.0"

FONTSCALE=	${X11BASE}/lib/X11/fonts/TTF/luximb.ttf
FONTENCOD=	${X11BASE}/lib/X11/fonts/encodings/encodings.dir

MAN1=		pango-querymodules.1

.if defined(WITHOUT_X11)
CONFIGURE_ARGS+=	--with-x=no
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include/freetype2 \
				${GLIB2_CFLAGS} -I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
PLIST_SUB+=		X11="@comment "
.else
USE_XLIB+=		yes
LIB_DEPENDS+=		Xft.2:${PORTSDIR}/x11-fonts/libXft
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include/freetype2 \
				${GLIB2_CFLAGS} -I${LOCALBASE}/include \
				-I${X11BASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"
PLIST_SUB+=		X11=""
.endif

.include <bsd.port.mk>

.endif
