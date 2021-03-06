# ex:ts=8
# Ports collection makefile for:  boost
# Date Created:			  6 January 2002
# Whom:				  Paul Marquis <pmarquis@pobox.com>
#
# $FreeBSD: ports/devel/boost/Makefile,v 1.35 2006/09/22 22:22:19 mi Exp $
# $MidnightBSD: mports/devel/boost/Makefile,v 1.2 2007/04/30 00:05:01 ctriv Exp $
#

PORTNAME=	boost
PORTVERSION=	1.33.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:S/$/:boost_site,spirit_site/}
MASTER_SITE_SUBDIR=boost/:boost_site
DISTNAME=	${PORTNAME}_${PORTVERSION:S/./_/g}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:boost_site

WRKSRC=		${WRKDIR}/${PORTNAME}_${PORTVERSION:S/./_/g}

MAINTAINER=	barner@FreeBSD.org
COMMENT=	Free peer-reviewed portable C++ source libraries

USE_BZIP2=	yes
INSTALLS_SHLIB=	yes

MAKE_ENV+=	GCC="${CC} ${CFLAGS}"\
		GXX="${CXX} ${CXXFLAGS}"\
		STLPORT_ROOT=/

.if defined(WITH_PYTHON) || defined (WITH_PYSTE)
USE_PYTHON=	2.4+
.endif

OPTIONS=	VERBOSE_BUILD	"Show compiler messages"	off \
		DEBUG		"Build debugging symbols"	off \
		THREADS		"Thread support"		on  \
		ICU		"Boost.Regex with ICU unicode support" off \
		OPTIMIZED_CFLAGS "Enable -O3 optimization"	off \
		GCC34		"Use GCC 3.4 (for FreeBSD 4.x only)" off

UNIQ=		/usr/bin/uniq
BOOST_LIBS=	date_time filesystem iostreams prg_exec_monitor\
		program_options regex serialization signals\
		test_exec_monitor unit_test_framework
BOOST_SHARED_LIB_VER=	3

PKGMESSAGE=	${WRKDIR}/pkg-message

.include <bsd.port.pre.mk>

.if !defined(WITH_PYTHON) && defined(WITH_PYSTE)
WITH_PYTHON=	IMPLIED_BY_PYSTE
.endif

#
# Unfortunately, it is not possible to use OPTIONS to control the
# optional Python support
#
# In order to build Boost's Python bindings, please specify
# -DWITH_PYTHON on the command line or use the devel/boost-python
# slave port.
#
# To build Pyste, the Boost.Python code generator use -DWITH_PYSTE
# (this implies -DWITH_PYTHON).
#
.if defined(WITH_PYTHON)
.if !defined(BOOST_GCC3_PORT)
PKGNAMESUFFIX=	-python
.else
PKGNAMESUFFIX=  -python-gcc3
.endif
PLIST_SUB+=	BOOST_PYTHON=""
MAKE_ENV+=	PYTHON_ROOT="${LOCALBASE}"\
		PYTHON_VERSION="${PYTHON_VERSION}"\
		PYTHON_INCLUDES="${PYTHON_INCLUDEDIR}"\
		PYTHON_LIB_PATH="${PYTHON_LIBDIR}"
BOOST_LIBS+=	python
.if defined(WITH_PYSTE)
RUN_DEPENDS+=	gccxml:${PORTSDIR}/devel/gccxml \
		${PYTHON_SITELIBDIR}/elementtree/ElementTree.py:${PORTSDIR}/devel/py-elementtree
BUILD_DEPENDS+=	${PYTHON_SITELIBDIR}/elementtree/ElementTree.py:${PORTSDIR}/devel/py-elementtree
PLIST_SUB+=	BOOST_PYSTE=""
.else
PLIST_SUB+=	BOOST_PYSTE="@comment "
.endif
.else
PLIST_SUB+=	BOOST_PYTHON="@comment "
PLIST_SUB+=	BOOST_PYSTE="@comment "
.endif

SPIRIT_VERSION=	1.6.2

# - wchar support
# - spirit 1.8.x
# - wave 1.2
# - build libbgl-wiz
BOOST_TOOLS=	gcc
EXTRA_PATCHES=	${FILESDIR}/FBSD5-patch-boost::python::detail::config.hpp

PLIST_SUB+=	BOOST_WCHAR=""\
		BOOST_SPIRIT_1.6="@comment "\
		BOOST_SPIRIT_1.8=""\
		BOOST_WAVE=""

BOOST_LIBS+=	wserialization

.if defined (WITH_VERBOSE_BUILD)
BJAM_OPTIONS=	-d2
.endif

.if defined (WITHOUT_DEBUG)
BJAM_BUILD+=	release
.else
BJAM_BUILD+=	debug
.endif

.if defined (WITHOUT_THREADS)
BJAM_BUILD+=	<threading>single
PLIST_SUB+=	BOOST_THREADS="@comment "
.else
BJAM_BUILD+=	<threading>multi
PLIST_SUB+=	BOOST_THREADS=""
BOOST_LIBS+=	thread
.endif

.if defined (WITH_ICU)
LIB_DEPENDS+=	icuuc:${PORTSDIR}/devel/icu
BOOST_ICU_OPTS=	"-sICU_PATH=${LOCALBASE}"
.endif

.if defined (WITHOUT_OPTIMIZED_CFLAGS)
BJAM_BUILD+=	<optimization>off
.else
BJAM_BUILD+=	<optimization>speed\
		<inlining>full
.endif

.if ${ARCH} == alpha
BJAM=		${WRKSRC}/tools/build/jam_src/bin.freebsdaxp/bjam
# temporary work around for GCC bug on alpha
# ("-mcpu=ev4 -mtune=ev5 -mieee" makes gcc consume all virtual memory)
#
# If you are trying to build this on alpha, a quick test whether the problem
# still exists would be very much appreciated!
CXXFLAGS=-O -pipe
.elif ${ARCH} == sparc64
BJAM=		${WRKSRC}/tools/build/jam_src/bin.freebsdsparc/bjam
.elif ${ARCH} == ia64
BJAM=		${WRKSRC}/tools/build/jam_src/bin.freebsdia64/bjam
.else
BJAM=		${WRKSRC}/tools/build/jam_src/bin.freebsd/bjam
.endif

pre-everything::
.if !defined(WITH_PYTHON)
	@${ECHO_CMD}
	@${ECHO_CMD} To build Boost\'s Python bindings hit CTRL+C now and
	@${ECHO_CMD} run \`\`make -DWITH_PYTHON [...]\'\' or use the
	@${ECHO_CMD} devel/boost-python slave port.
	@${ECHO_CMD}
	@sleep 2
.else
.if ${WITH_PYTHON} == IMPLIED_BY_PYSTE
	@${ECHO_CMD}
	@${ECHO_CMD} WITH_PYSTE implies WITH_PYTHON! Enabling Python bindings!
	@${ECHO_CMD}
.else
	@${ECHO_CMD}
	@${ECHO_CMD} Python bindings enabled!
	@${ECHO_CMD}
.endif
.if !defined(WITH_PYSTE)
	@${ECHO_CMD} To build Pyste, Boost.Python\'s interface generator,  hit CTRL+C now and
	@${ECHO_CMD} run \`\`make -DWITH_PYTHON -DWITH_PYSTE[...]\'\'.
	@${ECHO_CMD}
	@sleep 2
.else
	@${ECHO_CMD} Pyste will be installed!
	@${ECHO_CMD}
.endif
.endif

do-extract:
	@${MKDIR} ${WRKDIR}
	@cd ${WRKDIR} && ${TAR} -xjpof ${DISTDIR}/${DISTNAME}.tar.bz2

post-patch:
# If necessary, remove Boost.Python
.if !defined(WITH_PYTHON)
	@${RM} -rf ${WRKSRC}/boost/python* ${WRKSRC}/libs/python
.endif

# Do the right thing(tm) for pthread support
	@${REINPLACE_CMD} -e 's|%%PTHREAD_CFLAGS%%|${PTHREAD_CFLAGS}|'\
		${WRKSRC}/tools/build/v1/gcc-tools.jam \
		${WRKSRC}/tools/build/v1/gcc-stlport-tools.jam
	@${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|'\
		${WRKSRC}/tools/build/v1/gcc-tools.jam \
		${WRKSRC}/tools/build/v1/gcc-stlport-tools.jam

post-configure:
# Configure pyste, the Boost.Python code generator
.if defined(WITH_PYSTE)
	@cd ${BUILD_WRKSRC}/libs/python/pyste/install && \
	${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} \
		config ${PYDISTUTILS_CONFIGUREARGS}
.endif

do-build:
# build the bjam project build tool
	cd ${WRKSRC}/tools/build/jam_src && ./build.sh gcc

# build the library
	cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${BJAM} ${BJAM_OPTIONS} --prefix=${PREFIX}\
		"-sTOOLS=${BOOST_TOOLS}" "-sBUILD=${BJAM_BUILD}"\
		${BOOST_STL_OPTS} ${BOOST_ICU_OPTS}

# build bgl-viz library
	cd ${WRKSRC}/libs/graph/build && \
		${SETENV} ${MAKE_ENV} ${BJAM} ${BJAM_OPTIONS} --prefix=${PREFIX}\
                "-sTOOLS=${BOOST_TOOLS}" "-sBUILD=${BJAM_BUILD}"\
                ${BOOST_STL_OPTS} ${BOOST_ICU_OPTS}

# build random device code
	cd ${WRKSRC}/libs/random && \
	${CXX} ${CXXCFLAGS} ${CFLAGS} -c -I${WRKSRC} random_device.cpp && \
	${AR} rc ${WRKSRC}/bin/boost/libs/libboost_random.a random_device.o

# Build pyste, the Boost.Python code generator
.if defined(WITH_PYSTE)
	cd ${BUILD_WRKSRC}/libs/python/pyste/install && \
	${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} \
		build ${PYDISTUTILS_BUILDARGS}
.endif

do-install:
	${MKDIR} ${PREFIX}/bin
	${INSTALL_PROGRAM} ${BJAM} ${PREFIX}/bin/

# Install libraries
	${MKDIR} ${PREFIX}/lib
	${FIND} ${WRKSRC}/bin/boost/libs -type f -name "*.a"\
		-exec ${INSTALL_DATA} \{\} ${PREFIX}/lib \;

	${FIND} ${WRKSRC}/bin/boost/libs -type f \
		-name "*.so" \
		-exec ${INSTALL_DATA} \{\} ${PREFIX}/lib \;

# Create symlinks for shared libraries
.for lib in ${BOOST_LIBS}
	cd ${PREFIX}/lib && \
	${MV} -f "libboost_${lib}.so" "libboost_${lib}.so.${BOOST_SHARED_LIB_VER}" && \
	${LN} -fs "libboost_${lib}.so.${BOOST_SHARED_LIB_VER}" "libboost_${lib}.so"
.endfor

# Install headers
	${MKDIR} ${PREFIX}/include
	cd ${WRKSRC} && \
	${FIND} boost -type d -a \! -name "*.orig"\
		-exec ${MKDIR} ${PREFIX}/include/\{\} \;

	cd ${WRKSRC} && \
	${FIND} boost -type f -a \! -name "*.orig"\
		-exec ${INSTALL_DATA} \{\} ${PREFIX}/include/\{\} \;

# Install pyste, the Boost.Python code generator
.if defined(WITH_PYSTE)
	cd ${WRKSRC}/libs/python/pyste/install && \
	${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} \
		install ${PYDISTUTILS_INSTALLARGS}
.else
# Delete pyste folder in order not to install the documentation
	${RM} -rf ${WRKSRC}/libs/python/pyste
.endif

# Documentation & examples
.if !defined(NOPORTDOCS)
# Installation
	${MKDIR} ${DOCSDIR}

	${FIND} ${WRKSRC} -type f -exec ${CHMOD} 0444 {} \;
	${FIND} ${WRKSRC} -type d -exec ${CHMOD} 0755 {} \;
	${FIND} ${WRKSRC} -name ".cvsignore" -delete
	cd ${WRKSRC} &&\
	${FIND} . -name "*.htm" -o -name "*.html"  -o -name "*.css"\
		-o -name "*.jp*g" -o -name "*.png" -o -name "*.gif"\
		| ${TAR} cTf - - | ${TAR} xUCf ${DOCSDIR} -

	cd ${WRKSRC}/libs &&\
	${FIND} . -name "example" -o -name "examples" -o -name "*example*.cpp"\
		-o -name "*example*.c" -o -name "*example*.hpp" | ${UNIQ} |\
		${GREP} -v "assign/test" | ${GREP} -v "iterator/test" | \
		${GREP} -v "range/test" |\
	${TAR} cTf - - | ${TAR} xUCf ${DOCSDIR}/libs -
.endif

# display pkg-message
post-install:
	@${TOUCH} ${PKGMESSAGE}

.if defined (WITH_THREADS)
	@${CAT} ${.CURDIR}/../boost/pkg-message.threads >> ${PKGMESSAGE}
	@${ECHO_CMD} >> ${PKGMESSAGE}
.endif

.if defined (WITH_PYTHON)
	@${CAT} ${.CURDIR}/../boost/pkg-message.python >> ${PKGMESSAGE}
	@${ECHO_CMD} >> ${PKGMESSAGE}
.endif

	@${REINPLACE_CMD} \
		-e "s|%%LOCALBASE%%|${LOCALBASE}|g" \
		-e "s|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|g" \
		-e "s|%%PYTHON_INCLUDEDIR%%|${PYTHON_INCLUDEDIR}|g" \
		-e "s|%%PYTHON_LIBDIR%%|${PYTHON_LIBDIR}|g" \
		-e "s|%%PYTHON_VERSION%%|${PYTHON_VERSION}|g" ${PKGMESSAGE}


.include <bsd.port.post.mk>
