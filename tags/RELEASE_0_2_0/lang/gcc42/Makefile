# ex:ts=8
# Ports collection makefile for:	egcs
# Date created:				9 Jan 1998
# Whom:					John Polstra <jdp@polstra.com>
#
# $MidnightBSD: mports/lang/gcc42/Makefile,v 1.6 2008/06/26 03:47:29 laffer1 Exp $
# $FreeBSD: ports/lang/gcc42/Makefile,v 1.302 2007/02/09 10:54:58 gerald Exp $
#

PORTNAME=	gcc
PORTVERSION=	4.2.5
PORTREVISION=	20080702
CATEGORIES=	lang java
VERSIONSTRING=	4.2-${PORTREVISION}
MASTER_SITES=	${MASTER_SITE_GCC}
MASTER_SITE_SUBDIR=	snapshots/${VERSIONSTRING}
DISTFILES=	gcc-core-${VERSIONSTRING}${EXTRACT_SUFX} \
		gcc-fortran-${VERSIONSTRING}${EXTRACT_SUFX} \
		gcc-g++-${VERSIONSTRING}${EXTRACT_SUFX} \
		gcc-objc-${VERSIONSTRING}${EXTRACT_SUFX} \
		gcc-testsuite-${VERSIONSTRING}${EXTRACT_SUFX}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	GNU Compiler Collection 4.2
LICENSE=	gpl2

LIB_DEPENDS=	gmp.7:${PORTSDIR}/math/libgmp4 \
		mpfr.2:${PORTSDIR}/math/mpfr

CONFLICTS?=	gcc-withfortran-4.2.*

SUFFIX=		42
LATEST_LINK?=	gcc${SUFFIX}${PKGNAMESUFFIX}
USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
USE_PERL5_BUILD=yes

.if defined(WITH_JAVA_AWT)
LIB_DEPENDS+=   cairo.2:${PORTSDIR}/graphics/cairo
USE_GNOME=	gtk20 libartlgpl2
WANT_GNOME=	yes
.endif

PATCH_WRKSRC=	${SRCDIR}
CONFIGURE_SCRIPT=	../${SRCDIR:C/${WRKDIR}//}/configure
NOMANCOMPRESS=	yes	# too hard to deal with differences on 5-cur and releng4

.include <bsd.port.pre.mk>

.if ${ARCH} != i386
WITHOUT_JAVA=	yes
.endif

.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd6.1
.else
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd6.1
.endif

SRCDIR=		${WRKDIR}/gcc-${VERSIONSTRING}
WRKSRC=		${WRKDIR}/build
TARGLIB=	${PREFIX}/lib/gcc-${PORTVERSION}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--disable-nls \
		--with-system-zlib \
		--with-libiconv-prefix=${LOCALBASE} \
		--with-gmp=${LOCALBASE} \
		--program-suffix=${SUFFIX} \
		--libdir=${TARGLIB} \
		--with-gxx-include-dir=${TARGLIB}/include/c++/ \
		--infodir=${PREFIX}/${INFO_PATH}/gcc${SUFFIX}
.if defined(WITH_JAVA_AWT)
CONFIGURE_ARGS+=	--enable-java-awt=gtk,xlib \
			--enable-gtk-cairo
.endif
MAKE_ARGS+=	MAKEINFOFLAGS="--no-split"
ALL_TARGET=	bootstrap-lean
USE_LDCONFIG=	${TARGLIB}
PLIST_SUB=	GCC_VER=${PORTVERSION} GNU_HOST=${CONFIGURE_TARGET} \
		SUFFIX=${SUFFIX}
MAN1=		cpp${SUFFIX}.1 \
		g++${SUFFIX}.1 \
		gcc${SUFFIX}.1 \
		gcov${SUFFIX}.1 \
		gfortran${SUFFIX}.1
INFO=		gcc${SUFFIX}/cpp \
		gcc${SUFFIX}/cppinternals \
		gcc${SUFFIX}/gcc \
		gcc${SUFFIX}/gccinstall \
		gcc${SUFFIX}/gccint \
		gcc${SUFFIX}/gfortran \
		gcc${SUFFIX}/libgomp

.if ! defined(WITHOUT_JAVA)
DISTFILES+=	gcc-java-${VERSIONSTRING}${EXTRACT_SUFX}
BUILD_DEPENDS+=	zip:${PORTSDIR}/archivers/zip
EXTRA_PATCHES+=	${FILESDIR}/java-patch-hier
# FIXME: we are currently getting weird build failures with libjava on
# some 4.x and 5.x systems, which the following works around. PR 81788.
CONFIGURE_ARGS+=--disable-rpath
MAKE_ENV+=	JAR=no
MAN1+=		gcj${SUFFIX}.1 \
		gcj-dbtool${SUFFIX}.1 \
		gcjh${SUFFIX}.1 \
		gij${SUFFIX}.1 \
		gjnih${SUFFIX}.1 \
		grmic${SUFFIX}.1 \
		grmiregistry${SUFFIX}.1 \
		grepjar${SUFFIX}.1 \
		jar${SUFFIX}.1 \
		jcf-dump${SUFFIX}.1 \
		jv-scan${SUFFIX}.1 jv-convert${SUFFIX}.1 \
		rmic${SUFFIX}.1 rmiregistry${SUFFIX}.1
INFO+=		gcc${SUFFIX}/gcj
PLIST_SUB+=	JAVA=""
.else
CONFIGURE_ARGS+=--disable-libgcj
PLIST_SUB+=	JAVA="@comment "
.endif

pre-everything::
	@${ECHO_MSG} "Making GCC ${DISTNAME:S/^gcc-//} for ${OPSYS} ${OSREL}  target=${CONFIGURE_TARGET}"

post-patch:
	@${REINPLACE_CMD} -e 's|\(const char version_string.*\)";|\1 [MidnightBSD]";|' \
	    ${SRCDIR}/gcc/version.c

pre-configure:
	cd ${SRCDIR} ; contrib/gcc_update --touch
	@${RM} -f ${SRCDIR}/gcc/*/*.info*
	@${MKDIR} ${CONFIGURE_WRKSRC}

post-build:
	@${ECHO_MSG} "Consider running 'make check' before 'make install', especially"
	@${ECHO_MSG} "if you have not performed this build on -STABLE or -CURRENT."
	@${ECHO_MSG} "This assumes that you have the dejagnu port installed."

check: build
	cd ${WRKSRC}; export RUNTESTFLAGS='--target_board ''unix{-pthread}'''; ${GMAKE} -sk check

post-install:
	# man pages can only be generated if Perl >= 5.6 is installed;
	# fake them otherwise.
	for mp in ${_MANPAGES}; do \
	  ${TEST} -e $${mp} || ${TOUCH} ${TOUCH_FLAGS} $${mp}; \
	done
	${RM} -f ${PREFIX}/man/man7/fsf-funding.7 \
	         ${PREFIX}/man/man7/gfdl.7 ${PREFIX}/man/man7/gpl.7
	${RM} -f ${TARGLIB}/*.la
	# Add target libraries and include files to packaging list.
	${RM} -f ${WRKDIR}/PLIST.lib
.for d in ${TARGLIB:S/^${PREFIX}\///} libexec/gcc/${CONFIGURE_TARGET}/${PORTVERSION} include/gcj include/gnu include/java include/javax
	cd ${PREFIX} ; if [ -d $d ]; then \
	    ${FIND} $d -type f -o -type l >>${WRKDIR}/PLIST.lib ;\
	    ${FIND} $d -type d | ${SORT} -r \
	        | ${SED} -e 's/^/@dirrm /g' >>${WRKDIR}/PLIST.lib ;\
	fi
.endfor
	${ECHO_CMD} "@unexec ${RMDIR} %D/libexec/gcc/${CONFIGURE_TARGET} 2>&1 || true" >> ${WRKDIR}/PLIST.lib
	${ECHO_CMD} "@unexec ${RMDIR} %D/libexec/gcc 2>&1 || true" >> ${WRKDIR}/PLIST.lib
	cd ${WRKDIR} ; ${SED} -i -e "/PLIST.lib/ r PLIST.lib" ${TMPPLIST}

.include <bsd.port.post.mk>
