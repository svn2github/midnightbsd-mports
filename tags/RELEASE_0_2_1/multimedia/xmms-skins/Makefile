# New ports collection makefile for:  xmms-skins
# Date created:                19 Aug 2004
# Whom:                        Filippo Natali <filippo@widestore.net>
#
# $MidnightBSD: mports/multimedia/xmms-skins/Makefile,v 1.2 2007/03/25 01:23:35 ctriv Exp $
# $FreeBSD: ports/multimedia/xmms-skins/Makefile,v 1.3 2006/03/07 08:27:01 ade Exp $
#

PORTNAME=	xmms-skins
PORTVERSION=	0.1
PORTREVISION=	3
CATEGORIES=	multimedia
MASTER_SITES=	http://www.xmms.org/files/Skins/
DISTFILES=	AbsoluteE_Xmms.zip \
		Absolute_Blue-XMMS.zip \
		AdamAmp.zip \
		Apple_Platinum_Amp.zip \
		Aqua.zip \
		BlackXMMS.zip \
		BlueIce.zip \
		BlueSteel.zip \
		BlueSteel_xmms.zip \
		BrushedMetal_Xmms.zip \
		CX2.zip \
		Cobalt-Obscura.tar.gz \
		ColderXMMS.tar.gz \
		ConceptX-Gold.zip \
		Concept_X.zip \
		Coolblue.tar.gz \
		Covenant.zip \
		Cyrus-XMMS.zip \
		Eclipse.tar.gz \
		FB_1.2.zip \
		FB_2.1.zip \
		FreeBSD.zip \
		Freshmeat_Amp.zip \
		GTK+.zip \
		Ghost-10.zip \
		HeliXMMS.zip \
		Inverse.zip \
		LinuxDotCom.tar.gz \
		Marble.zip \
		MarbleX.tar.gz \
		NeXTAmp2-1.0pre1.zip \
		NeXTAmp2.4.zip \
		NoerdAmp-SE.tar.gz \
		OmniAMP-1.3.zip \
		Panic.zip \
		Plume-XMMS-v1.zip \
		SuedE.zip \
		Ultrafina-pw.zip \
		Ultrafina.zip \
		Ultrafina2000.zip \
		UltrafinaSE.zip \
		UltrafinaSEM.zip \
		Vegetal_Blues.zip \
		Vegetali_1-1.zip \
		Vulcan.zip \
		Vulcan21.zip \
		Winamp_X_XMMS_1.01.tar.gz \
		WoodPanel.zip \
		X-Tra.zip \
		XMMS-AfterStep.zip \
		XMMS-Green.zip \
		XawMMS.zip \
		arctic_Xmms.zip \
		blackstar.zip \
		blueHeart-xmms-20.zip \
		blueHeart_Xmms.zip \
		bmXmms.zip \
		cart0onix.zip \
		chaos_XMMS.zip \
		cherry.zip \
		cherry_best.tar.gz \
		cracked.zip \
		detone_blue.zip \
		detone_green.zip \
		eMac-XMMS.zip \
		eMac_Xmms_color_schemes.zip \
		fiRe.tar.gz \
		fyre.zip \
		gLaNDAmp-2.0.zip \
		m2n.tar.gz \
		maXMMS.tar.gz \
		minEguE-xmms-v2.zip \
		myway.zip \
		nixamp2.tar.gz \
		nuance-2.0.zip \
		nuance-green-2.0.zip \
		sinistar.zip \
		spiffMEDIA.zip \
		sword.tar.gz \
		titanium.zip \
		xmmearth.tar.gz \
		xmms-256.zip
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Skins for X Multimedia System (XMMS)
LICENSE=	unknown

BUILD_DEPENDS+=	xmms-config:${PORTSDIR}/multimedia/xmms

NO_BUILD=	yes
NO_WRKSUBDIR=	yes

do-install:
	${MKDIR} ${PREFIX}/share/xmms/Skins
	@for skin in ${DISTFILES}; do \
		${CP} ${DISTDIR}/$$skin ${PREFIX}/share/xmms/Skins; \
	done

.include <bsd.port.mk>
