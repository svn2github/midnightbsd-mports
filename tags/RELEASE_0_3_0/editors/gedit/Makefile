# New ports collection makefile for:	gedit2
# Date created:				14 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/editors/gedit/Makefile,v 1.6 2008/11/06 22:29:25 ctriv Exp $
# $FreeBSD: ports/editors/gedit/Makefile,v 1.66 2007/12/12 04:36:21 marcus Exp $
#   $MCom: ports-stable/editors/gedit/Makefile,v 1.9 2007/12/02 02:00:32 marcus Exp $
#

PORTNAME=	gedit
PORTVERSION=	2.26.3
PORTREVISION=	1
CATEGORIES=	editors gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small but powerful text editor for GNOME 2 Desktop Environment
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
LIB_DEPENDS=	enchant.1:${PORTSDIR}/textproc/enchant
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes

USE_XORG=	sm
USE_BZIP2=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
USE_GNOME=	gnomeprefix gnomehack intlhack gconf2 gtksourceview2 \
		desktopfileutils gnomedocutils ltasneededhack
WANT_GNOME=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
PLIST_SUB=	VERSION="2.20"

MAN1=		gedit.1
GCONF_SCHEMAS=	gedit.schemas gedit-file-browser.schemas

.if defined(PACKAGE_BUILDING)
.undef WITHOUT_GNOME
WITH_GNOME=	yes
.endif

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mpygtksourceview}!=""
USE_PYTHON=	yes
EXTENSIONS+=	python
USE_GNOME+=	pygtksourceview
CONFIGURE_ARGS+=--enable-python
PLIST_SUB+=	PYTHON=""
.else
CONFIGURE_ARGS+=--disable-python
PLIST_SUB+=	PYTHON="@comment "
.endif

#pre-build:
#	${MKDIR} ${WRKSRC}/bindings/python/.deps
#.for ff in gedit_la-gedit.Plo gedit_la-geditcommands.Plo gedit_la-geditutils.Plo
#	${TOUCH} ${WRKSRC}/bindings/python/.deps/${ff}
#.endfor

post-install:
	@-update-desktop-database

.include <bsd.port.post.mk>
