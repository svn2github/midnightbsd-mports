# $MidnightBSD$

PORTNAME=	smpeg
PORTVERSION=	0.4.4
PORTREVISION=	8
CATEGORIES=	multimedia
MASTER_SITES=	ftp://sunsite.auc.dk/pub/os/linux/loki/open-source/smpeg/ \
		${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=	distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A free MPEG1 video player library with sound support
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
WANT_GNOME=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_SDL=	sdl
USE_LDCONFIG=	yes
CONFIGURE_ENV=	GLBASE="${LOCALBASE}" \
		CC="${CXX}" REAL_CC="${CC}"
CPPFLAGS+=	-I${LOCALBASE}/include

#If you want to try the opengl player (which doesn't seem to work)
#comment out the following line.
CONFIGURE_ARGS=	--disable-opengl-player \
		--enable-mmx

MAN1=		gtv.1 plaympeg.1

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mgtk12}!=""
USE_GNOME+=	gtk12
PLIST_SUB+=	GNOME=""
.else
CONFIGURE_ARGS+=	--disable-gtk-player
PLIST_SUB+=	GNOME="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|$${CONFIG_SHELL-/bin/sh} $$ac_aux_dir|$$ac_aux_dir|' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
