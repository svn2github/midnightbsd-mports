# $MidnightBSD: mports/devel/gnustep/Makefile,v 1.10 2011/08/16 23:14:11 laffer1 Exp $ 

PORTNAME=	gnustep
PORTVERSION=	1.24.0
CATEGORIES=	devel lang gnustep
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Objective-C libraries based on the OpenStep standard
LICENSE=	agg
# part gpl3 now

NO_BUILD=	yes
NO_INSTALL=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_GUI=	yes
USE_GNUSTEP_BACK=	yes
.if !defined(WITH_GNUSTEP_SINGLE_BACKEND)
USE_GNUSTEP_XLIB=	yes
USE_GNUSTEP_LIBART=	yes
USE_GNUSTEP_CAIRO=	yes
.endif


.include <bsd.port.mk>
