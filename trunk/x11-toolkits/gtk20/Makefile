# $MidnightBSD$

PORTNAME=	gtk
PORTVERSION=	2.24.22
PORTREVISION?=	2
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gtk+/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	gtk+-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gimp Toolkit for X11 GUI (previous stable version)

LICENSE=	lgpl

USES=		tar:xz

.if !defined(REFERENCE_PORT)

RUN_DEPENDS+=	${LOCALBASE}/share/mime/magic:${PORTSDIR}/misc/shared-mime-info \
		${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USE_PERL5_BUILD=yes
USE_PYTHON=	2.5-2.7
USE_LDCONFIG=	yes
USE_GNOME=	atk pango gdkpixbuf2 gtk-update-icon-cache introspection:build
USES+=		gettext gmake libtool:keepla pathfix perl5 pkgconfig
GNU_CONFIGURE=	yes
USE_XORG=	xext xrender x11 xinerama xi xrandr xcursor xfixes xdamage \
		xcomposite xau xdmcp xproto
CONFIGURE_ARGS=	--with-xinput=yes
CPPFLAGS+=	-I${LOCALBASE}/include/freetype2 \
		-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	CUPS DEBUG
OPTIONS_DEFAULT=CUPS
OPTIONS_SUB=	yes

CUPS_LIB_DEPENDS=	libcups.so:${PORTSDIR}/print/cups-client
CUPS_CONFIGURE_ON=	--enable-cups=auto
CUPS_CONFIGURE_OFF=	--disable-cups
DEBUG_CONFIGURE_ON=	--enable-debug=yes

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${GREP} -l lgmodule | \
		${XARGS} ${REINPLACE_CMD} -e 's|-lgmodule|@GMODULE_LIBS@|g'
	@${REINPLACE_CMD} -e 's|[{]libdir[}]/locale|{datadir}/locale|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|@LN_S@|${LN} -sf|' ${WRKSRC}/gtk/Makefile.in
	@${REINPLACE_CMD} -e 's|file,cups|file,cups,lpr|' \
		${WRKSRC}/gtk/Makefile.in

pre-build:
	@${RM} -rf ${WRKSRC}/docs/gtk.info*

post-install:
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/modules
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/engines
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/loaders
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK2_VERSION}/modules
	${INSTALL_MAN} ${WRKSRC}/docs/reference/gtk/gtk-query-immodules-2.0.1 \
		${PREFIX}/man/man1

.include <bsd.port.mk>

.endif
