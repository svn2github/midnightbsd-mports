# $MidnightBSD: mports/lang/clang/Makefile,v 1.1 2011/06/14 01:31:19 laffer1 Exp $
# $FreeBSD: ports/lang/clang/Makefile,v 1.14 2010/10/14 19:29:22 brooks Exp $

PORTNAME=	clang
PORTVERSION=	3.2
PORTREVISION=	0
CATEGORIES=	lang devel
MASTER_SITES=	http://llvm.org/releases/${PORTVERSION}/
DISTNAME=	${PORTNAME}-${PORTVERSION}.src
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${LLVM_SOURCE}
EXTRACT_ONLY=	${LLVM_SOURCE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C, Objective-C, and C++ compiler
LICENSE=	agg

CONFLICTS=	clang-devel-[23]* clang31-*

CLANG_NAME=	clang-${PORTVERSION}.src
CLANG_SOURCE=	${CLANG_NAME}${EXTRACT_SUFX}
LLVM_NAME=	llvm-${PORTVERSION}.src
LLVM_SOURCE=	${LLVM_NAME}${EXTRACT_SUFX}

WRKSRC=		${WRKDIR}/${LLVM_NAME}
BUILD_WRKSRC=	${WRKSRC}/tools/clang
INSTALL_WRKSRC=	${WRKSRC}/tools/clang

BUILD_DEPENDS+=	llvm>=${PORTVERSION}:${PORTSDIR}/devel/llvm
RUN_DEPENDS+=	llvm>=${PORTVERSION}:${PORTSDIR}/devel/llvm
.if defined(PACKAGE_BUILDING) || defined(MAINTAINER_MODE)
BUILD_DEPENDS+=	runtest:${PORTSDIR}/misc/dejagnu
.endif
.if defined(MAINTAINER_MODE)
BUILD_DEPENDS+=	f2c:${PORTSDIR}/lang/f2c
.endif

GNU_CONFIGURE=	yes
USE_GCC=	4.2+
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_PERL5=	yes
USE_PYTHON=	yes
MAKE_JOBS_SAFE=	yes

MAKE_ARGS=	CLANG_TBLGEN=${WRKSRC}/${RELTYPE}/bin/clang-tblgen \
		LLVMIncDir=${LOCALBASE}/include \
		LLVMToolDir=${LOCALBASE}/bin \
		LLVMLibDir=${LOCALBASE}/lib

OPTIONS_DEFINE=	ASSERTS DOCS

ASSERTS_DESC=	Enable assertions (thread unsafe)

MAN1=		clang.1

PLIST_SUB+=		PORTVERSION=${PORTVERSION}

.include <bsd.mport.options.mk>

.if defined(MAINTAINER_MODE)
CONFIGURE_ARGS+=	--with-f2c=${LOCALBASE}
.else
CONFIGURE_ARGS+=	--enable-optimized
.endif

.if ${PORT_OPTIONS:MDOCS}
CONFIGURE_ARGS+=	--enable-docs
.else
CONFIGURE_ARGS+=	--disable-docs
.endif

.if ${PORT_OPTIONS:MASSERTS}
CONFIGURE_ARGS+=	--enable-assertions
RELTYPE=		Release+Asserts
.else
CONFIGURE_ARGS+=	--disable-assertions
RELTYPE=		Release
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
BROKEN=		Does not compile on sparc64
.endif

post-extract:
	cd ${WRKSRC}/tools && \
	    tar xf ${DISTDIR}/${CLANG_SOURCE} && \
	    ${MV} ${CLANG_NAME} clang

post-patch:
	${REINPLACE_CMD} -e 's|${PORTVERSION}svn|${PORTVERSION}|g' \
	    ${WRKSRC}/configure
	${REINPLACE_CMD} -e 's|\(PROJ_docsdir.*:=\).*$$|\1${DOCSDIR}|g' \
	    ${WRKSRC}/Makefile.config.in
	${REINPLACE_CMD} -e 's|\(PROJ_mandir.*:=\).*$$|\1${MANPREFIX}/man|g' \
	    ${WRKSRC}/Makefile.config.in
	${REINPLACE_CMD} -e 's|/usr/bin/env perl|${PERL}|' \
	    -e 's|%%DATADIR%%|${DATADIR}|' \
	    ${WRKSRC}/tools/clang/tools/scan-build/ccc-analyzer \
	    ${WRKSRC}/tools/clang/tools/scan-build/c++-analyzer \
	    ${WRKSRC}/tools/clang/tools/scan-build/scan-build
	${REINPLACE_CMD} -e 's|/usr/bin/env python|${PYTHON_CMD}|' \
	    ${WRKSRC}/tools/clang/tools/scan-view/scan-view

pre-build:
	${LN} -sf ${LOCALBASE}/include/llvm/Intrinsics.gen ${WRKSRC}/include/llvm/
	${MKDIR} ${WRKSRC}/${RELTYPE}/lib
	${LN} -sf ${LOCALBASE}/lib/libLLVM-${PORTVERSION}.so ${WRKSRC}/${RELTYPE}/lib/
	${LN} -sf ${LOCALBASE}/lib/libLLVMTableGen.a ${WRKSRC}/${RELTYPE}/lib/
	${LN} -sf ${LOCALBASE}/lib/libLLVMSupport.a ${WRKSRC}/${RELTYPE}/lib/
	cd ${WRKSRC}/utils/unittest && ${GMAKE}

post-build:
	@cd ${WRKSRC}/tools/clang/docs/tools && ${GMAKE} clang.1

post-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/tools/clang/tools/scan-build/ccc-analyzer \
		${WRKSRC}/tools/clang/tools/scan-build/c++-analyzer \
		${WRKSRC}/tools/clang/tools/scan-build/scan-build \
		${WRKSRC}/tools/clang/tools/scan-view/scan-view \
	    ${PREFIX}/bin
	@${MKDIR} ${PYTHONPREFIX_SITELIBDIR}
	@${MKDIR} ${PYTHONPREFIX_SITELIBDIR}/Resources
	@${INSTALL_SCRIPT} ${WRKSRC}/tools/clang/tools/scan-view/*.py \
	    ${PYTHONPREFIX_SITELIBDIR}
	@${INSTALL_SCRIPT} ${WRKSRC}/tools/clang/tools/scan-view/Resources/* \
	    ${PYTHONPREFIX_SITELIBDIR}/Resources
	@${MKDIR} ${DATADIR}
	@${INSTALL_DATA} ${WRKSRC}/tools/clang/tools/scan-build/scanview.css ${DATADIR}
	@${INSTALL_DATA} ${WRKSRC}/tools/clang/tools/scan-build/sorttable.js ${DATADIR}
	@${INSTALL_MAN} ${WRKSRC}/tools/clang/docs/tools/clang.1 \
	    ${MANPREFIX}/man/man1/

TEST_CMD=	'(cd ${WRKSRC}/test; ${SETENV} ${MAKE_ENV} ${GMAKE} check)'
regression-test: ${BUILD_COOKIE}
	if [ `${ID} -u` = 0 ]; then \
		${CHOWN} -R nobody ${WRKSRC}/test; \
		su -m nobody -c ${TEST_CMD}; \
	else \
		${SH} -c ${TEST_CMD}; \
	fi

PLIST_FILE_LIST=	bin/ccc-analyzer \
			bin/c++-analyzer \
			bin/clang \
			bin/clang++ \
			bin/clang-check \
			bin/clang-tblgen \
			bin/c-index-test \
			bin/scan-build \
			bin/scan-view \
			lib/libclang*
PLIST_DIR_LIST=		include/clang \
			include/clang-c \
			lib/clang
PLIST_PYFILE_LIST=	ScanView.py \
			Reporter.py \
			Resources/* \
			startfile.py
PLIST_PYDIR_LIST=	Resources

build-plist:
	${RM} -f ${PLIST}
	cd ${PREFIX} && \
	    (ls ${PLIST_FILE_LIST}; ${FIND} ${PLIST_DIR_LIST} -type f) | \
	     ${SED} -e 's|${PORTVERSION}|%%PORTVERSION%%|' | ${SORT} >> ${PLIST}
	${FIND} ${DATADIR} ${DOCSDIR} -type f | \
	    ${SED} -e 's|${DATADIR}|%%DATADIR%%|' \
	     -e 's|${DOCSDIR}|%%PORTDOCS%%%%DOCSDIR%%|' | ${SORT} >> ${PLIST}
	cd ${PYTHONPREFIX_SITELIBDIR} && \
	    ls ${PLIST_PYFILE_LIST} | ${SORT} | \
	    ${SED} -e 's|^|%%PYTHON_SITELIBDIR%%/|' >> ${PLIST}
	cd ${PREFIX} && \
	    ${FIND} ${PLIST_DIR_LIST} -type d | \
	    ${SED} -e 's|${PORTVERSION}|%%PORTVERSION%%|' | \
	    ${SORT} -r | ${SED} -e 's|^|@dirrm |' >> ${PLIST}
	cd ${PYTHONPREFIX_SITELIBDIR} && \
	    ${FIND} ${PLIST_PYDIR_LIST} -type d | ${SORT} -r | \
	    ${SED} -e 's|^|@dirrm %%PYTHON_SITELIBDIR%%/|' >> ${PLIST}
	${FIND} ${DATADIR} ${DOCSDIR} -type d | ${SORT} -r | \
	    ${SED} -e 's|${DATADIR}|@dirrm %%DATADIR%%|' \
	     -e 's|${DOCSDIR}|%%PORTDOCS%%@dirrm %%DOCSDIR%%|' >> ${PLIST}

.include <bsd.port.post.mk>
