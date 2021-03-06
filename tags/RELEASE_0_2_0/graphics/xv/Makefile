# New ports collection makefile for:	xv
# Date created:		30 October 1994
# Whom:			smace
#
# $FreeBSD: ports/graphics/xv/Makefile,v 1.67 2006/09/05 06:06:53 dinoex Exp $
# $MidnightBSD: mports/graphics/xv/Makefile,v 1.2 2007/10/31 04:16:32 laffer1 Exp $
#

PORTNAME=	xv
PORTVERSION=	3.10a
PORTREVISION=	8
CATEGORIES+=	graphics
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	../distfiles/xv
# Workaround: pdf.patch, mp-tiff-patch, and xv-png-1.2d.patch must be fetched
#		from MASTER_SITE_LOCAL.
#		These are modified for applying after jp-extension-patch.
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${PORTNAME}${PORTVERSION:S/.//}-jp-extension-rev5.3.3.tar.gz \
		jp-ext-bzip2-1.1.patch longname.patch pdf.patch mp-tiff-patch \
		xv-png-1.2d.patch xvpng-1.2d-fix3.patch
DIST_SUBDIR=	${PORTNAME}
EXTRACT_ONLY=	${DISTFILES:N*patch}

# Note: xpm.patch appears to already be in xvdir.c
PATCHFILES=	${DISTNAME}.JPEG-patch ${DISTNAME}.TIFF-patch \
		croppad.patch grabpatch vispatch \
		deepcolor.patch gifpatch exceed_grab.patch \
		tiff1200.patch gssafer.patch

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	An X11 program that displays images of various formats
LICENSE=	restricted
# non commericial use only

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		tiff.4:${PORTSDIR}/graphics/tiff \
		png.5:${PORTSDIR}/graphics/png

USE_XORG=	xext x11 xt
USE_IMAKE=	yes
USE_PERL5_BUILD=yes
.if !defined(NOMAN)
MAN1=		bggen.1 vdcomp.1 xcmap.1 xv.1 xvp2p.1
.endif

XVDIST=		${DISTDIR}/${DIST_SUBDIR}

pre-patch:
	@${PATCH} ${PATCH_ARGS} -p1 < ${WRKDIR}/xv-jp-extension/Patch.xv310a-ext-5.3.3

post-patch:
	${PATCH} ${PATCH_ARGS} -p1 < ${XVDIST}/longname.patch
	${PATCH} ${PATCH_ARGS} -p1 < ${XVDIST}/pdf.patch
	${PATCH} ${PATCH_ARGS} -p0 < ${XVDIST}/mp-tiff-patch
	${PATCH} ${PATCH_ARGS} -p1 < ${XVDIST}/xv-png-1.2d.patch
	${PATCH} ${PATCH_ARGS} -p0 < ${XVDIST}/xvpng-1.2d-fix3.patch
	${PATCH} ${PATCH_ARGS} -p1 < ${XVDIST}/jp-ext-bzip2-1.1.patch
	@${MV} ${WRKSRC}/config.h ${WRKSRC}/config.h.in
	@${CAT} ${WRKSRC}/config.h.in | \
		${SED} -e "s@%%LOCALBASE%%@${LOCALBASE}@" > ${WRKSRC}/config.h
.for i in ${MAN1}
	@${CP} ${WRKSRC}/docs/${i:R}.man ${WRKSRC}
.endfor
.if defined(NOMAN)
	${PERL} -pi.orig -e 's,^InstallManPage.*$$,/\* $$& \*/,' ${WRKSRC}/Imakefile
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README.PNG ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/docs/epsf.ps ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/docs/xpm.ps ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/docs/xvdocs.ps ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/docs/xvtitle.ps ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/docs/help ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/docs/bmp.doc ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/docs/gif* ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/../xv-jp-extension/CHANGELOG.* ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/../xv-jp-extension/README.PhotoCD ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/../xv-jp-extension/README.xv310a-ext-5.3.3 ${DOCSDIR}/README.xv310a-ext-5.3.3.ja
	@${INSTALL_DATA} ${WRKSRC}/../xv-jp-extension/magic.add ${DOCSDIR}
.endif

.include <bsd.port.mk>
