# $MidnightBSD$

PORTNAME=	gtk-xfce-engine
PORTVERSION=	3.0.1
PORTREVISION=	1
CATEGORIES=	x11-themes xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=	src/xfce/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xfce gtk theme engine

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_GNOME=	glib20 gnomehack gtk20
USE_XFCE=	configenv	# to get MASTER_SITE_SUBDIR something has to be defined
USES=		gmake libtool pkgconfig tar:bzip2

CONFIGURE_ARGS+=--disable-glibtest \
	--enable-gtk2 \
	--disable-gtk3

.include <bsd.port.mk>
