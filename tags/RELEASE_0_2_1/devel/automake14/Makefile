# New ports collection makefile for:	automake
# Date created:		15 March 1997
# Whom:			FUJIMOTO Kensaku <fujimoto@oscar.elec.waseda.ac.jp>
#
# $MidnightBSD: mports/devel/automake14/Makefile,v 1.4 2008/03/23 20:38:14 laffer1 Exp $
# $FreeBSD: ports/devel/automake14/Makefile,v 1.62 2007/07/28 06:33:46 ade Exp $
#

PORTNAME=	automake
PKGNAMESUFFIX=	14
PORTVERSION=	1.4.6
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	automake
DISTNAME=	automake-1.4-p6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Standards-compliant Makefile generator (1.4)
LICENSE=	gpl2

RUN_DEPENDS=	${AUTOCONF_DEPENDS} \
		automake-wrapper:${PORTSDIR}/devel/automake-wrapper

USE_AUTOTOOLS=	autoconf:261:env
BUILD_VERSION=	1.4
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	automake14
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_ARGS=	--program-suffix=-${BUILD_VERSION}
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1
INFO=		automake-${BUILD_VERSION}

STRIP=		# none

post-patch:
	@${RM} ${WRKSRC}/*.info*
	@${MV} ${WRKSRC}/automake.texi ${WRKSRC}/automake-${BUILD_VERSION}.texi

pre-su-install:
	@${RM} -fr ${PREFIX}/share/automake-${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/automake-${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/share/aclocal-${BUILD_VERSION}

.include <bsd.port.mk>
