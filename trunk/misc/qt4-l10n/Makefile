# $MidnightBSD$
# $FreeBSD: ports/misc/qt4-l10n/Makefile,v 1.7 2010/12/02 19:47:12 makc Exp $

PORTNAME=	l10n
DISTVERSION=	${QT4_VERSION}
CATEGORIES=	misc
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt translations messages
LICENSE=	gpl3

USE_QT4=	linguist_build
QT_DIST=	yes

EXTRACT_AFTER_ARGS+=	--include '${DISTNAME}/src/corelib' \
			'${DISTNAME}/translations'

EXTRA_PATCHES=	# empty

do-build:
	${QT_BINDIR}/lrelease${_QT_BINSUFX} ${WRKSRC}/translations/*.ts

do-install:
	${MKDIR} ${PREFIX}/${QT_L10NDIR_REL}
	${INSTALL_DATA} ${WRKSRC}/translations/*.qm ${PREFIX}/${QT_L10NDIR_REL}

.include <bsd.port.mk>
