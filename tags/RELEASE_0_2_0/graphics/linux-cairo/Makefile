# New ports collection makefile for:	linux-cairo
# Date created:		4 November 2007
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-cairo/Makefile,v 1.3 2008/04/19 17:50:24 miwi Exp $
#

PORTNAME=	cairo
PORTVERSION=	1.0.2
DISTVERSIONSUFFIX=	-2.gst.1.4
CATEGORIES=	graphics linux
MASTER_SITES=	http://gstreamer.freedesktop.org/pkg/%SUBDIR%/ CENKES/myports
MASTER_SITE_SUBDIR=	${LINUX_DIST}/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/RPMS.deps
MASTER_SITE_SRC_SUBDIR=	${LINUX_DIST}/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/SRPMS.deps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux cairo binary
LICENSE=	gpl2

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libfontconfig.so.1.0.4:${PORTSDIR}/x11-fonts/linux-fontconfig \
		${LINUXBASE}/usr/lib/libpng.so.3.1.2.8:${PORTSDIR}/graphics/linux-png

ONLY_FOR_ARCHS=	i386 amd64
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
USE_XLIB=	yes
PLIST_SUB=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
