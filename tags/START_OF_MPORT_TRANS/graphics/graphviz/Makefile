# New ports collection makefile for:	graphviz
# Date created:		03 Feb 1998
# Whom:			Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/graphviz/Makefile,v 1.71 2007/02/01 02:41:39 kris Exp $
#

PORTNAME=	graphviz
PORTVERSION=	2.8
CATEGORIES=	graphics tk84
MASTER_SITES=	http://www.graphviz.org/pub/graphviz/ARCHIVE/ \
		http://mirror.inerd.com/FreeBSD/distfiles/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph Visualization Software from AT&T and Bell Labs

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg		\
		png.5:${PORTSDIR}/graphics/png			\
		freetype.9:${PORTSDIR}/print/freetype2		\
		fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig	\
		tk84.1:${PORTSDIR}/x11-toolkits/tk84		\
		expat.6:${PORTSDIR}/textproc/expat2		\
		gd.4:${PORTSDIR}/graphics/gd

USE_TCL=	84
USE_TK=		84
USE_BISON=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
USE_XPM=	yes
USE_AUTOTOOLS=	libltdl:15 libtool:15
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include -I${LOCALBASE}/include -I${TCL_INCLUDEDIR} -I${TK_INCLUDEDIR}" \
		LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"	\
		TCLCONFIG=${TCL_LIBDIR}/tclConfig.sh		\
		TKCONFIG=${TK_LIBDIR}/tkConfig.sh		\
		MISSING=${TRUE}
CONFIGURE_ARGS=	--program-transform-name="s/x/x/"		\
		--enable-dependency-tracking			\
		--with-iconvlibdir=${LOCALBASE}/lib		\
		--with-tclsh=${TCLSH}				\
		--with-wish=${WISH}				\
		--with-fontconfigincludedir=${X11BASE}/include	\
		--with-fontconfiglibdir=${X11BASE}/lib		\
		--disable-swig --disable-sharp --disable-guile	\
		--disable-io --disable-lua --disable-ocaml	\
		--disable-perl --disable-php --disable-python	\
		--disable-ruby 
#		--build=${arch}-portbld-freebsd6.0 \
#		--target=${arch}-portbld-freebsd6.0
MAKE_ENV=	EXPR_COMPAT=yes MISSING=${TRUE}

MAN1=		acyclic.1 bcomps.1 ccomps.1 dijkstra.1 dot.1		 \
		dotty.1 gc.1 gvcolor.1 gvpack.1 gvpr.1 gxl2dot.1 lefty.1 \
		lneato.1 nop.1 prune.1 sccmap.1 tred.1 unflatten.1
MAN3=		agraph.3 cdt.3 expr.3 graph.3 pack.3 pathplan.3
MANN=		gdtclft.n tcldot.n tkspline.n
MLINKS=		dot.1 circo.1		\
		gxl2dot.1 dot2gxl.1	\
		dot.1 fdp.1		\
		dot.1 neato.1		\
		dot.1 twopi.1

PATCH_TCL_SCRIPTS=	tclpkg/gv/Makefile.in tclpkg/tcldot/demo/doted \
			tclpkg/tclpathplan/demo/pathplan tclpkg/tkspline/demo/spline
PATCH_TK_SCRIPTS=	${PATCH_TCL_SCRIPTS}

PDOCS_TXT=	AUTHORS NEWS ChangeLog cpl1.0.txt doc/Dot.ref doc/latex_suggestions.txt
PDOCS_PDF=	doc/*.pdf */*/*.pdf
PDOCS_HTML=	doc/*.html doc/info/*.html doc/info/*.gif

INSTALLS_SHLIB=	yes
LDCONFIG_DIRS=	%%PREFIX%%/lib/${PORTNAME}
USE_LDCONFIG=	${PREFIX}/lib/${PORTNAME}

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/misc/ldconfig_compat/bsd.ldconfig.mk"

pre-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS}					\
	  ${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|'	\
	                   -e "s|\([^:]*:.*\) install-pdfDATA\(.*\)|\1\2|g"		\
	                   -e "s|\([^:]*:.*\) install-htmlDATA\(.*\)|\1\2|g"		\
	                   -e "s|\([^:]*:.*\) install-txtDATA\(.*\)|\1\2|g"		\
	                   -e "s|\([^:]*:.*\) install-demoDATA\(.*\)|\1\2|g"		\
	                   -e "s|\([^:]*:.*\) install-demoSCRIPTS\(.*\)|\1\2|g"		\
	                   -e "s|\([^:]*:.*\) install-pathplanexampleDATA\(.*\)|\1\2|g" \
	                   -e 's|demodir = $$(pkgdatadir)/demo|demodir = ${EXAMPLESDIR}|';

	@${REINPLACE_CMD} -e 's|^\.SUFFIXES: \(.*\)\.1\(.*\)|.SUFFIXES: \1 \2|'	\
	                  ${WRKSRC}/cmd/tools/Makefile.in			\
	                  ${WRKSRC}/cmd/gvpr/Makefile.in

.if ${OSVERSION} < 500000
	@${REINPLACE_CMD} 's|-Wno-unused-parameter||g' ${WRKSRC}/configure
.endif

post-install-script:
	${INSTALL_MAN} ${WRKSRC}/tclpkg/gdtclft/gdtclft.n   ${MANNPREFIX}/man/mann
	${INSTALL_MAN} ${WRKSRC}/tclpkg/tcldot/tcldot.n     ${MANNPREFIX}/man/mann
	${INSTALL_MAN} ${WRKSRC}/tclpkg/tkspline/tkspline.n ${MANNPREFIX}/man/mann

post-install: install-ldconfig-file
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/html
	@${MKDIR} ${DOCSDIR}/pdf
	cd ${WRKSRC} && ${INSTALL_DATA} ${PDOCS_TXT} ${DOCSDIR}		\
	             && ${INSTALL_DATA} ${PDOCS_PDF} ${DOCSDIR}/pdf	\
	             && ${INSTALL_DATA} ${PDOCS_HTML} ${DOCSDIR}/html

.	for i in neato.pdf twopi.pdf fdp.pdf circo.pdf
		cd ${DOCSDIR}/pdf && ${LN} -fs dot.pdf ${i}
.	endfor
	cd ${DOCSDIR}/pdf && ${LN} -fs gxl2dot.pdf dot2gxl.pdf
.endif

	@${ECHO_MSG} "Installing demo data..."
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT}  ${WRKSRC}/tclpkg/gdtclft/demo/entities        ${EXAMPLESDIR}
	${INSTALL_DATA}    ${WRKSRC}/tclpkg/gdtclft/demo/entities.README ${EXAMPLESDIR}

	${INSTALL_SCRIPT}  ${WRKSRC}/tclpkg/tcldot/demo/doted            ${EXAMPLESDIR}
	${INSTALL_DATA}    ${WRKSRC}/tclpkg/tcldot/demo/doted.README     ${EXAMPLESDIR}

	${INSTALL_SCRIPT}  ${WRKSRC}/tclpkg/tcldot/demo/gcat             ${EXAMPLESDIR}
	${INSTALL_DATA}    ${WRKSRC}/tclpkg/tcldot/demo/gcat.README      ${EXAMPLESDIR}

	@${MKDIR} ${EXAMPLESDIR}/pathplan_data
	${INSTALL_SCRIPT}  ${WRKSRC}/tclpkg/tclpathplan/demo/pathplan	 ${EXAMPLESDIR}
	${INSTALL_DATA}    ${WRKSRC}/tclpkg/tclpathplan/demo/pathplan.README ${EXAMPLESDIR}
	${INSTALL_DATA}    ${WRKSRC}/tclpkg/tclpathplan/demo/pathplan_data/*.dat \
	                   ${EXAMPLESDIR}/pathplan_data

	${INSTALL_SCRIPT}  ${WRKSRC}/tclpkg/tkspline/demo/spline	 ${EXAMPLESDIR}
	${INSTALL_DATA}    ${WRKSRC}/tclpkg/tkspline/demo/spline.README	 ${EXAMPLESDIR}

.include <bsd.port.post.mk>
