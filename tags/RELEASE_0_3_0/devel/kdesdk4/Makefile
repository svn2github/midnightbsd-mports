#
# $MidnightBSD: ports/devel/kdesdk4/Makefile,v 1.68 2008/09/03 13:06:08 miwi Exp $
#

PORTNAME=	kdesdk
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	devel kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE Software Development Kit
LICENSE=	gpl2

RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash
LIB_DEPENDS=	svn_client-1.0:${PORTSDIR}/devel/subversion

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
KDE4_BUILDENV=	yes
USE_KDE4=	kdelibs pimlibs workspace kdeprefix kdehier \
		automoc4 akonadi
USE_QT_VER=	4
QT_COMPONENTS=	network gui moc rcc uic svg qt3support

MAN1=		cervisia.1

CMAKE_ARGS+=	-DBUILD_kapptemplate:BOOL=Off

post-extract:
	@${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
