# New ports collection makefile for:    xorg-fonts-miscbitmaps
# Date created:		30 May 2004
# Whom:			anholt@FreeBSD.org
#
# $FreeBSD: ports/x11-fonts/xorg-fonts-miscbitmaps/Makefile,v 1.11 2007/09/13 19:44:52 flz Exp $
# $MidnightBSD: mports/x11-fonts/xorg-fonts-miscbitmaps/Makefile,v 1.3 2007/10/11 19:05:32 ctriv Exp $
#

PORTNAME=	xorg-fonts-miscbitmaps
PORTVERSION=	7.3
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org miscellaneous bitmap fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/misc/arabic24.pcf.gz:${PORTSDIR}/x11-fonts/font-arabic-misc \
		${FONTDIR}/misc/cursor.pcf.gz:${PORTSDIR}/x11-fonts/font-cursor-misc \
		${FONTDIR}/misc/hanglg16.pcf.gz:${PORTSDIR}/x11-fonts/font-daewoo-misc \
		${FONTDIR}/misc/deccurs.pcf.gz:${PORTSDIR}/x11-fonts/font-dec-misc \
		${FONTDIR}/misc/gb16fs.pcf.gz:${PORTSDIR}/x11-fonts/font-isas-misc \
		${FONTDIR}/misc/jiskan16.pcf.gz:${PORTSDIR}/x11-fonts/font-jis-misc \
		${FONTDIR}/misc/micro.pcf.gz:${PORTSDIR}/x11-fonts/font-micro-misc \
		${FONTDIR}/misc/10x20-ISO8859-1.pcf.gz:${PORTSDIR}/x11-fonts/font-misc-misc \
		${FONTDIR}/misc/cu-alt12.pcf.gz:${PORTSDIR}/x11-fonts/font-mutt-misc \
		${FONTDIR}/misc/clB6x10.pcf.gz:${PORTSDIR}/x11-fonts/font-schumacher-misc \
		${FONTDIR}/misc/12x24.pcf.gz:${PORTSDIR}/x11-fonts/font-sony-misc \
		${FONTDIR}/misc/olcursor.pcf.gz:${PORTSDIR}/x11-fonts/font-sun-misc \
		${FONTDIR}/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings

NO_BUILD=	# none
FONTDIR=	${X11BASE}/lib/X11/fonts

do-install:	# empty

.include <bsd.port.mk>
