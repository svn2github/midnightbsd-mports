# $MidnightBSD: mports/devel/kBuild/Makefile,v 1.2 2009/06/04 03:30:29 laffer1 Exp $

PORTNAME=	kBuild
PORTVERSION=	0.1.5
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.netlabs.org/pub/kbuild/
DISTNAME=	${PORTNAME}-${PORTVERSION}-p1-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Makefile framework
LICENSE=	gpl3

BUILD_DEPENDS=	gsed:${PORTSDIR}/textproc/gsed

CONFIGURE_TARGET= --build=${ARCH}-portbld-freebsd7.0 \
		  --host=${ARCH}-portbld-freebsd7.0 \
		  --target=${ARCH}-portbld-freebsd7.0
USE_AUTOTOOLS=	automake:19 autoconf:262
USE_GMAKE=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}-p1

KBUILD_ARCH=	${MACHINE_ARCH:S/i386/x86/}
KBUILD_ENV=	ACLOCAL=${ACLOCAL} \
		AUTOMAKE=${AUTOMAKE} \
		AUTORECONF=${AUTORECONF} \
		AUTOPOINT=true

KBUILD_BINS=	kDepIDB kDepPre kObjCache kmk kmk_append kmk_ash kmk_cat \
		kmk_chmod kmk_cmp kmk_cp kmk_echo kmk_expr kmk_gmake \
		kmk_install kmk_ln kmk_md5sum kmk_mkdir kmk_mv kmk_printf \
		kmk_redirect kmk_rm kmk_rmdir kmk_sed kmk_sleep kmk_test kmk_time
PORTDOCS=	QuickReference-kmk.html \
		QuickReference-kmk.txt

post-patch:
	${REINPLACE_CMD} -e '11269d;11274d' ${WRKSRC}/src/sed/configure
	${REINPLACE_CMD} -e '11268,11273s|sed|gsed|' ${WRKSRC}/src/sed/configure

# Override autotools
run-autotools:
do-configure:

do-build:
	cd ${WRKSRC} && ${SETENV} ${KBUILD_ENV} ./kBuild/env.sh --full ${GMAKE} -f bootstrap.gmk
	cd ${WRKSRC} && ${RM} -rf out
	cd ${WRKSRC} && ./kBuild/env.sh kmk
	cd ${WRKSRC} && ./kBuild/env.sh kmk NIX_INSTALL_DIR=${PREFIX} BUILD_TYPE=release -C ${WRKSRC}

do-install:
.for bin in ${KBUILD_BINS}
	${INSTALL_PROGRAM} ${WRKSRC}/out/freebsd.${KBUILD_ARCH}/release${TRUE_PREFIX}/bin/${bin} ${PREFIX}/bin
.endfor
	${MKDIR) ${DATADIR}
	(cd ${WRKSRC}/out/freebsd.${KBUILD_ARCH}/release${TRUE_PREFIX}/share/kBuild && ${COPYTREE_SHARE} \* ${DATADIR})
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/out/freebsd.${KBUILD_ARCH}/release${TRUE_PREFIX}/share/doc/${PORTNAME}-${PORTVERSION}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
