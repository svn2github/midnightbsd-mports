# $MidnightBSD$

PORTNAME=	l10n
PORTVERSION=	${QT4_VERSION}
CATEGORIES?=	misc
MASTER_SITES=	${MASTER_SITE_QT}
PKGNAMEPREFIX=	qt4-
DISTNAME=	qt-x11-opensource-src-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt translations messages
LICENSE=	gpl2

USE_QT_VER=	4
QT_COMPONENTS=	#dummy
NO_BUILD=	yes

EXTRACT_AFTER_ARGS+=	| ${TAR} -xf - --include '${DISTNAME}/translations'

do-install:
	${MKDIR} ${PREFIX}/share/qt4/translations
	${INSTALL_DATA} ${WRKSRC}/translations/*.qm ${PREFIX}/share/qt4/translations

.include <bsd.port.mk>
