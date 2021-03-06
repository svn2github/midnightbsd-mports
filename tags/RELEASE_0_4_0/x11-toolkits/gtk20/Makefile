# $MidnightBSD: mports/x11-toolkits/gtk20/Makefile,v 1.35 2013/03/24 16:33:33 laffer1 Exp $

PORTNAME=	gtk
PORTVERSION=	2.24.17
PORTREVISION?=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gtk+/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	gtk+-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gimp Toolkit for X11 GUI (previous stable version)
LICENSE=	lgpl

USE_XZ=		yes
LATEST_LINK=	gtk20

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS+=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS+=	${LOCALBASE}/share/mime/magic:${PORTSDIR}/misc/shared-mime-info \
		${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USE_GMAKE=	yes
USE_PERL5_BUILD=yes
USE_PYTHON=	2.5-2.7
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack atk pango gdkpixbuf2 ltverhack gtk-update-icon-cache
USE_GETTEXT=	yes
USE_XORG=	xext xrender x11 xinerama xi xrandr xcursor xfixes xdamage \
		xcomposite xau xdmcp xproto
CONFIGURE_ARGS=	--enable-static --with-xinput=yes
CPPFLAGS+=	-I${LOCALBASE}/include/freetype2 \
		-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		gtk-query-immodules-2.0.1

OPTIONS_DEFINE=	CUPS DEBUG
OPTIONS_DEFAULT=CUPS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MCUPS}
LIB_DEPENDS+=	cups:${PORTSDIR}/print/cups-client
CONFIGURE_ARGS+=--enable-cups=auto
PLIST_SUB+=	CUPS:=""
.else
CONFIGURE_ARGS+=--disable-cups
PLIST_SUB+=	CUPS:="@comment "
.endif

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=--enable-debug=yes
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${GREP} -l lgmodule | \
		${XARGS} ${REINPLACE_CMD} -e 's|-lgmodule|@GMODULE_LIBS@|g'
	@${REINPLACE_CMD} -e 's|[{]libdir[}]/locale|{datadir}/locale|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|@LN_S@|${LN} -sf|' ${WRKSRC}/gtk/Makefile.in
	@${REINPLACE_CMD} -e 's|file,cups|file,cups,lpr|' \
		${WRKSRC}/gtk/Makefile.in

pre-configure:
.if !exists(${LOCALBASE}/libdata/pkgconfig/cairo-xlib.pc)
	@${ECHO_CMD} "${PKGNAME}: Needs cairo with X11 support enabled."
	@${FALSE}
.endif

pre-build:
	@${RM} -rf ${WRKSRC}/docs/gtk.info*

post-install:
	-@${FIND} ${LOCALBASE}/share/icons -type d -depth 1 -exec \
		${PREFIX}/bin/gtk-update-icon-cache -q -f {} \; 2>/dev/null
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/modules
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/engines
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/loaders
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/modules
	${INSTALL_MAN} ${MAN1:S|^|${WRKSRC}/docs/reference/gtk/|} \
		${PREFIX}/man/man1

.include <bsd.port.mk>

.endif
