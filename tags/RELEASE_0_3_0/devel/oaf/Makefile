# $MidnightBSD: mports/devel/oaf/Makefile,v 1.4 2009/09/20 00:50:16 laffer1 Exp $

PORTNAME=	oaf
PORTVERSION=	0.6.10
PORTREVISION=	8
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/oaf/0.6
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object Activation Framework for GNOME
LICENSE=	gpl2

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_AUTOTOOLS=	libtool:22
USE_BZIP2=	yes
USE_PERL5=	yes
USE_XORG=	x11
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomeprefix gtk12 orbit libxml
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS= --enable-static --enable-shared \
		--disable-more-warnings
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -lintl"
CONFIGURE_TARGET=	--target=${MACHINE_ARCH}-unknown-freebsd6.1

MAN1=	oafd.1

.include <bsd.port.mk>
