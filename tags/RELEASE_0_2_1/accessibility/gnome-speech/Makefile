# New ports collection makefile for:	gnomespeech
# Date created:			11 May 2003
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/accessibility/gnome-speech/Makefile,v 1.4 2008/06/08 21:01:33 crash Exp $
# $FreeBSD: ports/accessibility/gnome-speech/Makefile,v 1.32 2007/07/30 04:29:12 mezz Exp $
#   $MCom: ports/accessibility/gnome-speech/Makefile,v 1.21 2006/08/22 00:55:57 ahze Exp $
#

PORTNAME=	gnome-speech
PORTVERSION=	0.4.20
CATEGORIES=	accessibility audio gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME text-to-speech API
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack libbonobo
GNU_CONFIGURE=  yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/lib/libespeak.so)
WITH_ESPEAK=	yes
.endif

#.if exists(${LOCALBASE}/bin/festival)
#WITH_FESTIVAL=	yes
#.endif

.if defined(WITH_ESPEAK)
LIB_DEPENDS+=	espeak.1:${PORTSDIR}/audio/espeak
CONFIGURE_ARGS+=--with-espeak-dir=${LOCALBASE}
PLIST_SUB+=	ESPEAK:=""
.else
PLIST_SUB+=	ESPEAK:="@comment "
.endif

#.if defined(WITH_FESTIVAL)
#RUN_DEPENDS+=	festival:${PORTSDIR}/audio/festival
#.endif

post-patch:
	@${REINPLACE_CMD} -e 's|== x|= x|g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
