# New ports collection makefile for:	kdeutils3
# Date created:				3 November 2001
# Whom:					will@cvs.kde.org
#
# $FreeBSD: ports/misc/kdeutils3/Makefile,v 1.107 2006/09/12 23:26:33 lofi Exp $
# $MidnightBSD: mports/misc/kdeutils3/Makefile,v 1.1 2007/01/20 15:37:18 laffer1 Exp $
#

PORTNAME=	kdeutils
PORTVERSION=	${KDE_VERSION}
CATEGORIES?=	misc kde
MASTER_SITES=		${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Utilities for the KDE integrated X11 desktop

LIB_DEPENDS=	gmp.7:${PORTSDIR}/math/libgmp4 \
		netsnmp:${PORTSDIR}/net-mgmt/net-snmp
RUN_DEPENDS=	gpg:${PORTSDIR}/security/gnupg

CONFLICTS=	kgpg-[0-9]* superkaramba-[0-9]*

USE_KDELIBS_VER=3
USE_KDEBASE_VER=3
PREFIX=		${KDE_PREFIX}

USE_PYTHON=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GETOPT_LONG=yes
USE_AUTOTOOLS=  libtool:15
DO_NOT_COMPILE+=klaptopdaemon kmilo
CONFIGURE_ENV+=	DO_NOT_COMPILE="${DO_NOT_COMPILE}"
CONFIGURE_ARGS+=--with-pythondir=${LOCALBASE}

USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib %%PREFIX%%/lib/kde3

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

RUN_DEPENDS+=   gtar:${PORTSDIR}/archivers/gtar
post-patch:
	${REINPLACE_CMD} -e 's|>tar<|>gtar<|g' ${WRKSRC}/ark/ark.kcfg

.include <bsd.port.post.mk>
