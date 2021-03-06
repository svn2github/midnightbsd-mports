# $MidnightBSD$

PORTNAME=	compiler-rt
DISTVERSION=	0.r${SVN_REV}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	brooks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compiler runtime library with Blocks support
LICENSE=	agg

BUILD_DEPENDS=	cmake:${PORTSDIR}/devel/cmake

CONFIGURE_WRKSRC=	${WRKDIR}/build
BUILD_WRKSRC=		${WRKDIR}/build
INSTALL_WRKSRC=		${WRKDIR}/build

CMAKE_SOURCE_PATH=	${WRKSRC}

USE_CMAKE=	yes
USE_GCC=	4.2+
USE_GMAKE=	yes
USE_BZIP2=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

LLVM_SVN=	http://llvm.org/svn/llvm-project

PLIST_FILES=	include/Block.h \
		include/Block_private.h \
		lib/libBlocksRuntime.so

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
CFLAGS+=	-march=i486
.endif

.if defined(BOOTSTRAP)
SVN_REV!=	svn info ${LLVM_SVN}/ | ${GREP} Revision | cut -d' ' -f2
.else
.include "Makefile.svn_rev"
.endif

.if defined(BOOTSTRAP)
FETCH_DEPENDS+=	svn:${PORTSDIR}/devel/subversion

do-fetch:
	${MKDIR} ${WRKDIR}
	svn export -r ${SVN_REV} \
	    ${LLVM_SVN}/compiler-rt/trunk ${WRKSRC}
	cd ${WRKDIR}; tar cvfy ${DISTDIR}/${DISTNAME}.tar.bz2
${DISTNAME}
	echo "SVN_REV=	${SVN_REV}" > ${MASTERDIR}/Makefile.svn_rev
.endif

post-extract:
	${MKDIR} ${CONFIGURE_WRKSRC}

.include <bsd.port.post.mk>
