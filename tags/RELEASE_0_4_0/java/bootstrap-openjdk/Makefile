# $MidnightBSD: mports/java/bootstrap-openjdk/Makefile,v 1.3 2013/06/21 02:40:33 laffer1 Exp $

PORTNAME=	${JDK_NAME}
PORTVERSION=	${DISTVERSION_${ARCH}}
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	jkim
PKGNAMEPREFIX=	bootstrap-
DISTNAME=	${JDK_PORT}-${ARCH}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Oracle's Java 6 virtual machine release under the GPL v2
LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/share/java/zi:${PORTSDIR}/java/java-zoneinfo

ONLY_FOR_ARCH=	amd64 i386

DISTINFO_FILE=	${.CURDIR}/distinfo.${ARCH}
DISTVERSION_amd64=	r316538
DISTVERSION_i386=	r316538

JDK_NAME=	openjdk
JDK_PORT=	openjdk6
JDK_ROOT=	bootstrap-${JDK_NAME}

NO_BUILD=	yes
PLIST_SUB=	ARCH=${ARCH} JDK_NAME=${JDK_NAME} JDK_ROOT=${JDK_ROOT}
USE_XZ=		yes
WRKSRC=		${WRKDIR}/${JDK_ROOT}

INSTALLDIR=	${PREFIX}/${JDK_ROOT}

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4015
RUN_DEPENDS+=	${LOCALBASE}/lib/compat/libz.so.5:${PORTSDIR}/misc/compat8x
.endif

.if ${ARCH} == "i386"
PLIST_SUB+=	CLIENTVM=""
.else
PLIST_SUB+=	CLIENTVM="@comment "
.endif

do-install:
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${INSTALLDIR}
	@${CHOWN} ${BINOWN}:${BINGRP} ${INSTALLDIR}/bin/* ${INSTALLDIR}/jre/bin/*
	@${CHMOD} ${BINMODE} ${INSTALLDIR}/bin/* ${INSTALLDIR}/jre/bin/*
	(cd ${INSTALLDIR}/include && ln -s freebsd midnightbsd)

update:
	@${MAKE} -f ${.CURDIR}/Makefile.update \
	    JDK_NAME=${JDK_NAME} JDK_PORT=${JDK_PORT} JDK_ROOT=${JDK_ROOT}

.include <bsd.port.post.mk>
