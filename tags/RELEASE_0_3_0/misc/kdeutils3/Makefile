# $FreeBSD: ports/misc/kdeutils3/Makefile,v 1.107 2006/09/12 23:26:33 lofi Exp $
# $MidnightBSD: mports/misc/kdeutils3/Makefile,v 1.7 2011/01/06 00:47:32 laffer1 Exp $

PORTNAME=	kdeutils
PORTVERSION=	${KDE_VERSION}
PORTREVISION=	3
CATEGORIES?=	misc kde
MASTER_SITES=		${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Utilities for the KDE integrated X11 desktop
LICENSE=	gpl2

LIB_DEPENDS=	gmp.10:${PORTSDIR}/math/gmp \
		netsnmp.20:${PORTSDIR}/net-mgmt/net-snmp
RUN_DEPENDS=	gpg:${PORTSDIR}/security/gnupg \
		gtar:${PORTSDIR}/archivers/gtar

CONFLICTS=	kgpg-[0-9]* superkaramba-[0-9]*

USE_KDELIBS_VER=3
USE_KDEBASE_VER=3
PREFIX=		${KDE_PREFIX}

USE_PYTHON=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
DO_NOT_COMPILE+=klaptopdaemon kmilo superkaramba
CONFIGURE_ENV+=	DO_NOT_COMPILE="${DO_NOT_COMPILE}"
CONFIGURE_ARGS+=--with-pythondir=${LOCALBASE}
MAKE_ENV+=__FreeBSD_version=700004 Q_OS_FREEBSD=1
USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib %%PREFIX%%/lib/kde3

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

post-patch:
	${REINPLACE_CMD} -e 's|>tar<|>gtar<|g' ${WRKSRC}/ark/ark.kcfg
	${REINPLACE_CMD} -e 's|%%PYTHON_VER%%|${PYTHON_VER}|g' \
		-e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		-e 's|%%LTMAIN%%|${LTMAIN}|g' \
		-e 's|%%LIBTOOL%%|${LIBTOOL}|g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
