# $MidnightBSD: mports/graphics/gozer/Makefile,v 1.2 2007/03/25 03:32:53 ctriv Exp $

PORTNAME=	gozer
PORTVERSION=	0.7
PORTREVISION=   2
CATEGORIES=	graphics
MASTER_SITES=	http://linuxbrit.co.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Commandline text rendering utility - creates images from text
LICENSE=	mit

LIB_DEPENDS=	giblib.1:${PORTSDIR}/graphics/giblib

USE_XORG=	x11
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-porbld-freebsd6.1
CONFIGURE_ARGS=	--with-giblib-prefix=${LOCALBASE}
CONFIGURE_ENV=	CFLAGS="-I${LOCALBASE}/include"
MAN1=		gozer.1

.if defined(NOPORTDOCS)
MAKE_ENV=	NO_DOC=yes
.endif

.include <bsd.port.mk>
