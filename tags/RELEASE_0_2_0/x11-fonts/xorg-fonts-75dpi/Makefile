# New ports collection makefile for:    xorg-fonts-75dpi
# Date created:		30 May 2004
# Whom:			anholt@FreeBSD.org
#
# $FreeBSD: ports/x11-fonts/xorg-fonts-75dpi/Makefile,v 1.11 2007/09/13 19:44:52 flz Exp $
# $MidnightBSD: mports/x11-fonts/xorg-fonts-75dpi/Makefile,v 1.3 2007/10/10 01:16:03 ctriv Exp $
#

PORTNAME=	xorg-fonts-75dpi
PORTVERSION=	7.3
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org 75dpi bitmap fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/75dpi/courB08.pcf.gz:${PORTSDIR}/x11-fonts/font-adobe-75dpi \
		${FONTDIR}/75dpi/UTBI__10.pcf.gz:${PORTSDIR}/x11-fonts/font-adobe-utopia-75dpi \
		${FONTDIR}/75dpi/luBIS08.pcf.gz:${PORTSDIR}/x11-fonts/font-bh-75dpi \
		${FONTDIR}/75dpi/lutBS08.pcf.gz:${PORTSDIR}/x11-fonts/font-bh-lucidatypewriter-75dpi \
		${FONTDIR}/75dpi/charB08.pcf.gz:${PORTSDIR}/x11-fonts/font-bitstream-75dpi \
		${FONTDIR}/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings

CONFLICTS=	XFree86-font75dpi-*

NO_BUILD=	# none
FONTDIR=	${X11BASE}/lib/X11/fonts

do-install:	# empty

.include <bsd.port.mk>
