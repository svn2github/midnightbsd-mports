# $MidnightBSD: mports/math/R/Makefile,v 1.7 2010/03/25 01:29:41 laffer1 Exp $

PORTNAME=	R
PORTVERSION=	2.9.2
PORTREVISION=	2
CATEGORIES=	math lang
MASTER_SITES=	http://cran.r-project.org/src/base/R-2/ \
		ftp://cran.r-project.org/pub/R/src/base/R-2/ \
		http://cran.at.r-project.org/src/base/R-2/ \
		http://cran.au.r-project.org/src/base/R-2/ \
		http://cran.br.r-project.org/src/base/R-2/ \
		http://cran.ch.r-project.org/src/base/R-2/ \
		http://cran.es.r-project.org/src/base/R-2/ \
		http://cran.dk.r-project.org/src/base/R-2/ \
		http://cran.hu.r-project.org/src/base/R-2/ \
		http://cran.uk.r-project.org/src/base/R-2/ \
		http://cran.us.r-project.org/src/base/R-2/ \
		http://cran.za.r-project.org/src/base/R-2/ \
		ftp://ftp.u-aizu.ac.jp/pub/lang/R/CRAN/src/base/R-2/ \
		http://lib.stat.cmu.edu/R/CRAN/src/base/R-2/ \
		http://cran.stat.ucla.edu/src/base/R-2/ \
		http://probability.ca/cran/src/base/R-2/ \
		http://www.ibiblio.org/pub/languages/R/CRAN/src/base/R-2/ \
		http://www.bioconductor.org/CRAN/src/base/R-2/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A language for statistical computing and graphics
LICENSE=	gpl2

OPTIONS=	ATLAS	"Use ATLAS instead of BLAS/LAPACK" off \
		GHOSTSCRIPT  "Enable the [dev2]bitmap() graphics devices" on \
		ICU		"Improve collation in multibyte locales with ICU" on \
		JPEG         "Enable the jpeg() graphics device" on \
		LETTER_PAPER	"Use US Letter paper" off \
		NLS		"Build with NLS support" on \
		PCRE_PORT	"Use PCRE port instead of bundled source" on \
		PNG	"Enable the png() graphics device" on \
		TCLTK	"Use Tcl/Tk (for the tcltk package)" on \
		THREADS "Build a multithreaded R" on \
		X11	"Enable the X11() graphics device" on \
		DVI_MANUALS  "Install DVI manuals (requires TeX)" off \
		INFO_MANUALS "Install GNU info manuals" on \
		PDF_MANUALS	"Install PDF manuals (requires TeX)" off

MAN1=		R.1 Rscript.1

USE_LDCONFIG=	yes
USE_FORTRAN=	yes

INSTALL_TARGET=	install install-libR
ALL_TARGET=	all
GNU_CONFIGURE=	yes
USE_ICONV=	yes
USE_PERL5=	yes
CONFIGURE_ENV=	INSTALL_DATA="${INSTALL} ${COPY} ${_SHROWNGRP} -m 644" \
		FCFLAGS="${FFLAGS}"
CONFIGURE_ARGS=	--enable-R-shlib --with-system-bzlib --with-system-zlib \
		rdocdir=${DOCSDIR}

.include <bsd.mport.options.mk>

.if defined(WITH_ATLAS)
LIB_DEPENDS+=	atlas.2:${PORTSDIR}/math/atlas
CONFIGURE_ARGS+=--with-blas="-lf77blas -latlas"
# A workaround to prevent hangs up during the build.
.if ${ARCH} != "i386"
CONFIGURE_ARGS+=--with-lapack="-lalapack -lcblas"
.endif
.else
LIB_DEPENDS+=	blas.2:${PORTSDIR}/math/blas	\
		lapack.4:${PORTSDIR}/math/lapack
CONFIGURE_ARGS+=--with-blas="-lblas" --with-lapack="-llapack -lblas"
.endif

.if !defined(WITHOUT_GHOSTSCRIPT)
USE_GHOSTSCRIPT_RUN=yes
.endif

.if defined(WITHOUT_ICU)
CONFIGURE_ARGS+=--without-ICU
.else
LIB_DEPENDS+=	icui18n:${PORTSDIR}/devel/icu
CONFIGURE_ARGS+=--with-ICU
.endif

.if defined(WITHOUT_JPEG)
CONFIGURE_ARGS+=--without-jpeglib
.else
LIB_DEPENDS+=	jpeg.11:${PORTSDIR}/graphics/jpeg
CONFIGURE_ARGS+=--with-jpeglib
.endif

.if defined(WITH_LETTER_PAPER)
CONFIGURE_ENV+=	R_PAPERSIZE=letter
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITHOUT_PCRE_PORT)
CONFIGURE_ARGS+=--without-system-pcre
.else
LIB_DEPENDS+=	pcre.0:${PORTSDIR}/devel/pcre
CONFIGURE_ARGS+=--with-system-pcre
.endif

.if defined(WITHOUT_PNG)
CONFIGURE_ARGS+=--without-libpng
.else
LIB_DEPENDS+=	png.6:${PORTSDIR}/graphics/png
CONFIGURE_ARGS+=--with-libpng
.endif

.if defined(WITHOUT_TCLTK)
CONFIGURE_ARGS+=--without-tcltk
PLIST_SUB+=	TCLTK="@comment "
.else
USE_TK_NO_THREADS=	yes
USE_TK =	83+
EXTENSIONS+=	tcl
CONFIGURE_ARGS+=--with-tcltk \
		--with-tcl-config=${TCL_LIBDIR}/tclConfig.sh \
		--with-tk-config=${TK_LIBDIR}/tkConfig.sh
PLIST_SUB+=	TCLTK=""
.endif

.if defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=--disable-threads
.else
CONFIGURE_ARGS+=--enable-threads=posix
.endif

.if defined(WITHOUT_X11)
CONFIGURE_ARGS+=--without-x
PLIST_SUB+=	X11="@comment "
.else
CONFIGURE_ARGS+=--with-x
USE_XORG=	x11 xt
PLIST_SUB+=	X11=""
.endif

.if defined(WITH_DVI_MANUALS) && !defined(NOPORTDOCS)
BUILD_DEPENDS+=	texi2dvi:${PORTSDIR}/print/teTeX-base
ALL_TARGET+=	dvi
INSTALL_TARGET+=install-dvi
PLIST_SUB+=	DVI_MANUAL=""
.else
PLIST_SUB+=	DVI_MANUAL="@comment "
.endif

.if defined(WITH_INFO_MANUALS) && !defined(NOPORTDOCS)
ALL_TARGET+=	info
INFO=		R-FAQ R-admin R-data R-exts R-intro R-lang
.endif

.if defined(WITH_PDF_MANUALS) && !defined(NOPORTDOCS)
PLIST_SUB+=	PDF_MANUAL=""
BUILD_DEPENDS+=	pdflatex:${PORTSDIR}/print/teTeX-base
ALL_TARGET+=	pdf
INSTALL_TARGET+=	install-pdf
.else
PLIST_SUB+=	PDF_MANUAL="@comment "
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/src/nmath/standalone/Makefile.in \
		${WRKSRC}/src/unix/Makefile.in
	@${REINPLACE_CMD} -e "s|-lpthread|${PTHREAD_LIBS}|g" \
		${WRKSRC}/configure \
		${WRKSRC}/src/scripts/javareconf
	@${REINPLACE_CMD} -e "s|/usr/local|${LOCALBASE}|g" \
		${WRKSRC}/configure \
		${WRKSRC}/config.site \
		${WRKSRC}/src/extra/tzone/tzfile.h \
		${WRKSRC}/src/library/base/man/Startup.Rd \
		${WRKSRC}/src/library/profile/Rprofile.unix \
		${WRKSRC}/src/scripts/javareconf
.if defined(WITHOUT_NLS)
	@(cd ${WRKSRC}/src/library/Recommended; \
	for tarfile in *.tgz *.tar.gz ; do \
	${TAR} -czf temptgz --exclude='*/po/*' @$$tarfile ; \
	${MV} temptgz $$tarfile ; \
	done)
.endif

regression-test: build
	@(cd ${WRKSRC}; ${MAKE} check)

check-all: build
	@(cd ${WRKSRC}; ${MAKE} check-all)

post-install:
	${MV} ${PREFIX}/lib/libR.so ${PREFIX}/lib/libR.so.0
	${LN} -sf ${PREFIX}/lib/libR.so.0 ${PREFIX}/lib/libR.so
.if defined(WITH_INFO_MANUALS) && !defined(NOPORTDOCS)
	@(cd ${WRKSRC}/doc/manual; \
	for infofile in ${INFO}; do \
		${INSTALL_DATA} $${infofile}.info* ${PREFIX}/${INFO_PATH}/; \
	done)
.endif

.include <bsd.port.post.mk>
