# New ports collection makefile for:   hal-info
# Date Created:			25 January 2008
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/hal-info/Makefile,v 1.3 2008/06/06 14:03:08 edwin Exp $
#   $MCom: ports/sysutils/hal-info/Makefile,v 1.3 2008/03/17 22:31:58 marcus Exp $
#

PORTNAME=	hal-info
PORTVERSION=	20080508
PORTREVISION=	0
CATEGORIES=	sysutils
MASTER_SITES=	http://hal.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional FDI files to further classify HAL devices
LICENSE=	gpl2

LIB_PC_DEPENDS=	hal.pc:${PORTSDIR}/sysutils/hal

BUILD_DEPENDS+=	${LIB_PC_DEPENDS:C|^|${LOCALBASE}/libdata/pkgconfig/|g}
RUN_DEPENDS+=	${LIB_PC_DEPENDS:C|^|${LOCALBASE}/libdata/pkgconfig/|g}

USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
