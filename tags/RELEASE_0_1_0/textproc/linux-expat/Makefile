# New ports collection makefile for:	linux-expat
# Date created:				2003-07-05
# Whom:					trevor
#
# $MidnightBSD: mports/textproc/linux-expat/Makefile,v 1.1 2006/09/23 21:55:27 laffer1 Exp $
# $FreeBSD: ports/textproc/linux-expat/Makefile,v 1.14 2006/07/09 21:01:45 bsam Exp $
#

PORTNAME=	expat
PORTVERSION=	1.95.8
CATEGORIES=	textproc linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux/i386 binary port of Expat XML-parsing library

BRANDELF_DIRS=	usr/bin

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
ONLY_FOR_ARCHS=	i386 amd64
USE_LDCONFIG=	yes
PLIST_SUB+=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
