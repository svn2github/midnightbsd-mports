# New ports collection makefile for:	xfwm4-themes
# Date created:		7 June 2003
# Whom:			James Earl <jdearl@telus.net>
#
# $MidnightBSD: mports/misc/xfce4-wm-themes/Makefile,v 1.1 2008/09/26 18:12:08 laffer1 Exp $
# $FreeBSD: ports/misc/xfce4-wm-themes/Makefile,v 1.23 2008/02/12 18:10:58 oliver Exp $
#

PORTNAME=	xfce4-wm-themes
PORTVERSION=	${XFCE_VERSION}
CATEGORIES=	misc xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfwm4-themes-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 window decoration themes for xfwm4
LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GNOME=	gnometarget
USE_XFCE=	configenv	# to get MASTER_SITE_SUBDIR something has to be defined

.include <bsd.port.mk>
