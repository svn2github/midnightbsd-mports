# New ports collection makefile for:	popt
# Date Created:				29 Dec 1999
# Whom:					Yuan-Chen Cheng <ycheng@sinica.edu.tw>
#
# $MidnightBSD: mports/devel/popt/Makefile,v 1.2 2006/09/25 16:34:10 archite Exp $
# $FreeBSD: ports/devel/popt/Makefile,v 1.35 2006/08/14 22:55:15 clsung Exp $
#

PORTNAME=	popt
PORTVERSION=	1.7
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.rpm.org/pub/rpm/dist/%SUBDIR%/ \
		http://rpmfind.net/linux/rpm.org/rpm/dist/%SUBDIR%/ \
		ftp://ftp.mirrorservice.org/sites/ftp.rpm.org/pub/rpm/dist/%SUBDIR%/ \
		http://gd.tuwien.ac.at/utils/rpm.org/dist/%SUBDIR%/ \
		ftp://sunsite.cnlab-switch.ch/mirror/rpm/dist/%SUBDIR%/ \
		ftp://ftp.sunfreeware.com/pub/freeware/SOURCES/
MASTER_SITE_SUBDIR=	rpm-4.1.x

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A getopt(3) like library with a number of enhancements, from Redhat
LICENSE=	x11

BUILD_DEPENDS=	xgettext:${PORTSDIR}/devel/gettext

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

MAN3=		popt.3

CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--program-prefix=""

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

pre-configure:
	@if [ -n "`${PKG_INFO} -I 'gettext-0.1[012].*' 2>/dev/null`" ]; then \
		${ECHO_CMD} "${PKGNAME}: requires at least gettext 0.13, please upgrade your installed version."; \
		${FALSE}; \
	fi

.include <bsd.port.mk>
