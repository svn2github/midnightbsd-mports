# New ports collection makefile for:	gnash
# Date created:				12 Jan 2006
# Whom:					Dmitry Marakasov <amdmi3@amdmi3.ru>
#
# $MidnightBSD: mports/graphics/gnash/Makefile,v 1.1 2007/03/15 02:27:09 laffer1 Exp $
# $FreeBSD: ports/graphics/gnash/Makefile,v 1.13 2007/02/10 06:05:01 kris Exp $
#

PORTNAME=	gnash
PORTVERSION=	0.7.1
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Flash movie player

LIB_DEPENDS=	png.5:${PORTSDIR}/graphics/png \
		jpeg.9:${PORTSDIR}/graphics/jpeg \
		ogg.5:${PORTSDIR}/audio/libogg

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_GL=		yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehier glib20 pkgconfig libxml2
USE_SDL=	sdl mixer
USE_GCC=	3.4+

PLUGIN_DIR=	${PREFIX}/lib/browser_plugins

CONFIGURE_ENV=	LDFLAGS="${LDFLAGS} -Wl,--rpath,${PREFIX}/lib/gnash" \
		CFLAGS="-I${LOCALBASE}/include ${CFLAGS}"

CONFIGURE_ARGS=	--libdir="${PREFIX}/lib/gnash" \
		--with-plugindir=${PLUGIN_DIR}

OPTIONS=	PLUGIN	"Enable firefox plugin" on

.include <bsd.port.pre.mk>

.if !defined(WITH_PLUGIN)
CONFIGURE_ARGS+=	--disable-plugin
PLIST_SUB+=	PLUGIN="@comment "
.else
USE_GNOME+=	atk pango gtk20
LIB_DEPENDS+=	gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext
PLIST_SUB+=	PLUGIN=""
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|gnash-dbg.log|.gnash-dbg.log|' ${WRKSRC}/libbase/log.h
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g;s|/usr/X11R6|${X11BASE}|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure
.if !defined(WITH_PLUGIN)
	@${REINPLACE_CMD} -e '/STD_DIRS/ s|plugin||' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.post.mk>
