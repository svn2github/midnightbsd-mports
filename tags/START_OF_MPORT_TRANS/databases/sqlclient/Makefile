# New ports collection makefile for:	sqlclient
# Date created:         28 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $FreeBSD: ports/databases/sqlclient/Makefile,v 1.1 2006/10/31 06:10:09 dinoex Exp $
# $MidnightBSD$
#

PORTNAME=	sqlclient
PORTVERSION=	1.2.0
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
DISTNAME=	SQLClient-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight database abstraction layer

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
ALL_TARGET=
LDCONFIG_DIRS=	${LOCALLIBDIR}
INSTALLS_SHLIB=	yes
NO_FILTER_SHLIBS=	yes

USE_GNUSTEP_LOCAL_LIBS+=	Performance:${PERFORMANCE_PORT}
PERFORMANCE_PORT?=	devel/performance

USE_PGSQL=yes

USE_MYSQL=yes
USE_SQLITE=yes
CFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}

#CONFIGURE_ARGS+=	--with-additional-lib="${PHREAD_LIBS}"
ADDITIONAL_LDFLAGS+=	-L${LOCALBASE}/lib -L${LOCALBASE}/GNUstep/Local/Library/Libraries
MAKE_ENV+=	ADDITIONAL_LDFLAGS="${ADDITIONAL_LDFLAGS}"

.include <bsd.port.mk>
