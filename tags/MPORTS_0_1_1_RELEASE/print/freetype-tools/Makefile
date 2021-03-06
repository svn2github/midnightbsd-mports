# New ports collection makefile for:	print/freetype-tools
# Date created:				Jul 29, 2005
# Whom:					rafan@infor.org
#
# $MidnightBSD$
# $FreeBSD: ports/print/freetype-tools/Makefile,v 1.8 2006/11/13 13:28:02 rafan Exp $
#

PORTNAME=	freetype-tools
PORTVERSION=	1.3.1
PORTREVISION=	4
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:S,%SUBDIR%,freetype,} \
		http://sunsite.cnlab-switch.ch/ftp/mirror/freetype/%SUBDIR%/ \
		http://www.funet.fi/pub/mirrors/ftp.freetype.org/%SUBDIR%/ \
		http://ftp.sunet.se/pub/text-processing/freetype/%SUBDIR%/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/freetype/&,} \
		ftp://ftp.freetype.org/freetype/%SUBDIR%/
MASTER_SITE_SUBDIR=	freetype1
DISTNAME=	freetype-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for FreeType 1

LIB_DEPENDS=	ttf.4:${PORTSDIR}/print/freetype
RUN_DEPENDS=	${LOCALBASE}/lib/libkpathsea.a:${PORTSDIR}/print/teTeX-base \
		t1asm:${PORTSDIR}/print/t1utils
BUILD_DEPENDS=	${RUN_DEPENDS}

USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ARGS=	--disable-nls --enable-static --enable-shared

TEXMFMAIN=	${TARGETDIR}/share/texmf

MAN1=		ttf2bdf.1 ttf2tfm.1 ttf2pk.1

post-patch:
	@${REINPLACE_CMD} -e 's|$${CONFIG_SHELL-/bin/sh} $$ac_aux_dir|$$ac_aux_dir|' \
		${WRKSRC}/configure
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|LIBTOOL =.*|LIBTOOL = ${LIBTOOL}|'
	@${FIND} ${WRKSRC} -name '*.orig' -delete
	@${REINPLACE_CMD} -e 's|^PROGRAMS = t1asm|PROGRAMS =|' \
		${WRKSRC}/contrib/ttf2pfb/Makefile.in

post-build:
	@cd ${WRKSRC}/contrib/ttf2bdf && ./configure --prefix=${TARGETDIR} && ${GMAKE}
	@cd ${WRKSRC}/contrib/ttf2pfb && ./configure --prefix=${TARGETDIR} && ${GMAKE}
	@cd ${WRKSRC}/contrib/ttf2pk && ./configure --prefix=${TARGETDIR} --with-kpathsea-dir=${LOCALBASE} && ${GMAKE}
	@cd ${WRKSRC}/contrib/ttfbanner && ./configure --prefix=${TARGETDIR} && ${GMAKE}

do-install:
	@cd ${WRKSRC}/contrib/ttf2bdf && ${GMAKE} install
	@cd ${WRKSRC}/contrib/ttf2pfb && ${GMAKE} install
	@cd ${WRKSRC}/contrib/ttf2pk && ${GMAKE} install
	@cd ${WRKSRC}/contrib/ttfbanner && ${GMAKE} install
	@${MKDIR} ${TEXMFMAIN}/ttf2pk
	@for f in ${WRKSRC}/contrib/ttf2pk/data/*; do \
	  ${INSTALL_DATA} $$f ${TEXMFMAIN}/ttf2pk; \
	done
	@${LN} -fs ${TEXMFMAIN}/ttf2pk ${TEXMFMAIN}/ttf2tfm

.include <bsd.port.mk>
