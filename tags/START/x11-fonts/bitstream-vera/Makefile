# New ports collection makefile for:	Bitstream Vera Font Family
# Date created:		February 18 2003
# Whom:			Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-fonts/bitstream-vera/Makefile,v 1.13 2006/06/12 04:58:42 mezz Exp $
#   $MCom: ports/x11-fonts/bitstream-vera/Makefile,v 1.2 2005/10/14 20:39:59 adamw Exp $
#

PORTNAME=	bitstream-vera
PORTVERSION=	1.10
PORTREVISION=	2
CATEGORIES=	x11-fonts
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/ttf-${PORTNAME}/1.10
DISTNAME=	ttf-${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Bitstream Vera TrueType font collection

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

.if ${X_WINDOW_SYSTEM:L} == xfree86-3
MTREE_FILE=	/etc/mtree/BSD.x11.dist
.else
MTREE_FILE=	/etc/mtree/BSD.x11-4.dist
.endif

.SILENT:

post-patch:
	${SED} 's|%%FONTSDIR%%|${FONTSDIR}|g' ${MSG_FILE} > ${PKGMESSAGE}

#
# Install
#

do-install: install-fonts install-conf install-docs

install-fonts:
	${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${FONTSDIR}
	${INSTALL_DATA} ${FILESDIR}/fonts.dir ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/COPYRIGHT.TXT ${FONTSDIR}

install-conf:
	${MKDIR} ${PREFIX}/etc/fonts/conf.d
	${INSTALL_DATA} ${WRKSRC}/local.conf \
		${PREFIX}/etc/fonts/conf.d/0.vera.conf

install-docs:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.TXT ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/RELEASENOTES.TXT ${DOCSDIR}
.endif

post-install:
	${ECHO_MSG} "===> Running fc-cache"
	-${X11BASE}/bin/fc-cache -f -v ${FONTSDIR}
	${ECHO_MSG}
	${CAT} ${PKGMESSAGE}
	${ECHO_MSG}

.include <bsd.port.post.mk>
