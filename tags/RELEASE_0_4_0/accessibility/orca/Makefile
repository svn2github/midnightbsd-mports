# $MidnightBSD: mports/accessibility/orca/Makefile,v 1.9 2013/03/24 19:16:49 laffer1 Exp $

PORTNAME=	orca
PORTVERSION=	2.32.1
PORTREVISION=	2
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scriptable screen reader
LICENSE=	lgpl

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/_dbus_bindings.so:${PORTSDIR}/devel/py-dbus \
		${PYTHON_SITELIBDIR}/pyatspi/__init__.py:${PORTSDIR}/accessibility/at-spi \
		${PYTHON_SITELIBDIR}/xdg/__init__.py:${PORTSDIR}/devel/py-xdg
LIB_DEPENDS=	gnome-mag.2:${PORTSDIR}/accessibility/gnome-mag
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/_dbus_bindings.so:${PORTSDIR}/devel/py-dbus \
		${PYTHON_SITELIBDIR}/pyatspi/__init__.py:${PORTSDIR}/accessibility/at-spi \
		${PYTHON_SITELIBDIR}/xdg/__init__.py:${PORTSDIR}/devel/py-xdg

LATEST_LINK=	gnome-orca

USE_BZIP2=	yes
USES=		gettext
USE_PYTHON=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack libgnomeui gnomespeech pygnome2 \
		pygnomedesktop
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		orca.1

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/src/orca/orca.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
	    	${WRKSRC}/src/orca/orca_i18n.py

.include <bsd.port.mk>
