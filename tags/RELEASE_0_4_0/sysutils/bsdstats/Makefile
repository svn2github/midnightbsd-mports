# New ports collection makefile for:	bsdstats
# Date created:		5 August 2006
# Whom:			Marc G. Fournier <scrappy@freebsd.org>
#
# $FreeBSD: ports/sysutils/bsdstats/Makefile,v 1.47 2006/12/09 06:06:13 scrappy Exp $
# $MidnightBSD: mports/sysutils/bsdstats/Makefile,v 1.10 2011/06/04 15:25:26 laffer1 Exp $ 
#

PORTNAME=	bsdstats
PORTVERSION=	5.5
PORTREVISION=	3
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monthly script for reporting anonymous statistics about your machine
LICENSE=	unknown

USE_RC_SUBR=	bsdstats
SUB_FILES=	300.statistics pkg-message

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/monthly
	${INSTALL_SCRIPT} ${WRKDIR}/300.statistics ${PREFIX}/etc/periodic/monthly

.include <bsd.port.mk>
