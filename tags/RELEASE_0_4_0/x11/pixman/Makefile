# $MidnightBSD: mports/x11/pixman/Makefile,v 1.12 2012/02/29 03:12:07 laffer1 Exp $

PORTNAME=	pixman
PORTVERSION=	0.28.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
LICENSE=	x11

XORG_CAT=	lib
USE_AUTOTOOLS=	libtool
USE_PERL5_BUILD=yes
USE_GNOME=	ltverhack:9
CONFIGURE_ARGS=	--disable-gtk

OPTIONS_DEFINE=	SIMD

.include <bsd.mport.options.mk>

.if ! {PORT_OPTIONS:MSIMD}
CONFIGURE_ARGS=	--disable-vmx --disable-arm-simd
. if ! ${MACHINE_CPU:Mmmx}
CONFIGURE_ARGS+=	--disable-mmx
. endif
. if ! ${MACHINE_CPU:Msse2}
CONFIGURE_ARGS+=	--disable-sse2
. endif
.endif

.include <bsd.port.mk>
