# New ports collection makefile for:	gstreamer
# Date created:		Tue Jul 9 20:24:02 UTC 2002
# Whom:			Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
#
# $MidnightBSD: mports/multimedia/gstreamer/Makefile,v 1.3 2007/11/12 01:57:09 laffer1 Exp $
# $FreeBSD: ports/multimedia/gstreamer/Makefile,v 1.57 2007/03/08 12:32:45 ahze Exp $
#    $MCom: ports/multimedia/gstreamer/Makefile,v 1.52 2006/09/14 20:51:42 ahze Exp $
#

PORTNAME=	gstreamer
PORTVERSION=	0.10.14
PORTREVISOIN=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gstreamer/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	ahze

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Development framework for creating media applications
LICENSE=	lgpl

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

CFLAGS:=	${CFLAGS} -O2
USE_XLIB=	yes
USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
WANT_GNOME=	yes
USE_GNOME=	gnomehack glib20 libxml2 ltverhack
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ARGS=	--disable-tests \
		--disable-examples \
		--disable-docs-build \
		--disable-failing-tests \
		--disable-gtk-doc \
		--mandir=${PREFIX}/man
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib" \
		ac_cv_func_register_printf_function="no"
PLIST_SUB=	VERSION="${GST_VERSION}"
USE_LDCONFIG=	yes
GST_VERSION=	0.10

MAN1=	gst-feedback-${GST_VERSION}.1 gst-inspect-${GST_VERSION}.1 \
	gst-launch-${GST_VERSION}.1 \
	gst-typefind-${GST_VERSION}.1 gst-xmlinspect-${GST_VERSION}.1 \
	gst-xmllaunch-${GST_VERSION}.1

.include <bsd.port.mk>
