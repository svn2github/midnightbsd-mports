# $MidnightBSD$
# $FreeBSD: ports/textproc/ibus/Makefile,v 1.16 2011/01/13 02:44:25 wen Exp $

PORTNAME=	ibus
PORTVERSION=	1.3.9
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Intelligent Input Bus for Linux / Unix OS
LICENSE=	lgpl

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dbus>=0.83.0:${PORTSDIR}/devel/py-dbus \
		librsvg2>=2.0:${PORTSDIR}/graphics/librsvg2
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dbus>=0.83.0:${PORTSDIR}/devel/py-dbus \
		${PYTHON_SITELIBDIR}/gtk-2.0/pynotify/__init__.py:${PORTSDIR}/devel/py-notify \
		${PYTHON_SITELIBDIR}/xdg/__init__.py:${PORTSDIR}/devel/py-xdg \
		librsvg2>=2.0:${PORTSDIR}/graphics/librsvg2

USE_PYTHON=	yes
USE_GNOME=	pygtk2 gconf2
USE_QT_VER=	4

USE_LDCONFIG=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
GCONF_SCHEMAS=	ibus.schemas

OPTIONS=	ISOCODES "Use isocodecs" on \
		VALA "Install vala binding" on \
		GINTRO "Install GObject Introspection data" on

.include <bsd.port.pre.mk>

.if defined(WITH_ISOCODES)
BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
RUN_DEPENDS+=	${LOCALBASE}/share/xml/iso-codes/iso_639.xml:${PORTSDIR}/misc/iso-codes
.else
CONFIGURE_ARGS+=	--disable-iso-codes-check
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CPPFLAGS=	-I${LOCALBASE}/include
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITH_VALA)
CONFIGURE_ARGS+=	--enable-vala
PLIST_SUB+=	VALA=""
.else
CONFIGURE_ARGS+=	--disable-vala
PLIST_SUB+=	VALA="@comment "
.endif

.if defined(WITH_GINTRO)
BUILD_DEPENDS+=		gobject-introspection>=0.6.8:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS+=		gobject-introspection>=0.6.8:${PORTSDIR}/devel/gobject-introspection
CONFIGURE_ARGS+=	--enable-introspection=yes
PLIST_SUB+=		GINTRO=""
.else
CONFIGURE_ARGS+=	--enable-introspection=no
PLIST_SUB+=		GINTRO="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr/share/xml/iso-codes/|${LOCALBASE}/share/xml/iso-codes/|g' ${WRKSRC}/ibus/lang.py
	@${REINPLACE_CMD} -e 's|locale.bind_textdomain_codeset|gettext.bind_textdomain_codeset|g' ${WRKSRC}/setup/main.py
	@${REINPLACE_CMD} -e 's|locale.bind_textdomain_codeset|gettext.bind_textdomain_codeset|g' ${WRKSRC}/ui/gtk/main.py
	@${REINPLACE_CMD} -e 's|import locale|import gettext|g' ${WRKSRC}/ui/gtk/main.py
	@${REINPLACE_CMD} -e 's|setpgrp ()|setpgrp (0,0)|g' ${WRKSRC}/bus/main.c

post-install:
	@gtk-query-immodules-2.0 > ${LOCALBASE}/etc/gtk-2.0/gtk.immodules
	@${CAT} ${PKGMESSAGE}
	@${ECHO} To display this message again, type ${PKG_INFO} -D ${PKGNAME}

post-deinstall:
	@gtk-query-immodules-2.0 > ${LOCALBASE}/etc/gtk-2.0/gtk.immodules

.include <bsd.port.post.mk>
