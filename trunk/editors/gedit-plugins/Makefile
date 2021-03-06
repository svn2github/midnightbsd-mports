# $MidnightBSD$

PORTNAME=	gedit-plugins
PORTVERSION=	2.32.0
PORTREVISION=	1
CATEGORIES=	editors gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plugins for GEdit 2
LICENSE=	gpl2

BUILD_DEPENDS=	gedit:${PORTSDIR}/editors/gedit \
		gucharmap:${PORTSDIR}/deskutils/gucharmap
RUN_DEPENDS=	gedit:${PORTSDIR}/editors/gedit \
		gucharmap:${PORTSDIR}/deskutils/gucharmap

CONFLICTS=	gedit-plugins-3.[0-9]*

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USES=		gettext gmake libtool:keepla pathfix pkgconfig tar:bzip2
USE_GNOME=	gnomeprefix intlhack gnomevfs2
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GCONF_SCHEMAS=	gedit-show-tabbar-plugin.schemas \
		gedit-drawspaces.schemas

OPTIONS_DEFINE=	PYTHON

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPYTHON}
USE_PYTHON=	yes
USE_GNOME+=	pygtksourceview
BUILD_DEPENDS+=	${PYTHON_SITELIBDIR}/gtk-2.0/vtemodule.so:${PORTSDIR}/x11-toolkits/py-vte \
		${PYTHON_SITELIBDIR}/dbus/bus.py:${PORTSDIR}/devel/py-dbus \
		${PYTHON_SITELIBDIR}/gtksourceview2.so:${PORTSDIR}/x11-toolkits/py-gtksourceview
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/gtk-2.0/vtemodule.so:${PORTSDIR}/x11-toolkits/py-vte \
		${PYTHON_SITELIBDIR}/dbus/bus.py:${PORTSDIR}/devel/py-dbus \
		${PYTHON_SITELIBDIR}/gtksourceview2.so:${PORTSDIR}/x11-toolkits/py-gtksourceview
CONFIGURE_ARGS+=--enable-python
PLIST_SUB+=	PYTHON=""
.else
CONFIGURE_ARGS+=--disable-python
PLIST_SUB+=	PYTHON="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's| \\t\\r\\n\\f|[:space:]|g' \
	    	${WRKSRC}/configure

.include <bsd.port.mk>
