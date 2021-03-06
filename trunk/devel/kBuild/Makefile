# $MidnightBSD$

PORTNAME=	kBuild
DISTVERSION=	${KBUILD_VERSION}
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.netlabs.org/pub/kbuild/ \
		http://tmp.chruetertee.ch/ \
		http://disasterarea.chruetertee.ch/
DISTNAME=	${PORTNAME}-${DISTVERSION}r2695-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Makefile framework
LICENSE=	gpl3

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:${PORTSDIR}/textproc/flex

USES=		autoreconf:build gmake makeinfo

CONFLICTS_INSTALL=	kBuild-devel-[0-9]*

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

KBUILD_VERSION=	0.1.9998
KBUILD_ARCH=	${MACHINE_ARCH:S/i386/x86/:S/x86_64/amd64/}
KBUILD_ENV=	ACLOCAL=${ACLOCAL} \
		AUTOMAKE=${AUTOMAKE} \
		AUTORECONF=${AUTORECONF} \
		AUTOPOINT=true
USE_GCC=	any
KBUILD_TARGET=	${OPSYS:tl}

KBUILD_BINS=	kDepIDB kDepPre kObjCache kmk kmk_append kmk_ash kmk_cat \
		kmk_chmod kmk_cmp kmk_cp kmk_echo kmk_expr kmk_gmake \
		kmk_install kmk_ln kmk_md5sum kmk_mkdir kmk_mv kmk_printf \
		kmk_redirect kmk_rm kmk_rmdir kmk_sed kmk_sleep kmk_test kmk_time
PORTDOCS=	QuickReference-kmk.html \
		QuickReference-kmk.txt

# bmake doesn't know about unsetenv=true
.if defined(.PARSEDIR)
ENV=
.export ENV
.else
.SHELL:		path="/bin/sh" unsetenv=true
.endif

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-patch:
	${REINPLACE_CMD} -e '11269d;11274d' ${WRKSRC}/src/sed/configure
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' ${WRKSRC}/Config.kmk
	for f in ${WRKSRC}/kBuild/tools/*.kmk; do \
		${REINPLACE_CMD} -e 's|gcc|${CC}|g' $$f ; \
	done

do-build:
	cd ${WRKSRC} && ${SETENV} ${KBUILD_ENV} ./kBuild/env.sh --full ${MAKE_CMD} -f bootstrap.gmk
	cd ${WRKSRC} && ${RM} -rf out
	cd ${WRKSRC} && ./kBuild/env.sh kmk
	cd ${WRKSRC} && ./kBuild/env.sh kmk NIX_INSTALL_DIR=${PREFIX} BUILD_TYPE=release -C ${WRKSRC}

do-install:
.for bin in ${KBUILD_BINS}
	${INSTALL_PROGRAM} ${WRKSRC}/out/freebsd.${KBUILD_ARCH}/release/stage${TRUE_PREFIX}/bin/${bin} ${PREFIX}/bin
.endfor
	${MKDIR} ${DATADIR}
	(cd ${WRKSRC}/out/freebsd.${KBUILD_ARCH}/release/stage${TRUE_PREFIX}/share/kBuild && ${COPYTREE_SHARE} \* ${DATADIR})
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/out/freebsd.${KBUILD_ARCH}/release/stage${TRUE_PREFIX}/share/doc/${PORTNAME}-${KBUILD_VERSION}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
