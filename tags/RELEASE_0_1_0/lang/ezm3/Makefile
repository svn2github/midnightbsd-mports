# New ports collection makefile for:	ezm3
# Date created:		1 Jan 2002
# Whom:			John Polstra <jdp@FreeBSD.org>
#
# $FreeBSD: ports/lang/ezm3/Makefile,v 1.16 2006/04/29 13:05:31 pav Exp $
# $MidnightBSD: mports/lang/ezm3/Makefile,v 1.3 2007/05/24 17:07:50 ctriv Exp $
#

PORTNAME=	ezm3
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	lang

MASTER_SITES=	ftp://ftp.FreeBSD.org/pub/FreeBSD/development/CVSup/ezm3/:src \
		http://people.freebsd.org/~peter/ezm3-amd64/:amdb \
		ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/local-distfiles/pav/:amdp
DISTFILES=	ezm3-${PORTVERSION}-src.tar.bz2:src

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
DISTFILES+=	ezm3-${PORTVERSION}-${TARGET}-boot.tar.bz2:amdb \
		ezm3-amd64-patchset-2.tar.bz2:amdp
.else
DISTFILES+=	ezm3-${PORTVERSION}-${TARGET}-boot.tar.bz2:src
.endif

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easier, more portable Modula-3 distribution for building CVSup
LICENSE=	modula3

DIST_SUBDIR=	ezm3
INSTALL_TARGET=	all

# This port fails if files are moved from their installed location.
FAKE_DESTDIR=	/

MAKE_ARGS+=	M3OPTIONS="-DBUILD_ALL -DSHIP_ALL"
MAN1=		m3bundle.1
PLIST_SUB+=	ARCH=${ARCH} TARGET=${TARGET} WORDSIZE=${WORDSIZE} \
		ENDIANESS=${ENDIANESS}
SCRIPTS_ENV+=	TARGET=${TARGET}
USE_BZIP2=	yes
USE_GMAKE=	yes

PROGS=		bin/m3build \
		bin/m3bundle \
		bin/m3ship \
		lib/m3/${TARGET}/m3cgc1

ONLY_FOR_ARCHS=	alpha amd64 i386 sparc64

.if ${ARCH} == "alpha"
TARGET=		FBSD_ALPHA
WORDSIZE=	64
ENDIANESS=	le
PLIST_SUB+=	AMD64="@comment "
.elif ${ARCH} == "amd64"
MAINTAINER=	bzeeb+freebsdports@zabbadoz.net
PORTVERSION=	1.1
AMD64_PATCHES=	p-amd64-common p-amd64-gcc p-amd64-gcc-321-322 p-amd64-gcchacks \
		p-amd64-gccstatic p-amd64-m3 p-amd64-m3-except-sort p-amd64-newfiles
TARGET=		FBSD_AMD64
WORDSIZE=	64
ENDIANESS=	le
PLIST_SUB+=	AMD64=""
.elif ${ARCH} == "i386"
TARGET=		FreeBSD4
WORDSIZE=	32
ENDIANESS=	le
PLIST_SUB+=	AMD64="@comment "
.elif ${ARCH} == "sparc64"
TARGET=		FBSD_SPARC64
WORDSIZE=	64
ENDIANESS=	be
PLIST_SUB+=	AMD64="@comment "
.endif

# The build fails for -O2 or greater.  Override it with plain -O.
.if defined(CFLAGS) && !empty(CFLAGS:M-O[2-9s]*)
CFLAGS+=	-O
.endif

pre-patch:
.if ${ARCH} == "amd64"
.for f in ${AMD64_PATCHES}
	@cd ${WRKSRC} && ${PATCH} ${PATCH_ARGS} < ${WRKDIR}/${f}
.endfor
.endif

do-build:
	@${ECHO_MSG} "This port does everything in the install step."
	@${ECHO_MSG} "The build step is a no-op."

pre-install:
	@${SETENV} ${SCRIPTS_ENV} ${SH} ${SCRIPTDIR}/check_conflicts

do-install:
	@${RM} -rf ${WRKSRC}/${TARGET}
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} \
		${MAKEFILE} ${MAKE_ARGS} ${INSTALL_TARGET})
	@for i in ${PROGS}; do ${STRIP_CMD} ${PREFIX}/$$i; done
	@${MKDIR} ${PREFIX}/share/ezm3
	@${INSTALL_DATA} ${WRKSRC}/src/COPYRIGHT ${PREFIX}/share/ezm3

.include <bsd.port.post.mk>
