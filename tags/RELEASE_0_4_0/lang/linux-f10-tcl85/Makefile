# $MidnightBSD$
# $FreeBSD: ports/lang/linux-f10-tcl85/Makefile,v 1.6 2011/03/03 09:26:41 ehaupt Exp $

PORTNAME=	tcl
PORTVERSION=	8.5.3
CATEGORIES=	lang linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
PKGNAMESUFFIX=	85
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool Command Language (Linux Fedora 10)
LICENSE=	other

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	1.fc10
BRANDELF_FILES=	usr/bin/tclsh8.5
USE_LDCONFIG=	yes

PLIST_SUB=	PORTVERSION="${PORTVERSION}"
DESCR=		${.CURDIR}/../${PORTNAME}${PKGNAMESUFFIX}/pkg-descr

.include <bsd.port.mk>
