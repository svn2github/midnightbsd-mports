# $MidnightBSD: mports/x11-drivers/xf86-video-radeonhd/Makefile,v 1.7 2009/08/30 05:37:47 laffer1 Exp $

PORTNAME=	xf86-video-radeonhd
PORTVERSION=	1.3.0
PORTREVISION=	0
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org ati RadeonHD display driver
LICENSE=	x11

OPTIONS=	UTILS "Install rhd_conntest and rhd_dump utilities" off

XORG_CAT=	driver
USE_XORG=	damageproto glproto videoproto xextproto xf86driproto
CONFIGURE_ARGS=	--enable-exa

MAN4=	radeonhd.4x

.include <bsd.port.pre.mk>

.if defined(WITH_UTILS)
LIB_DEPENDS+=	pci.2:${PORTSDIR}/devel/libpci
PLIST_SUB=	UTILS=""
CONFIGURE_ENV+=	PCIUTILS_CFLAGS="-I${LOCALBASE}/include -lpci -lz" \
		PCIUTILS_LIBS="-L${LOCALBASE}/lib"
.else
PLIST_SUB=	UTILS="@comment "
.endif

.if defined(WITH_UTILS)
post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/utils/conntest/rhd_conntest ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/utils/conntest/rhd_dump ${PREFIX}/sbin
.endif

.include <bsd.port.post.mk>
