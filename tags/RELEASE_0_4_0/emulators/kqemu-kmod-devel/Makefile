# $MidnightBSD: mports/emulators/kqemu-kmod-devel/Makefile,v 1.1 2009/03/01 16:36:03 laffer1 Exp $

PORTNAME=	kqemu
PORTVERSION=	1.4.0.p1
PORTREVISION=	1
CATEGORIES=	emulators kld
MASTER_SITES=	http://bellard.org/qemu/ \
		http://qemu.org/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	nox
PKGNAMESUFFIX=	-kmod-devel
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.p/pre/}
DIST_SUBDIR=	kqemu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kernel Accelerator for QEMU CPU Emulator (development version)
LICENSE=	gpl2

ONLY_FOR_ARCHS=	i386 amd64
HAS_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GCC=	any
CONFIGURE_ARGS+=	--prefix=${PREFIX} --cc=${CC}
CONFLICTS=	kqemu-kmod-[0-9]*

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
IGNORE=		requires kernel source to be installed
.endif

CFLAGS+=       ${DEBUG_FLAGS}

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
	${INSTALL_DATA} ${WRKSRC}/kqemu-doc.html ${WRKSRC}/kqemu-tech.html \
		${DOCSDIR}
.endif

.include <bsd.port.post.mk>
