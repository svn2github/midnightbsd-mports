# New ports collection makefile for:    grouch
# Date created:         09 Sep 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $FreeBSD: ports/net-im/grouch/Makefile,v 1.2 2006/09/10 20:10:24 dinoex Exp $
#

PORTNAME=	grouch
PORTVERSION=	20060713
CATEGORIES=	net-im
MASTER_SITES=	http://mail.rochester.edu/~asveikau/grouch/ \
		http://florida.ethz.ch/ports/distfiles/
DISTNAME=	${PORTNAME}-src-${PORTVERSION}

MAINTAINER=	gurkan@linuks.mine.nu
COMMENT=	AOL and ICQ Instant Messenger client for GNUstep

WRKSRC=		${WRKDIR}/Grouch
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
MAKEFILE=	GNUmakefile
USE_GNUSTEP_SYSTEM_LIBS+=	Renaissance:${RENAISSANCE_PORT}
RENAISSANCE_PORT?=	x11-toolkits/renaissance

.include <bsd.port.mk>
