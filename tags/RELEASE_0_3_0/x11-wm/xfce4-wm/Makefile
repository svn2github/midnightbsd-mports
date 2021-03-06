# New ports collection makefile for:	xfwm4
# Date created:		August 14, 2002
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/x11-wm/xfce4-wm/Makefile,v 1.1 2008/09/25 13:59:07 laffer1 Exp $
# $FreeBSD: ports/x11-wm/xfce4-wm/Makefile,v 1.46 2008/06/06 14:17:21 edwin Exp $
#

PORTNAME=	xfce4-wm
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	x11-wm xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfwm4-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 window manager
LICENSE=	gpl2

CONFIGURE_ARGS=	--enable-xinerama
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 intltool intlhack pkgconfig
USE_LDCONFIG=	yes
USE_XFCE=	configenv xfconf libutil libgui panel

OPTIONS=	COMPOSITE	"Support the experimental X11 Composite extension"	on \
		STARTUP 	"Enable startup notification support"			on \

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_COMPOSITE)
CONFIGURE_ARGS+=--enable-compositor
.else
CONFIGURE_ARGS+=--disable-compositor
.endif

.if !defined(WITHOUT_STARTUP)
LIB_DEPENDS+=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
CONFIGURE_ARGS+=--enable-startup-notification
.else
CONFIGURE_ARGS+=--disable-startup-notification
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|\(#define ShapeInput 2\);|\1|' \
		${WRKSRC}/src/frame.c

.include <bsd.port.post.mk>
