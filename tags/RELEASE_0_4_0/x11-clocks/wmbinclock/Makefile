# New ports collection makefile for:	wmBinClock
# Date created:			28 September 2006
# Whom:				wintellect@bsdnexus.com
#
# $MidnightBSD: mports/x11-clocks/wmbinclock/Makefile,v 1.4 2009/04/13 16:32:46 laffer1 Exp $
#

PORTNAME=	wmbinclock
PORTVERSION=	0.5
PORTREVISION=	2
CATEGORIES=	x11-clocks windowmaker
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A binary clock in a windowmaker applet
LICENSE=	gpl2

EXTRACT_SUFX=	.tar.bz2

PLIST_FILES=	bin/wmBinClock
USE_GMAKE=	yes
USE_XORG=	x11 xpm

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmBinClock ${PREFIX}/bin

.include <bsd.port.mk>
