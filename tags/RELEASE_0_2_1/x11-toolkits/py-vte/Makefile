# New ports collection makefile for:	py-vte
# Date created:				18 February 2007
# Whom:					Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/py-vte/Makefile,v 1.2 2007/05/19 20:31:51 flz Exp $
#   $MCom: ports/x11-toolkits/py-vte/Makefile,v 1.1 2007/02/18 19:12:57 mezz Exp $
#

PORTREVISION=	1
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

USE_GNOME=	gnomehack gnometarget vte pygtk2
USE_PYTHON=	yes
CONFIGURE_ARGS=	--enable-python \
		--disable-freetypetest

.include "${MASTERDIR}/Makefile"
