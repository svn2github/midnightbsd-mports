# -*-mode: makefile-*-
# New ports collection makefile for:	kdenetwork2
# Date created:				2 November 2001
# Whom:					will@cvs.kde.org
#
# $FreeBSD: ports/net/kdenetwork3/Makefile,v 1.124 2006/09/12 23:26:43 lofi Exp $
# $MidnightBSD: mports/net/kdenetwork3/Makefile,v 1.2 2007/12/30 03:07:02 laffer1 Exp $
#

PORTNAME=	kdenetwork
PORTVERSION=	${KDE_VERSION}
CATEGORIES?=	net kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Network-related programs and modules for KDE
LICENSE=	gpl2

LIB_DEPENDS=	slp:${PORTSDIR}/net/openslp

OPTIONS=	KOPETE	"Install kopete multi-protocol instant messenger" OFF

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_PERL5=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_OPENSSL=	yes

USE_AUTOTOOLS=  libtool:15
USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib %%PREFIX%%/lib/kde3
DO_NOT_COMPILE+=kopete lanbrowsing filesharing

CONFIGURE_ARGS+=--with-ssl-dir=${OPENSSLBASE}

.if defined(DO_NOT_COMPILE)
CONFIGURE_ENV+=DO_NOT_COMPILE="${DO_NOT_COMPILE}"
.endif # defined(DO_NOT_COMPILE)

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

pre-configure:
	@${REINPLACE_CMD} \
	-E -e '/^SUBDIRS/s/lisa//g' \
		${WRKSRC}/doc/Makefile.in
	@${REINPLACE_CMD} \
	-e 's|/etc/security/|${LOCALBASE}/etc/|g' \
		${WRKSRC}/filesharing/advanced/kcm_sambaconf/kcmsambaconf.cpp \
		${WRKSRC}/filesharing/simple/fileshare.cpp

##
# OPTIONS handling
##
#
.if defined(WITH_KOPETE)
RUN_DEPENDS+=	kopete:${PORTSDIR}/net-im/kopete
.endif

.include <bsd.port.post.mk>
