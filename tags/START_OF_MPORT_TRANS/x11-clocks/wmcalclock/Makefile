# New ports collection makefile for:   wmCalClock
# Date created:        16 March 1999
# Whom:                Kris Kennaway <kris@FreeBSD.org>
#
# $MidnightBSD: mports/x11-clocks/wmcalclock/Makefile,v 1.1 2006/10/03 19:36:09 wintellect Exp $
# $FreeBSD: ports/x11-clocks/wmcalclock/Makefile,v 1.15 2005/07/09 02:32:00 kris Exp $
#

PORTNAME=	wmCalClock
PORTVERSION=	1.25
PORTREVISION=	2
CATEGORIES=	x11-clocks windowmaker
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=kris

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another Window Maker calendar/clock dockapp

WRKSRC=		${WRKDIR}/${DISTNAME}/Src

USE_XLIB=	yes
USE_XPM=	yes
ALL_TARGET=	clean all

MAN1=		wmCalClock.1
PLIST_FILES=	bin/wmCalClock

.include <bsd.port.mk>
