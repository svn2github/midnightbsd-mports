#
# $MidnightBSD: ports/security/qca-ossl/Makefile,v 1.1 2008/08/05 00:12:57 miwi Exp $

PORTNAME=	qca-ossl
DISTVERSION=	2.0.0-beta3
CATEGORIES=	security
MASTER_SITES=	http://delta.affinix.com/download/qca/2.0/plugins/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform crypto API for QT
LICENSE=	lgpl

LIB_DEPENDS=	qca.2:${PORTSDIR}/devel/qca

USE_BZIP2=	yes
USE_QT_VER=	4
USE_GNOME=	pkgconfig
HAS_CONFIGURE=	yes
QT_NONSTANDARD=	yes
QT_COMPONENTS=	corelib qmake_build moc_build
USE_OPENSSL=	yes

CONFIGURE_ENV=	QMAKESPEC=${LOCALBASE}/share/qt4/mkspecs/freebsd-g++ \
		PTHREAD_CFLAGS=${PTHREAD_CFLAGS} \
		PTHREAD_LDFLAGS=${PTHREAD_LIBS}
CONFIGURE_ARGS=	--plugins-path=${PREFIX}/${QT_PLUGINDIR} --qtdir=${LOCALBASE} \
		--with-qca=${LOCALBASE}

QT_PLUGINDIR=	lib/qt4/plugins

PLIST_SUB+=	QT_PLUGINDIR="${QT_PLUGINDIR}"

.include <bsd.port.mk>
