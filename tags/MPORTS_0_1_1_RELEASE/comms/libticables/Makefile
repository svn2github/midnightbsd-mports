# New ports collection makefile for:	libticables
# Date created:		27 August 2003
# Whom:			Tijl Coosemans <tijl@ulyssis.org>
#
# $MidnightBSD$
# $FreeBSD: ports/comms/libticables/Makefile,v 1.18 2006/10/06 02:44:32 clsung Exp $
#

PORTNAME=	libticables
PORTVERSION=	3.9.7
PORTREVISION=	1
CATEGORIES=	comms
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	tilp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TI calculator link cables library

LIB_DEPENDS=	usb-0.1.8:${PORTSDIR}/devel/libusb

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"
USE_GETTEXT=	yes
USE_GNOME=	gnomehack pkgconfig
USE_AUTOTOOLS=	libtool:15
USE_GMAKE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
