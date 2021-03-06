# New ports collection makefile for:   gtk13
# Date Created:			28 Sep 1997
# Whom:				Vanilla I. Shu <vanilla@MinJe.com.TW>
#
# $MidnightBSD: mports/x11-toolkits/gtk20/Makefile,v 1.7 2007/08/15 17:08:34 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/gtk20/Makefile,v 1.182 2006/07/02 19:22:57 marcus Exp $
#   $MCom: ports-stable/x11-toolkits/gtk20/Makefile,v 1.8 2006/03/13 22:32:30 mezz Exp $
#

PORTNAME=	gtk
PORTVERSION=	2.10.14
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_GNOME:S,%SUBDIR%,sources/gtk+/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}/,} \
		ftp://ftp.gtk.org/pub/gtk/v2.10/ \
		ftp://ftp.gimp.org/pub/%SUBDIR%/ \
		ftp://ftp.cs.umn.edu/pub/gimp/%SUBDIR%/ \
		http://www.ameth.org/gimp/%SUBDIR%/ \
		ftp://ftp.mirror.ac.uk/sites/ftp.gimp.org/pub/%SUBDIR%/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/gimp/%SUBDIR%,}
MASTER_SITE_SUBDIR=	gtk/v${PORTVERSION:R}
DISTNAME=	gtk+-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gimp Toolkit for X11 GUI (current stable version)

USE_BZIP2=	yes
LATEST_LINK=	gtk20

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	pango:${PORTSDIR}/x11-toolkits/pango \
		png.5:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff \
		jpeg.9:${PORTSDIR}/graphics/jpeg
RUN_DEPENDS=	${LOCALBASE}/share/mime/magic:${PORTSDIR}/misc/shared-mime-info \
		${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USE_GMAKE=	yes
USE_XPM=	yes
USE_PERL5=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack atk pango ltverhack
USE_GETTEXT=	yes
USE_XLIB=	yes
CONFIGURE_ARGS=	--enable-static --with-xinput=yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include/freetype2 \
			  -I${LOCALBASE}/include -I${X11BASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"
GTK_VERSION=	2.10.0
PLIST_SUB=	GTK_VERSION="${GTK_VERSION}"

gdk_pixbuf_MAN=	gdk-pixbuf-query-loaders.1
gtk_MAN=	gtk-query-immodules-2.0.1 gtk-update-icon-cache.1

MAN1=		${gdk_pixbuf_MAN} ${gtk_MAN}

SUB_FILES= 	pkg-install

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug=yes
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_CUPS) || exists(${LOCALBASE}/lib/libcups.so)
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-base
PLIST_SUB+=	CUPS:=""
.else
PLIST_SUB+=	CUPS:="@comment "
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${GREP} -l lgmodule | \
		${XARGS} ${REINPLACE_CMD} -e 's|-lgmodule|@GMODULE_LIBS@|g'
	@${REINPLACE_CMD} -e 's|[{]libdir[}]/locale|{datadir}/locale|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g ; \
		s|%%X11BASE%%|${X11BASE}|g' \
		${WRKSRC}/gtk/xdgmime/xdgmime.c
# GnomeVFS needs pthread; gtk-demo may use GnomeVFS (via GtkFileChooser)
	@${REINPLACE_CMD} -e 's|@CFLAGS@|& ${PTHREAD_CFLAGS}|; \
		s|@LDFLAGS@|& ${PTHREAD_LIBS}|' \
		${WRKSRC}/demos/gtk-demo/Makefile.in
	@${REINPLACE_CMD} -e 's|@LN_S@|${LN} -sf|' ${WRKSRC}/gtk/Makefile.in
	@${REINPLACE_CMD} -e 's|file,cups|file,cups,lpr|' \
		${WRKSRC}/gtk/Makefile.in

pre-build:
	@${RM} -rf ${WRKSRC}/docs/gtk.info*

post-install:
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/modules
	@${MKDIR} ${PREFIX}/lib/gtk-2.0/${GTK_VERSION}/engines
	${INSTALL_MAN} ${gdk_pixbuf_MAN:S|^|${WRKSRC}/docs/reference/gdk-pixbuf/|} \
		${PREFIX}/man/man1
	${INSTALL_MAN} ${gtk_MAN:S|^|${WRKSRC}/docs/reference/gtk/|} \
		${PREFIX}/man/man1

.include <bsd.port.post.mk>

.endif
