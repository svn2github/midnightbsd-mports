# New ports collection makefile for:    gnustep-examples
# Date created:         15 Mar 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/misc/gnustep-examples/Makefile,v 1.15 2006/09/12 17:26:16 dinoex Exp $
#

PORTNAME=	gnustep-examples
PORTVERSION=	1.1.0
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep example applications

WRKSRC=		${WRKDIR}/${DISTNAME}
GUN_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile

MAKE_APPS=	Finger GFractal HostAddress
INSTALL_APPS=	Finger GFractal HostAddress

post-build:
.for i in ${MAKE_APPS}
	@(cd ${WRKSRC}/gui/${i}; . ${SYSMAKEDIR}/GNUstep.sh; \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${ALL_TARGET})
.endfor

post-install:
.for i in ${INSTALL_APPS}
	@(cd ${WRKSRC}/gui/${i}; . ${SYSMAKEDIR}/GNUstep.sh; \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${INSTALL_TARGET})
.endfor

.include <bsd.port.mk>
