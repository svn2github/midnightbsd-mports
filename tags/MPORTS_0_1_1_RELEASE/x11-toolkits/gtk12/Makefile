# New ports collection makefile for:   gtk12
# Date Created:			28 Sep 1997
# Whom:				Vanilla I. Shu <vanilla@MinJe.com.TW>
#
# $MidnightBSD: mports/x11-toolkits/gtk12/Makefile,v 1.2 2007/03/20 18:42:45 ctriv Exp $
# $FreeBSD: ports/x11-toolkits/gtk12/Makefile,v 1.104 2006/02/23 10:40:17 ade Exp $
#

PORTNAME=	gtk
PORTVERSION=	1.2.10
PORTREVISION=	16
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/gtk+/1.2
DISTNAME=	gtk+-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gimp Toolkit for X11 GUI (previous stable version)

USE_PERL5=	yes
USE_GNOME=	glib12
INSTALLS_SHLIB=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ARGS=	--includedir=${PREFIX}/include/gtk12 --with-native-locale \
		--with-xinput=xfree
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		X_CFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"
.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

INFO=		gdk gtk
MAN1=		gtk-config.1

pre-build:
	${RM} -rf ${WRKSRC}/docs/gtk.info*

post-install:
	@${MKDIR} ${PREFIX}/lib/gtk/themes/engines
	@cd ${PREFIX}/bin && ${LN} -sf gtk-config gtk12-config
.for lib in gdk gtk
	@${RM} ${PREFIX}/lib/lib${lib}.la ${PREFIX}/lib/lib${lib}.so
	@${MV} ${PREFIX}/lib/lib${lib}.a ${PREFIX}/lib/lib${lib}-12.a
.endfor

.include <bsd.port.mk>
