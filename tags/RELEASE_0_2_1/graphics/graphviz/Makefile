# New ports collection makefile for:	graphviz
# Date created:		03 Feb 1998
# Whom:			Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/graphics/graphviz/Makefile,v 1.8 2008/08/12 16:14:45 laffer1 Exp $
# $FreeBSD: ports/graphics/graphviz/Makefile,v 1.101 2008/06/25 14:24:20 dinoex Exp $
#

PORTNAME=	graphviz
PORTVERSION=	2.20.2
PORTREVISION=	0
CATEGORIES=	graphics tk
MASTER_SITES=	http://www.graphviz.org/pub/graphviz/ARCHIVE/ \
		http://mirror.inerd.com/FreeBSD/distfiles/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph Visualization Software from AT&T and Bell Labs
LICENSE=	other

BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash
LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png \
		freetype.9:${PORTSDIR}/print/freetype2 \
		fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig \
		expat.6:${PORTSDIR}/textproc/expat2 \
		gd.4:${PORTSDIR}/graphics/gd

USE_BISON=	build
USE_GMAKE=	yes
USE_AUTOTOOLS=	libltdl:15 libtool:15
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
LDFLAGS+=	-L${LOCALBASE}/lib
CPPFLAGS+=	-I${LOCALBASE}/include
PLIST_SUB=	PORTVERSION="${PORTVERSION}"

MAKE_ENV=	EXPR_COMPAT=yes MISSING=${TRUE} @LIBICONV@=-liconv
SUB_FILES=	pkg-install
MAN1=		acyclic.1 bcomps.1 ccomps.1 dijkstra.1 dot.1 \
		dotty.1 gc.1 gvcolor.1 gvpack.1 gvpr.1 gxl2dot.1 \
		lneato.1 nop.1 prune.1 sccmap.1 tred.1 unflatten.1
MAN3=		agraph.3 cdt.3 cgraph.3 graph.3 gvc.3 pathplan.3
MAN7=		graphviz.7
MLINKS=		dot.1 circo.1 \
		gxl2dot.1 dot2gxl.1 \
		dot.1 fdp.1 \
		dot.1 neato.1 \
		dot.1 twopi.1
FIX_INCLUDE=	ast_common.h \
		lib/cdt/dthdr.h \
		lib/graph/libgraph.h lib/graph/triefa.h \
		lib/graph/parser.h lib/graph/agxbuf.h \
		lib/agraph/aghdr.h lib/agraph/agraph.h \
		lib/agraph/malloc.h lib/agraph/vmstub.h \
		lib/agraph/grammar.h \
		lib/pathplan/tri.h lib/pathplan/pathplan.h \
		lib/pathplan/pathutil.h lib/pathplan/solvers.h \
		lib/pathplan/vis.h lib/pathplan/vispath.h \
		lib/common/arith.h lib/common/logic.h \
		lib/common/globals.h \
		lib/gvc/gvcint.h

PATCH_TCL_SCRIPTS=	tclpkg/gv/Makefile.in tclpkg/tcldot/demo/doted.tcl \
			tclpkg/tclpathplan/demo/pathplan.tcl tclpkg/tkspline/demo/spline.tcl
PATCH_TK_SCRIPTS=	${PATCH_TCL_SCRIPTS}

PDOCS_TXT=	AUTHORS NEWS ChangeLog cpl1.0.txt doc/Dot.ref doc/latex_suggestions.txt
PDOCS_PDF=	doc/*.pdf */*/*.pdf
PDOCS_HTML=	doc/*.html doc/info/*.html doc/info/*.gif

OPTIONS=	XPM "Build with XPM support" on \
		DIGCOLA "DIGCOLA features in neato layout engine" on \
		IPSEPCOLA "IPSEPCOLA features in neato layout engine" on \
		SMYRNA "SMYRNA large graph viewer" off \
		NLS "Build with gettext support" on \
		TK "Build with TK support" off \
		PANGOCAIRO "build with pangocairo support" off \
		RSVG "build with rsvg library" off \
		GTK "build with gtk plugin" off \
		GDK_PIXBUF  "build with gdk pixbuf support" off \
		GNOMEUI  "build with libgnomeui support" off \
		MING "Build with ming plugin" off \
		DEVIL "Build with devil plugin" off \
		PERL "Perl bindings (swig)" off \
		PHP "PHP bindings (swig)" off \
		PYTHON "Python bindings (swig)" off \
		RUBY "Ruby bindings (swig)" off \
		LUA "Lua bindings (swig)" off \
		TCL "TCL bindings (swig)" off \
		GUILE "Guile bindings (swig)" off

.include <bsd.port.pre.mk>

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0 \
			--host=${ARCH}-portbld-freebsd6.0 \
			--target=${ARCH}-portbld-freebsd6.0

CONFIGURE_ARGS+=	--program-transform-name="s/x/x/" \
		--enable-dependency-tracking \
		--enable-r=no \
		--with-freetype2=yes \
		--with-libgd \
		--with-fontconfigincludedir=${LOCALBASE}/include \
		--with-fontconfiglibdir=${LOCALBASE}/lib \
		--disable-io --disable-ocaml --disable-java \
		--disable-sharp

CONFIGURE_ENV+=	CFLAGS="${CFLAGS}" \
		CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		MISSING=${TRUE}

.if defined(WITH_TK)
CPPFLAGS+=		-I${TK_INCLUDEDIR}
USE_TK_BUILD=		84+
CONFIGURE_ARGS+=	--with-wish=${WISH}
CONFIGURE_ENV+=		TKCONFIG="${TK_LIBDIR}/tkConfig.sh"
MANN+=			tkspline.n
PLIST_SUB+=		WITH_TK=""
.else
PLIST_SUB+=		WITH_TK="@comment "
.endif
.if defined(WITH_TCL) || defined(WITH_TK)
CPPFLAGS+=		-I${TCL_INCLUDEDIR}
USE_TCL_BUILD=		84+
.include "${PORTSDIR}/Mk/bsd.tcl.mk"
CONFIGURE_ARGS+=	--with-tclsh=${TCLSH}
CONFIGURE_ENV+=		TCLCONFIG="${TCL_LIBDIR}/tclConfig.sh"
MANN+=			gdtclft.n tcldot.n
PLIST_SUB+=		TCL_VER="${TCL_VER}"
.endif

USE_ICONV=		yes
CONFIGURE_ARGS+=	--with-iconvlibdir=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-iconvincludedir=${LOCALBASE}/include

.if !defined(WITHOUT_XPM) || exists(${LOCALBASE}/lib/libXpm.so)
USE_XORG+=		xaw8 xpm xmu xt sm ice xext x11 xau xdmcp xp
MAN1+=			lefty.1
PLIST_SUB+=		WITH_XPM=""
.else
PLIST_SUB+=		WITH_XPM="@comment "
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
.else
USE_GETTEXT=		yes
.endif

.if defined(WITH_PANGOCAIRO)
CONFIGURE_ARGS+=	--with-pangocairo
PLIST_SUB+=		WITH_PANGOCAIRO=""
USE_GNOME=		pango
USE_XORG+=		xrender x11 xau xdmcp
.else
CONFIGURE_ARGS+=	--without-pangocairo
PLIST_SUB+=		WITH_PANGOCAIRO="@comment "
.endif

.if defined(WITH_RSVG)
CONFIGURE_ARGS+=	--with-rsvg=yes
PLIST_SUB+=		WITH_RSVG=""
USE_GNOME+=		librsvg2
USE_GL+=		gl glu
.if !defined(WITH_PANGOCAIRO)
IGNORE=			option WITH_PANGOCAIRO is required for option WITH_RSVG
.endif
.else
CONFIGURE_ARGS+=	--without-rsvg
PLIST_SUB+=		WITH_RSVG="@comment "
.endif

.if defined(WITH_GTK)
CONFIGURE_ARGS+=	--with-gtk
PLIST_SUB+=		WITH_GTK=""
USE_GNOME+=		gtk20
USE_XORG+=		sm ice xext xinerama xi xrandr xcursor xfixes
.if !defined(WITH_PANGOCAIRO)
IGNORE=			option WITH_PANGOCAIRO is required for option WITH_GTK
.endif
.else
CONFIGURE_ARGS+=	--without-gtk --without-gdk-pixbuf
PLIST_SUB+=		WITH_GTK="@comment "
.endif

.if defined(WITH_GDK_PIXBUF)
CONFIGURE_ARGS+=	--with-gdk-pixbuf=yes
PLIST_SUB+=		WITH_PIXBUF=""
.if !defined(WITH_GTK)
IGNORE=			option WITH_GTK is required for option WITH_GDK_PIXBUF
.endif
.else
CONFIGURE_ARGS+=	--without-gdk-pixbuf
PLIST_SUB+=		WITH_PIXBUF="@comment "
.endif

.if defined(WITH_GNOMEUI)
CONFIGURE_ARGS+=	--with-gnomeui
USE_GNOME+=		libgnomeui
.if !defined(WITH_GTK)
IGNORE=			option WITH_GTK is required for option WITH_GNOMEUI
.endif
.else
CONFIGURE_ARGS+=	--without-gnomeui
.endif

.if defined(WITH_SMYRNA)
CONFIGURE_ARGS+=	--with-glade=yes
USE_GNOME+=		gnomelibs libglade2
.else
CONFIGURE_ARGS+=	--without-glade
.endif

.if defined(USE_GNOME)
.include "${PORTSDIR}/Mk/bsd.gnome.mk"
.endif
.if defined(USE_XORG)
.include "${PORTSDIR}/Mk/bsd.xorg.mk"
.endif

.if defined(WITH_SMYRNA)
CONFIGURE_ARGS+=	 --with-gtkgl=yes
LIB_DEPENDS+=		gtkgl-2.0.1:${PORTSDIR}/x11-toolkits/gtkglarea2
.else
CONFIGURE_ARGS+=	--without-gtkgl
.endif

.if defined(WITH_SMYRNA)
CONFIGURE_ARGS+=	 --with-gtkglext=yes
LIB_DEPENDS+=		gtkglext-x11-1.0:${PORTSDIR}/x11-toolkits/gtkglext
.else
CONFIGURE_ARGS+=	--without-gtkglext
.endif

.if defined(WITH_SMYRNA)
CONFIGURE_ARGS+=	 --with-gts=yes
LIB_DEPENDS+=		gts.5:${PORTSDIR}/graphics/gts
.else
CONFIGURE_ARGS+=	--without-gts
.endif

.if !defined(WITHOUT_DIGCOLA)
CONFIGURE_ARGS+=	--with-digcola
.else
CONFIGURE_ARGS+=	--without-digcola
.endif

.if !defined(WITHOUT_IPSEPCOLA)
CONFIGURE_ARGS+=	--with-ipsepcola
.if defined(WITHOUT_DIGCOLA)
IGNORE=			option WITH_DIGCOLA is required for option WITH_IPSEPCOLA
.endif
.else
CONFIGURE_ARGS+=	--without-ipsepcola
.endif

.if defined(WITH_SMYRNA)
CONFIGURE_ARGS+=	--with-smyrna=yes
PLIST_SUB+=		WITH_SMYRNA=""
.else
PLIST_SUB+=		WITH_SMYRNA="@comment "
CONFIGURE_ARGS+=	--without-smyrna
.endif

.if defined(WITH_MING)
CONFIGURE_ARGS+=	--with-ming
PLIST_SUB+=		WITH_MING=""
LIB_DEPENDS+=		ming.4:${PORTSDIR}/graphics/ming
.else
CONFIGURE_ARGS+=	--without-ming
PLIST_SUB+=		WITH_MING="@comment "
.endif

.if defined(WITH_DEVIL)
CONFIGURE_ARGS+=	--with-devil
PLIST_SUB+=		WITH_DEVIL=""
LIB_DEPENDS+=		IL.1:${PORTSDIR}/graphics/devil
.else
CONFIGURE_ARGS+=	--without-devil
PLIST_SUB+=		WITH_DEVIL="@comment "
.endif

.if defined(PACKAGE_BUILDING) || defined(WITH_PERL) || defined(WITH_PHP) || defined(WITH_PYTHON) || \
    defined(WITH_RUBY) || defined(WITH_LUA) || defined(WITH_TCL) || defined(WITH_GUILE)
BUILD_DEPENDS+=		swig1.3:${PORTSDIR}/devel/swig13
RUN_DEPENDS+=		swig1.3:${PORTSDIR}/devel/swig13
CONFIGURE_ARGS+=	--enable-swig
CONFIGURE_ENV+=		SWIG="${LOCALBASE}/bin/swig1.3"
.else
CONFIGURE_ARGS+=	--disable-swig
CONFIGURE_ENV+=		SWIG="/nonexistent"
.endif

.if defined(WITH_PERL) || defined(PACKAGE_BUILDING)
CONFIGURE_ARGS+=	--enable-perl
PLIST_SUB+=		WITH_PERL=""
USE_PERL5=	yes
MANN+=			gv_perl.n
.else
CONFIGURE_ARGS+=	--disable-perl
PLIST_SUB+=		WITH_PERL="@comment "
.endif

.if defined(WITH_PHP)
CONFIGURE_ARGS+=	--enable-php
PLIST_SUB+=		WITH_PHP=""
USE_PHP=	yes
USE_PHP_BUILD=	yes
CPPFLAGS+=		-I${LOCALBASE}/include/php/Zend
MANN+=			gv_php.n
.else
CONFIGURE_ARGS+=	--disable-php
PLIST_SUB+=		WITH_PHP="@comment "
.endif

.if defined(WITH_PYTHON)
CONFIGURE_ARGS+=	--enable-python
PLIST_SUB+=		WITH_PYTHON=""
USE_PYTHON_BUILD=	yes
.include "${PORTSDIR}/Mk/bsd.python.mk"
LDFLAGS+=		"-L${PYTHON_LIBDIR}"
MANN+=			gv_python.n
.else
CONFIGURE_ARGS+=	--disable-python
PLIST_SUB+=		WITH_PYTHON="@comment "
.endif

.if defined(WITH_RUBY)
CONFIGURE_ARGS+=	--enable-ruby
PLIST_SUB+=		WITH_RUBY=""
USE_RUBY=		yes
.include "${PORTSDIR}/Mk/bsd.ruby.mk"
MANN+=			gv_ruby.n
.else
CONFIGURE_ARGS+=	--disable-ruby
PLIST_SUB+=		WITH_RUBY="@comment "
.endif

.if defined(WITH_LUA)
CONFIGURE_ARGS+=	--enable-lua
PLIST_SUB+=		WITH_LUA=""
USE_LUA=		yes
.include "${PORTSDIR}/Mk/bsd.lua.mk"
CFLAGS+=		-I${LUA_INCDIR}
LDFLAGS+=		-L${LUA_LIBDIR} -lm
CONFIGURE_ENV+=		LUA="${LUA_BINDIR}/lua"
MANN+=			gv_lua.n
.else
CONFIGURE_ARGS+=	--disable-lua
PLIST_SUB+=		WITH_LUA="@comment "
.endif

.if defined(WITH_TCL)
CONFIGURE_ARGS+=	--enable-tcl
PLIST_SUB+=		WITH_TCL=""
MANN+=			gv_tcl.n
.else
CONFIGURE_ARGS+=	--disable-tcl
PLIST_SUB+=		WITH_TCL="@comment "
.endif

.if defined(WITH_GUILE)
CONFIGURE_ARGS+=	--enable-guile
PLIST_SUB+=		WITH_GUILE=""
LIB_DEPENDS+=		guile.18:${PORTSDIR}/lang/guile
MANN+=			gv_guile.n
.else
CONFIGURE_ARGS+=	--disable-guile
PLIST_SUB+=		WITH_GUILE="@comment "
.endif

pre-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | \
		${XARGS} ${REINPLACE_CMD} \
		-e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|' \
		-e "s|\([^:]*:.*\) install-pdfDATA\(.*\)|\1\2|g" \
		-e "s|\([^:]*:.*\) install-htmlDATA\(.*\)|\1\2|g" \
		-e "s|\([^:]*:.*\) install-txtDATA\(.*\)|\1\2|g" \
		-e "s|\([^:]*:.*\) install-demoDATA\(.*\)|\1\2|g" \
		-e "s|\([^:]*:.*\) install-demoSCRIPTS\(.*\)|\1\2|g" \
		-e "s|\([^:]*:.*\) install-pathplanexampleDATA\(.*\)|\1\2|g" \
		-e "s|@LIBICONV@|-liconv|g" \
		-e 's|demodir = $$(pkgdatadir)/demo|demodir = ${EXAMPLESDIR}|';
	@${REINPLACE_CMD} \
		-e 's|^\.SUFFIXES: \(.*\)\.1\(.*\)|.SUFFIXES: \1 \2|' \
		${WRKSRC}/cmd/tools/Makefile.in \
		${WRKSRC}/cmd/gvpr/Makefile.in
	@${FIND} ${WRKSRC}/lib -name 'Makefile.in' | \
		${XARGS} ${REINPLACE_CMD} \
		-e 's|pkglibdir = $$(libdir)/@PACKAGE@|pkglibdir = $$(libdir)|g' \
		-e 's|libdir = @libdir@|libdir = @libdir@/@PACKAGE@|g';
	@${FIND} ${WRKSRC}/lib -name '*.pc.in' | \
		${XARGS} ${REINPLACE_CMD} \
		-e 's|libdir=@libdir@|libdir=@libdir@/@PACKAGE@|';
	@${REINPLACE_CMD} -e "s|/usr/include/php|${LOCALBASE}/include/php|g" \
		-e "s|vendorarch|installsitearch|g" \
		-e "s|-lruby|-lruby${RUBY_SUFFIX}|g" ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|#include "gui.h"|#include "gui/gui.h"|' \
		${WRKSRC}/cmd/smyrna/tvnodes.h
	@${REINPLACE_CMD} -e 's|#include "regex_win32.h"|#include <regex.h>|' \
		${WRKSRC}/cmd/smyrna/btree.c
	@${REINPLACE_CMD} -e 's|#! /bin/sh|#! /${LOCALBASE}/bin/bash|g' \
		${WRKSRC}/configure

post-configure:
	${FIND} ${WRKSRC} -name 'Makefile' | \
		${XARGS} ${REINPLACE_CMD} \
		-e 's|@LIBICONV@|-liconv|';

.if defined(WITH_TK)
post-install-script:
	${INSTALL_MAN} \
		${WRKSRC}/tclpkg/gdtclft/gdtclft.n \
		${WRKSRC}/tclpkg/tcldot/tcldot.n \
		${WRKSRC}/tclpkg/tkspline/tkspline.n \
		${MANNPREFIX}/man/mann/
.endif

post-install:
	cd ${WRKSRC}/lib/expr && \
		${MAKE} ${INSTALL_TARGET}
	cd ${WRKSRC} && \
		${INSTALL_DATA} ${FIX_INCLUDE} ${PREFIX}/include/graphviz/
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/html
	@${MKDIR} ${DOCSDIR}/pdf
	cd ${WRKSRC} && \
		${INSTALL_DATA} ${PDOCS_TXT} ${DOCSDIR}/ && \
		${INSTALL_DATA} ${PDOCS_PDF} ${DOCSDIR}/pdf/ && \
		${INSTALL_DATA} ${PDOCS_HTML} ${DOCSDIR}/html/
.	for i in neato.pdf twopi.pdf fdp.pdf circo.pdf
		cd ${DOCSDIR}/pdf && ${LN} -fs dot.pdf ${i}
.	endfor
	cd ${DOCSDIR}/pdf && ${LN} -fs gxl2dot.pdf dot2gxl.pdf
.endif
	@${ECHO_MSG} "Installing demo data..."
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} \
		${WRKSRC}/tclpkg/gdtclft/demo/entities.tcl \
		${WRKSRC}/tclpkg/tcldot/demo/doted.tcl \
		${WRKSRC}/tclpkg/tcldot/demo/gcat.tcl \
		${WRKSRC}/tclpkg/tclpathplan/demo/pathplan.tcl \
		${WRKSRC}/tclpkg/tkspline/demo/spline.tcl \
		${EXAMPLESDIR}/
	${INSTALL_DATA} \
		${WRKSRC}/tclpkg/gdtclft/demo/entities.tcl.README \
		${WRKSRC}/tclpkg/tcldot/demo/doted.tcl.README \
		${WRKSRC}/tclpkg/tcldot/demo/gcat.tcl.README \
		${WRKSRC}/tclpkg/tclpathplan/demo/pathplan.tcl.README \
		${WRKSRC}/tclpkg/tkspline/demo/spline.tcl.README \
		${EXAMPLESDIR}/
	@${MKDIR} ${EXAMPLESDIR}/pathplan_data
	${INSTALL_DATA} \
		${WRKSRC}/tclpkg/tclpathplan/demo/pathplan_data/*.dat \
		${EXAMPLESDIR}/pathplan_data/

.include <bsd.port.post.mk>
