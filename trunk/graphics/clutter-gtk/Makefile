# $MidnightBSD$

PORTNAME=	clutter-gtk
PORTVERSION=	0.10.8
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	GNOME \
		http://source.clutter-project.org/sources/${PORTNAME}/${PORTVERSION:R}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK+ Integration library for Clutter
LICENSE=	lgpl

LIB_DEPENDS=	clutter-glx-1.0:${PORTSDIR}/graphics/clutter

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack gtk20 ltverhack gnomeprefix
USE_XORG=	xp x11
USE_LDCONFIG=	yes

CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

.include <bsd.port.mk>
