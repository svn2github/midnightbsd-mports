# $MidnightBSD: mports/x11/libXp/Makefile,v 1.4 2012/03/03 01:52:53 laffer1 Exp $

PORTNAME=	libXp
PORTVERSION=	1.0.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X print library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	x11 xext xextproto xau printproto:both
USE_AUTOTOOLS=	libtool

MAN3=	XpCancelDoc.3 \
	XpCancelJob.3 \
	XpCancelPage.3 \
	XpCreateContext.3 \
	XpDestroyContext.3 \
	XpEndDoc.3 \
	XpEndJob.3 \
	XpEndPage.3 \
	XpFreePrinterList.3 \
	XpGetAttributes.3 \
	XpGetContext.3 \
	XpGetDocumentData.3 \
	XpGetImageResolution.3 \
	XpGetLocaleHinter.3 \
	XpGetOneAttribute.3 \
	XpGetPageDimensions.3 \
	XpGetPdmStartParams.3 \
	XpGetPrinterList.3 \
	XpGetScreenOfContext.3 \
	XpInputSelected.3 \
	XpPutDocumentData.3 \
	XpQueryExtension.3 \
	XpQueryScreens.3 \
	XpQueryVersion.3 \
	XpRehashPrinterList.3 \
	XpSelectInput.3 \
	XpSetAttributes.3 \
	XpSetContext.3 \
	XpSetImageResolution.3 \
	XpSetLocaleHinter.3 \
	XpStartDoc.3 \
	XpStartJob.3 \
	XpStartPage.3 \
	libXp.3

.include <bsd.port.mk>
