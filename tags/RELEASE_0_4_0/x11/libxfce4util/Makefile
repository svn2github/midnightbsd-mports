# New ports collection makefile for:	libxfce4util
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11/libxfce4util/Makefile,v 1.5 2011/02/09 13:59:51 laffer1 Exp $
# $FreeBSD: ports/x11/libxfce4util/Makefile,v 1.35 2008/06/06 14:09:04 edwin Exp $
#

PORTNAME=	libxfce4util
PORTVERSION=	4.8.2
CATEGORIES=	x11 xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/xfce/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 library with non-graphical helper functions
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 gnomehack intltool intlhack pkgconfig
USE_PERL5=	yes
USE_LDCONFIG=	yes
USE_XFCE=	configenv

OPTIONS=	NLS "Enable Native Language Support" on \
	APIDOCS "Install api documentation" off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITHOUT_APIDOCS)
CONFIGURE_ARGS+=--without-html-dir
PLIST_SUB+=	APIDOCS="@comment "
.else
CONFIGURE_ARGS+=--with-html-dir=${PREFIX}/share/gtk-doc/html
PLIST_SUB+=	APIDOCS=""
.endif

.include <bsd.port.post.mk>
