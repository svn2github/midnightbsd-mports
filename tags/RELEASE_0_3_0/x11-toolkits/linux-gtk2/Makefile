# New ports collection makefile for:	linux-gtk2
# Date created:				2003-11-19
# Whom:					trevor
#
# $MidnightBSD: mports/x11-toolkits/linux-gtk2/Makefile,v 1.4 2007/10/17 13:52:09 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/linux-gtk2/Makefile,v 1.22 2006/07/09 21:01:45 bsam Exp $
#

PORTNAME=	gtk2
PORTVERSION=	2.6.10
CATEGORIES=	x11-toolkits linux
DISTFILES=	${PORTNAME}-${PORTVERSION}-2.fc4.4.${LINUX_RPM_ARCH}.rpm \
		${PORTNAME}-engines-2.6.3-2.${LINUX_RPM_ARCH}.rpm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK+ library, version 2.X, Linux binary
LICENSE=	lgpl

# these libraries are required by gtk-query-immodules-2.0 or
# gdk-pixbuf-query-loaders
RUN_DEPENDS+=	${LINUXBASE}/usr/lib/libglib-2.0.so.0:${PORTSDIR}/devel/linux-glib2 \
		${LINUXBASE}/usr/lib/libatk-1.0.so.0:${PORTSDIR}/accessibility/linux-atk \
		${LINUXBASE}/usr/lib/libjpeg.so.62:${PORTSDIR}/graphics/linux-jpeg \
		${LINUXBASE}/usr/lib/libpng12.so.0:${PORTSDIR}/graphics/linux-png \
		${LINUXBASE}/usr/lib/libtiff.so.3:${PORTSDIR}/graphics/linux-tiff \
		${LINUXBASE}/usr/lib/libpango-1.0.so.0:${PORTSDIR}/x11-toolkits/linux-pango

ONLY_FOR_ARCHS=	i386 amd64
USE_XLIB=	yes
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST_SUB=	LIBVERSION="600.10" PORTVERSION="${PORTVERSION}"
SRC_DISTFILES=	${PORTNAME}-${PORTVERSION}-2.fc4.4.src.rpm \
		${PORTNAME}-engines-2.6.3-2.src.rpm


.include <bsd.port.mk>
