# New ports collection makefile for:    preferencepanes
# Date created:         29 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/deskutils/preferencepanes/Makefile,v 1.1 2006/10/31 06:17:17 dinoex Exp $
# $MidnightBSD$
#

PORTNAME=	preferencepanes
PORTVERSION=	1.0.1
CATEGORIES=	deskutils
MASTER_SITES=	http://www.gnustep.it/enrico/system-preferences/
DISTNAME=	systempreferences-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PreferencePanes framework for GNUstep

WRKSRC=		${WRKDIR}/${DISTNAME}/PreferencePanes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
DEFAULT_LIBVERSION=	1.0.0

.include <bsd.port.mk>
