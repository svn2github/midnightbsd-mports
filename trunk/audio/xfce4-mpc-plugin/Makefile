# $MidnightBSD$

PORTNAME=	xfce4-mpc-plugin
PORTVERSION=	0.4.4
PORTREVISION=	1
CATEGORIES=	audio xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=src/panel-plugins/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPC plugin for Xfce

LICENSE=	other

LIB_DEPENDS=	libmpd.so:${PORTSDIR}/audio/libmpd
RUN_DEPENDS=	musicpd:${PORTSDIR}/audio/musicpd

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		gettext gmake libtool pkgconfig tar:bzip2
USE_GNOME=	gtk20 intltool intlhack
USE_XFCE=	configenv libexo libmenu panel

.include <bsd.port.mk>
