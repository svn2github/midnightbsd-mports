# $MidnightBSD$
# $FreeBSD: ports/devel/qt4-assistant-adp/Makefile,v 1.8 2010/12/02 19:47:07 makc Exp $

PORTNAME=	assistant
PORTVERSION=	4.6.3
PORTREVISION=	1
CATEGORIES?=	devel
MASTER_SITES=	${MASTER_SITE_QT}
MASTER_SITE_SUBDIR=	archive/qt/${PORTVERSION:R}
PKGNAMEPREFIX=	qt4-
PKGNAMESUFFIX=	-adp
DISTNAME=	qt-assistant-qassistantclient-library-compat-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt documentation browser, adp compat version

USE_QT4=	qmake_build moc_build rcc_build uic_build corelib \
		gui network xml doc dbus

ALL_TARGET=	first

WRKSRC=		${WRKDIR}/${DISTNAME:C/src/version/}

PLIST_FILES=	bin/assistant_adp

pre-configure:
	${REINPLACE_CMD} -e 's|$$$$\[QT_INSTALL_BINS]|${PREFIX}/bin|g' \
		${WRKSRC}/compat.pro

do-configure:
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
		${QMAKE} -spec ${QMAKESPEC} QT_CONFIG+="dbus" \
		QT_PRODUCT="OpenSource" ${QMAKEFLAGS}

.include <bsd.port.mk>
