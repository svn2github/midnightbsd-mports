# New ports collection makefile for:	skippy-xd
# Date created:		2004-05-19
# Whom:			michael johnson <ahze@ahze.net>
#
# $MidnightBSD: mports/x11-wm/skippy-xd/Makefile,v 1.3 2008/04/14 18:45:20 laffer1 Exp $
# $FreeBSD: ports/x11-wm/skippy-xd/Makefile,v 1.3 2006/05/13 05:00:43 edwin Exp $
#

PORTNAME=	skippy-xd
PORTVERSION=	0.5.0
PORTREVISION=	3
CATEGORIES=	x11-wm
MASTER_SITES=	http://thegraveyard.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-screen X11 task-switcher like Apple's Expose
LICENSE=	gpl2

LIB_DEPENDS=	Xft.2:${PORTSDIR}/x11-fonts/libXft
BUILD_DEPENDS=	freetype-config:${PORTSDIR}/print/freetype2

USE_BZIP2=	yes
USE_XORG=	x11 xft xcomposite xdamage xfixes xrender xinerama xext xmu
USE_GNOME=	pkgconfig
PLIST_FILES=	bin/skippy-xd \
		%%DATADIR%%/skippy-xd.rc-default
PLIST_DIRS=	%%DATADIR%%
PKGMESSAGE=	${WRKDIR}/pkg-message

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/X11R6|${LOCALBASE}|; \
		s|/usr/local|${LOCALBASE}|; s|gcc|${CC}|' \
			${WRKSRC}/Makefile
post-build:
	@${SED} 's|%%DATADIR%%|${DATADIR}|' ${PKGDIR}/pkg-message >${PKGMESSAGE}

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/skippy-xd ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	@${INSTALL_DATA} ${WRKSRC}/skippy-xd.rc-default ${DATADIR}

.include <bsd.port.mk>
