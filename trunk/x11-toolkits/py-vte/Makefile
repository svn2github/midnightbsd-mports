# $MidnightBSD$

PORTREVISION=	3
CATEGORIES=	x11-toolkits gnome python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface for VTE (Terminal widget)
LICENSE=	lgpl

MASTERDIR=	${.CURDIR}/../vte
BUILD_WRKSRC=	${WRKSRC}/python
INSTALL_WRKSRC=	${BUILD_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

USE_GNOME=	gnomehack  vte pygtk2
USE_PYTHON=	yes
CONFIGURE_ARGS=	--enable-python \
		--disable-freetypetest \
		--disable-Bsymbolic

.include "${MASTERDIR}/Makefile"
