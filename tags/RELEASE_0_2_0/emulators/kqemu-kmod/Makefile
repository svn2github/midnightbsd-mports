# New ports collection makefile for:	kqemu-kmod
# Date created:				2005/10/25
# Whom:					nork@FreeBSD.org
#
# $MidnightBSD: mports/emulators/kqemu-kmod/Makefile,v 1.1 2007/04/02 03:09:12 laffer1 Exp $
# $FreeBSD: ports/emulators/kqemu-kmod/Makefile,v 1.15 2007/02/07 21:13:06 nox Exp $
#

PORTNAME=	kqemu
PORTVERSION=	1.3.0.p11
CATEGORIES=	emulators
MASTER_SITES=	http://qemu.org/ \
		http://fabrice.bellard.free.fr/qemu/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	nox
PKGNAMESUFFIX=	-kmod
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.p/pre/}
DIST_SUBDIR=	kqemu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kernel Acceralator for QEMU CPU Emulator (development version)

ONLY_FOR_ARCHS=	i386 amd64
HAS_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GCC=	3.4
CONFIGURE_ARGS+=	--prefix=${PREFIX} --cc=${CC}


USE_RC_SUBR=	kqemu

.include <bsd.port.pre.mk>

PORTDOCS=	kqemu-doc.html kqemu-tech.html
PLIST_FILES=	"include/kqemu/kqemu.h"
PLIST_FILES+=	"@dirrm include/kqemu"
PLIST_FILES+=	"@cwd /"
PLIST_FILES+=	${KMODDIR:C,^/,,}/kqemu.ko
PLIST_FILES+=	"@unexec kldxref ${KMODDIR}"

MAKEFILE=	Makefile.freebsd

.if ${ARCH} == "amd64"
MAKE_ARGS+=	ARCH=x86_64
.endif

# install where x11/nvidia-driver does also:
KMODDIR=	/boot/modules

MAKE_ENV+=	KMODDIR="${KMODDIR}"

.if !exists(${SRC_BASE}/sys/Makefile)
IGNORE=		kqemu requires kernel source to be installed
.endif

do-build:
	@(cd ${BUILD_WRKSRC}/common; ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} Makefile ${MAKE_ARGS} ${ALL_TARGET})
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${ALL_TARGET})

pre-install:
	${MKDIR} ${KMODDIR}

do-install:
	@(cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${INSTALL_TARGET})
	${MKDIR} ${PREFIX}/include/kqemu
	${INSTALL_DATA} ${WRKSRC}/kqemu.h ${PREFIX}/include/kqemu
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/kqemu-doc.html ${WRKSRC}/kqemu-tech.html ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
