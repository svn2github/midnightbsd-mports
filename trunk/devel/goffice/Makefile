# $MidnightBSD$

PORTNAME=	goffice
PORTVERSION=	0.8.17
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib/GTK+ set of document centric objects and utilities

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	pcre:${PORTSDIR}/devel/pcre

USE_GNOME=	gnomeprefix intlhack gtk20 libgsf ltverhack
USES=		gettext gmake pathfix pkgconfig tar:xz
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
PLIST_SUB=	VERSION=${PORTVERSION} \
		SHORT_VER=0.8

OPTIONS_DEFINE=	GCONF
OPTIONS_DEFAULT=GCONF

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGCONF}
USE_GNOME+=	gconf2
.else
CONFIGURE_ARGS+=--with-config-backend=keyfile
.endif

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libgoffice-0.8.so.8
	@${STRIP_CMD} ${PREFIX}/lib/goffice/*/plugins/*/*.so

.include <bsd.port.mk>
