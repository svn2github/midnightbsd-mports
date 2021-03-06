# $MidnightBSD$

PORTNAME=	x11vnc
PORTVERSION=	0.9.13
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	SF/libvncserver/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server for use with real X displays
LICENSE=	gpl2

LIB_DEPENDS=	jpeg:${PORTSDIR}/graphics/jpeg \
		dbus:${PORTSDIR}/devel/dbus \
		pthread-stubs:${PORTSDIR}/devel/libpthread-stubs

USE_XORG=	x11 xcb xdamage xfixes xrandr xinerama xext xtst xau xrender \
		xdmcp recordproto

# Sets LDFLAGS and adds to CONFIGURE_ENV, therefore we set LDFLAGS
LDFLAGS+=	-L${LOCALBASE}/lib
USE_OPENSSL=	yes
USES=		iconv
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include

MAN1=		x11vnc.1
PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README README.LibVNCServer TODO

OPTIONS_DEFINE=NLS AVAHI
OPTIONS_DEFAULT=NLS AVAHI
NO_OPTIONS_SORT=yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
.endif

.if ${PORT_OPTIONS:MAVAHI}
LIB_DEPENDS+=	avahi-common:${PORTSDIR}/net/avahi-app
.else
CONFIGURE_ARGS+=	--without-avahi
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|include_HEADERS = |noinst_HEADERS = |' \
		-e 's|am__include_HEADERS_DIST|am__noinst_HEADERS_DIST|' \
		-e 's|/include/rfb|/include|' ${WRKSRC}/Makefile.in

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
