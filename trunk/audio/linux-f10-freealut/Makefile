# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-freealut/Makefile,v 1.10 2011/03/03 09:26:35 ehaupt Exp $

PORTNAME=	freealut
PORTVERSION=	1.1.0
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A free implementation of OpenAL's ALUT standard (Linux Fedora 10)
LICENSE=	lgpl

CONFLICTS=	linux-freealut-[0-9]*

USE_LINUX_RPM=	yes
USE_LINUX_APPS=	openal
LINUX_DIST_VER=	10
RPMVERSION=	6.fc9
USE_LDCONFIG=	yes
ONLY_FOR_ARCHS=	i386 amd64

PLIST_FILES=	usr/lib/libalut.so.0 usr/lib/libalut.so.0.1.0
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	AUTHORS COPYING ChangeLog README
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
