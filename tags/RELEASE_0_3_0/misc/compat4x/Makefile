# New ports collection makefile for:	compat4x libraries
# Date created:		01 Aug 2001
# Whom:			Scot W. Hetzel
#
# $MidnightBSD: mports/misc/compat4x/Makefile,v 1.4 2007/11/12 01:08:43 laffer1 Exp $
# $FreeBSD: ports/misc/compat4x/Makefile,v 1.33 2006/08/15 00:56:13 clsung Exp $
#

PORTNAME=	compat4x
PORTVERSION=	${COMPAT4X_PORTVERSION}
PORTREVISION=	10
CATEGORIES=	misc
MASTER_SITES=	${COMPAT4X_MASTER_SITES}
MASTER_SITE_SUBDIR=	${COMPAT4X_MASTER_SITE_SUBDIR}
PKGNAMESUFFIX=	-${COMPAT4X_ARCH}
DISTFILES=	${COMPAT4X_DISTFILES}
DIST_SUBDIR=	${COMPAT4X_ARCH}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A convenience package to install the compat4x libraries
LICENSE=	agg

WRKSRC=		${WRKDIR}/usr/lib/compat

NO_BUILD=	yes
USE_LDCONFIG=	yes
LDCONFIG_DIRS=	%%PREFIX%%/lib/compat
TARGET_DIR=	${PREFIX}/lib/compat
TARGET32_DIR=	${PREFIX}/lib32/compat
LDCONFIG_LIB32=	${LDCONFIG} -32
USE_LDCONFIG=	${TARGET_DIR}

.include <bsd.port.pre.mk>

COMPAT4X_ARCH=	${ARCH}

RUN_DEPENDS+=		${LOCALBASE}/share/compat/locale/UTF-8/LC_CTYPE:${PORTSDIR}/misc/localedata

COMPAT4X_OSVERSION=	5.3
.if ${ARCH} == i386
PLIST_SUB+=		LIBDIR="lib"
COMPAT4X_DISTFILES=	${PORTNAME}.aa \
			${PORTNAME}.ab
.elif ${ARCH} == amd64
COMPAT4X_ARCH=		i386
TARGET_DIR=		${TARGET32_DIR}
PLIST_SUB+=		LIBDIR="lib32"
COMPAT4X_DISTFILES=	${PORTNAME}.aa \
			${PORTNAME}.ab
.else
IGNORE=			in unsupported (FreeBSD 4.x did not run on this architecture)
.endif

.if ${COMPAT4X_ARCH} == i386
PLIST_SUB+=		I386_ONLY=""
.else
PLIST_SUB+=		I386_ONLY="@comment "
.endif

.if ${ARCH} == amd64
PLIST_SUB+=		AMD64_ONLY="" AMD64NA="@comment "
PLIST_SUB+=		LDCONFIG_LIB32="${LDCONFIG} -32"
USE_LDCONFIG32=		${TARGET32_DIR}
.undef USE_LDCONFIG
INSTALLS_SHLIB=		no
.else
PLIST_SUB+=		AMD64_ONLY="@comment " AMD64NA=""
.endif

OPENSSL_LIBS=		libcrypto.so.1 libcrypto.so.2 libssl.so.1 libssl.so.2
.if defined(FORCE_VULNERABLE_OPENSSL)
FORBIDDEN=		FreeBSD-SA-02:33.openssl, FreeBSD-SA-03:02.openssl, FreeBSD-SA-03:18.openssl  - OpenSSL contains multiple vulnerabilities

PLIST_SUB+=		FORBIDDEN:=""
.else
PLIST_SUB+=		FORBIDDEN:="@comment "
.endif

FREEBSD4_LIBS=		libc_r.so.4 libperl.so.3

.if defined(COMPAT4X_OSRELDATE) && !empty(COMPAT4X_OSRELDATE)
COMPAT4X_PORTVERSION=	${COMPAT4X_OSVERSION}.${COMPAT4X_OSRELDATE}
COMPAT4X_MASTER_SITES=	ftp://current.FreeBSD.org/pub/FreeBSD/%SUBDIR%/
COMPAT4X_MASTER_SITE_SUBDIR=	snapshots/${COMPAT4X_ARCH}/${COMPAT4X_OSVERSION}-${COMPAT4X_OSBRANCH}-${COMPAT4X_OSRELDATE}-JPSNAP/${PORTNAME}
.elif ${COMPAT4X_OSVERSION} == "5.3"
COMPAT4X_PORTVERSION=	${COMPAT4X_OSVERSION}
COMPAT4X_MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
COMPAT4X_MASTER_SITE_SUBDIR=	kris/${COMPAT4X_ARCH}
.else
COMPAT4X_PORTVERSION=	${COMPAT4X_OSVERSION}
COMPAT4X_MASTER_SITES=	${MASTER_SITE_FREEBSD_ORG}
COMPAT4X_MASTER_SITE_SUBDIR=	releases/${COMPAT4X_ARCH}/${COMPAT4X_OSVERSION}-RELEASE/${PORTNAME}
.endif

do-extract:
	@${MKDIR} ${WRKDIR}
	@(cd ${DISTDIR}/${DIST_SUBDIR} && ${CAT} ${DISTFILES} | ${TAR} -xzf - -C ${WRKDIR} )
.for lib in ${FREEBSD4_LIBS}
	@${MV} ${WRKSRC}/${lib} ${WRKSRC}/${lib}.compat4x
.endfor
.if !defined(FORCE_VULNERABLE_OPENSSL)
.for lib in ${OPENSSL_LIBS}
	@${RM} -f ${WRKSRC}/${lib}
.endfor
.endif

do-install:
	@${MKDIR} ${TARGET_DIR}
	${INSTALL_DATA} ${WRKSRC}/* ${TARGET_DIR}/
.for lib in ${FREEBSD4_LIBS}
	${LN} -sf ${lib}.compat4x ${TARGET_DIR}/${lib}
.endfor

# Include to automatic install file in libdata/ldconfig{,32}
.include "${PORTSDIR}/misc/ldconfig_compat/bsd.ldconfig.mk"

.include <bsd.port.post.mk>
