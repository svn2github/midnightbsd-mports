# New ports collection makefile for:	linux-xorg-libs
# Date created:				$Date: 2007-10-17 14:01:14 $
# Whom:					bsam@ipt.ru
#
# $MidnightBSD: mports/x11/linux-xorg-libs/Makefile,v 1.1 2006/09/23 21:55:27 laffer1 Exp $
# $FreeBSD: ports/x11/linux-xorg-libs/Makefile,v 1.6 2006/06/28 19:25:49 netchild Exp $
#

PORTNAME=		xorg-libs
PORTVERSION=		6.8.2
PORTREVISION=		5
CATEGORIES=		x11 linux
DISTFILES=		xorg-x11-libs-${PORTVERSION}-37.FC4.49.2.1.${LINUX_RPM_ARCH}.rpm \
			xorg-x11-deprecated-libs-6.8.2-31.${LINUX_RPM_ARCH}.rpm

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Xorg libraries, linux binaries

RUN_DEPENDS=		${LINUXBASE}/usr/lib/libfontconfig.so.1:${PORTSDIR}/x11-fonts/linux-fontconfig

CONFLICTS=		linux-XFree86-libs

USE_GCPIO=		yes
USE_LINUX_RPM=		yes
LINUX_DIST_VER=		4
INSTALLS_SHLIB=		yes

SRC_DISTFILES=		xorg-x11-6.8.2-37.FC4.49.2.1.src.rpm

.include <bsd.port.mk>
