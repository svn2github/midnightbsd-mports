#
# $MidnightBSD: ports/deskutils/kdeplasma-addons/Makefile,v 1.2 2008/09/03 13:06:08 miwi Exp $
#

PORTNAME=	kdeplasma-addons
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	deskutils kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extra plasmoids for KDE4
LICENSE=	gpl2

USE_KDE4=	kdelibs pimlibs workspace kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	opengl webkit xml network moc rcc uic

post-extract:
	@${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
