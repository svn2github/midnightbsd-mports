# New ports collection makefile for:	kdeedu3
# Date created:				2 November 2001
# Whom:					will@cvs.kde.org
#
# $FreeBSD: ports/misc/kdeedu3/Makefile,v 1.34 2006/09/12 23:26:32 lofi Exp $
# $MidnightBSD$
#

PORTNAME=	kdeedu
PORTVERSION=	${KDE_VERSION}
CATEGORIES?=	misc kde
MASTER_SITES=		${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Collection of entertaining, educational programs for KDE

LIB_DEPENDS=	usb-0.1:${PORTSDIR}/devel/libusb

CONFLICTS+=	kwordquiz-[0-9]* kgeography-[0-9]*

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_XPM=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=  libtool:15

CONFIGURE_ARGS+=--enable-libusb=${LOCALBASE}

INSTALLS_SHLIB=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib %%PREFIX%%/lib/kde3

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

.if ${OSVERSION} > 500035
LIB_DEPENDS+=	boost_python:${PORTSDIR}/devel/boost-python
PLIST_SUB+=	BOOST_PYTHON=""
.else
CONFIGURE_ARGS+=--disable-kig-python-scripting
PLIST_SUB+=	BOOST_PYTHON="@comment "
.endif

pre-configure:
	${REINPLACE_CMD} \
	-e 's|pylibdir in.*|pylibdir in "${LOCALBASE}/lib" \\|g' \
	${WRKSRC}/configure

.include <bsd.port.post.mk>
