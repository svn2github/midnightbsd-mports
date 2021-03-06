# New ports collection makefile for:	Bitstream Vera Font Family
# Date created:		February 18 2003
# Whom:			Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD: ports/x11-fonts/bitstream-vera/Makefile,v 1.16 2007/05/19 20:29:08 flz Exp $
# $MidnightBSD$
#   $MCom: ports/x11-fonts/bitstream-vera/Makefile,v 1.2 2005/10/14 20:39:59 adamw Exp $
#

PORTNAME=	bitstream-vera
PORTVERSION=	1.10
PORTREVISION=	3
CATEGORIES=	x11-fonts
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/ttf-${PORTNAME}/1.10
DISTNAME=	ttf-${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bitstream Vera TrueType font collection
LICENSE=	unknown

BUILD_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig
RUN_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig

USE_BZIP2=	yes
PREFIX?=	${X11BASE}
NO_BUILD=	yes

PLIST_SUB=	FONTSDIR="${FONTSDIR:S|${PREFIX}/||}"

MSG_FILE=	${PKGDIR}/pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

#
# Local variables
#

FONTNAME=	${PORTNAME}
FONTSDIR?=	${PREFIX}/lib/X11/fonts/${FONTNAME}

.include <bsd.port.pre.mk>

.SILENT:

post-patch:
	${SED} 's|%%FONTSDIR%%|${FONTSDIR}|g' ${MSG_FILE} > ${PKGMESSAGE}

#
# Install
#

do-install: install-fonts install-docs

install-fonts:
	${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${FONTSDIR}
	${INSTALL_DATA} ${FILESDIR}/fonts.dir ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/COPYRIGHT.TXT ${FONTSDIR}

install-docs:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.TXT ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/RELEASENOTES.TXT ${DOCSDIR}
.endif


.include <bsd.port.post.mk>
