# New ports collection makefile for:    xorg-fonts-cyrillic
# Date created:		30 May 2004
# Whom:			anholt@FreeBSD.org
#
# $MidnightBSD: mports/x11-fonts/xorg-fonts-cyrillic/Makefile,v 1.5 2008/08/20 19:07:49 laffer1 Exp $
# $FreeBSD: ports/x11-fonts/xorg-fonts-cyrillic/Makefile,v 1.11 2007/09/13 19:44:52 flz Exp $
#

PORTNAME=	xorg-fonts-cyrillic
PORTVERSION=	7.3
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org Cyrillic bitmap fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/cyrillic/crox1c.pcf.gz:${PORTSDIR}/x11-fonts/font-cronyx-cyrillic \
		${FONTDIR}/cyrillic/koi12x24.pcf.gz:${PORTSDIR}/x11-fonts/font-misc-cyrillic \
		${FONTDIR}/cyrillic/screen8x16.pcf.gz:${PORTSDIR}/x11-fonts/font-screen-cyrillic \
		${FONTDIR}/cyrillic/proof9x16.pcf.gz:${PORTSDIR}/x11-fonts/font-winitzki-cyrillic \
		${FONTDIR}/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings

CONFLICTS=	XFree86-fontCyrillic-*

NO_BUILD=	# none
FONTDIR=	${X11BASE}/lib/X11/fonts

do-install:	# empty

.include <bsd.port.mk>
