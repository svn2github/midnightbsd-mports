# New ports collection makefile for:	py-gnome
# Date created:				09 February 2003
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/py-gnome2/Makefile,v 1.1 2007/12/28 04:49:38 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/py-gnome2/Makefile,v 1.93 2007/05/19 20:31:46 flz Exp $
#   $MCom: ports/x11-toolkits/py-gnome2/Makefile,v 1.41 2007/03/12 19:06:44 mezz Exp $
#

PORTNAME=	gnome
PORTVERSION=	2.22.0
PORTREVISION=	1
CATEGORIES=	x11-toolkits python gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/gnome-python/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	gnome-python-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of Python bindings for GNOME 2
LICENSE=        lgpl

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/ORBit.so:${PORTSDIR}/devel/py-orbit
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/ORBit.so:${PORTSDIR}/devel/py-orbit

LATEST_LINK=	py-gnome2
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PYTHON=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack libgnomeui pygtk2
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

EG_SRC_DIR=	${WRKSRC}/examples
EG_DST_DIR=	${PREFIX}/share/examples/py-gnome

CONFLICTS=	py*-gnome-1*

.include <bsd.port.pre.mk>

.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${EG_DST_DIR}
	${TAR} -C ${EG_SRC_DIR} -cf - . | ${TAR} -C ${EG_DST_DIR} -xf -
	${CHOWN} -R ${BINOWN}:${BINGRP} ${EG_DST_DIR}
	${FIND} ${EG_DST_DIR} -type d -print | ${XARGS} ${CHMOD} 0555
	${FIND} ${EG_DST_DIR} -type f -print | ${XARGS} ${CHMOD} 0444
.endif

.include <bsd.port.post.mk>
