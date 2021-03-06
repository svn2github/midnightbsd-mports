# -*-mode: makefile-*-
# New ports collection makefile for:	qt-copy
# Date created:				2 November 2001
# Whom:					will@cvs.kde.org
#
# $FreeBSD: ports/x11-toolkits/qt33/Makefile,v 1.196 2006/09/12 23:26:51 lofi Exp $
# $MidnightBSD: mports/x11-toolkits/qt33/Makefile,v 1.9 2008/05/04 18:56:13 laffer1 Exp $
#

PORTNAME=	qt
PORTVERSION=	3.3.8
CATEGORIES?=	x11-toolkits ipv6
MASTER_SITES=	${MASTER_SITE_QT}
DISTNAME=	qt-x11-free-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multiplatform C++ application framework
LICENSE=	gpl2

BUILD_DEPENDS=	qmake:${PORTSDIR}/devel/qmake

LIB_DEPENDS+=	mng:${PORTSDIR}/graphics/libmng \
		png:${PORTSDIR}/graphics/png \
		jpeg:${PORTSDIR}/graphics/jpeg

EXTRA_PATCHES=	${PATCHDIR}/0081-format-string-fixes.diff

USE_BZIP2=	yes
REINPLACE_ARGS=	-i ""
USE_XLIB=	yes
HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes
DESTDIRNAME=	INSTALL_ROOT
.if defined(PACKAGE_BUILDING)
TMPDIR?=	/tmp
.endif

CONFIGURE_ARGS+=	-system-libpng -system-libjpeg -system-libmng	\
		-qt-imgfmt-png -qt-imgfmt-jpeg -qt-imgfmt-mng	\
		-system-zlib -sm -qt-gif -thread \
		-fast -xinerama -no-g++-exceptions -stl -no-nis \
		${CUPS} -shared -prefix ${PREFIX} -datadir ${DATADIR} \
		-verbose -docdir ${DOCSDIR} -tablet -ipv6 \
		-plugindir ${PREFIX}/lib/plugins

CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	TMPDIR=${TMPDIR} \
		QTDIR=${WRKSRC} \
		LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH
ALL_TARGET=	sub-tools
EXTRACT_AFTER_ARGS=| ${TAR} -xf - \
	--exclude '${DISTNAME}/mkspecs' --exclude '${DISTNAME}/qmake' \
	--exclude '${DISTNAME}/examples' --exclude '${DISTNAME}/tutorial' \
	--exclude '${DISTNAME}/extensions/nsplugin/src/[^q]*' \
	--exclude '${DISTNAME}/include/jri*' \
	--exclude '${DISTNAME}/include/np*' \
	--exclude '${DISTNAME}/doc/html/qmake*'

OPTIONS=	CUPS "Enable CUPS support" on \
		KDE_PATCHES "Apply KDE patches" off \
		NAS "Enable NAS support" on \
		OPENGL "Enable OpenGL support" on \
		XFT "Enable Xft support" on

EXTRACT_COOKIE=	${WRKDIR}/.extract_done.${PORTNAME}.${PREFIX:S/\//_/g}
CONFIGURE_COOKIE=${WRKDIR}/.configure_done.${PORTNAME}.${PREFIX:S/\//_/g}
INSTALL_COOKIE=	${WRKDIR}/.install_done.${PORTNAME}.${PREFIX:S/\//_/g}
BUILD_COOKIE=	${WRKDIR}/.build_done.${PORTNAME}.${PREFIX:S/\//_/g}
PATCH_COOKIE=	${WRKDIR}/.patch_done.${PORTNAME}.${PREFIX:S/\//_/g}
PACKAGE_COOKIE=	${WRKDIR}/.package_done.${PORTNAME}.${PREFIX:S/\//_/g}

.include <bsd.port.pre.mk>

.for d in ${LOCALBASE} ${PREFIX}
.	if exists($d/share/qt/mkspecs/freebsd-g++/qplatformdefs.h)
QTBASE=$d
PLATFORM=${QTBASE}/share/qt/mkspecs/freebsd-g++
.	endif
.endfor

.if defined(PLATFORM)
CONFIGURE_ARGS+=-platform ${PLATFORM}
.else
CONFIGURE_ARGS+=-platform ${LOCALBASE}/share/qt/mkspecs/freebsd-g++
.endif

.if !defined(WITHOUT_XFT)
LIB_DEPENDS+=	Xft.2:${PORTSDIR}/x11-fonts/libXft
.elif defined(WITHOUT_XFT)
CONFIGURE_ARGS+=-no-xft
.endif

.if defined(WANT_QT_DEBUG)
CONFIGURE_ARGS+=-debug
.endif

.if !defined(WITHOUT_OPENGL)
USE_GL=		glu
CONFIGURE_ARGS+=-dlopen-opengl
.elif defined(WITHOUT_OPENGL)
CONFIGURE_ARGS+=-disable-opengl
.endif # WITHOUT_OPENGL

.if !defined(WITHOUT_CUPS)
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-base
CUPS=	-cups -L${LOCALBASE}/lib -I${LOCALBASE}/include
.elif defined(WITHOUT_CUPS)
CUPS=
.endif

.if !defined(WITHOUT_NAS)
LIB_DEPENDS+=	audio:${PORTSDIR}/audio/nas
CONFIGURE_ARGS+=-system-nas-sound -no-pch
.elif defined(WITHOUT_NAS)
CONFIGURE_ARGS+=-no-nas-sound
.endif

.if defined(WITH_KDE_PATCHES)
EXTRA_PATCHES+=	${PATCHDIR}/0001-dnd_optimization.patch \
		${PATCHDIR}/0002-dnd_active_window_fix.patch \
		${PATCHDIR}/0007-qpixmap_constants.patch \
		${PATCHDIR}/0015-qiconview-finditem.patch \
		${PATCHDIR}/0016-qiconview-rebuildcontainer.patch \
		${PATCHDIR}/0017-qiconview-ctrl_rubber.patch \
		${PATCHDIR}/0020-designer-deletetabs.patch \
		${PATCHDIR}/0032-fix_rotated_randr.diff \
		${PATCHDIR}/0035-qvaluelist-streaming-operator.patch \
		${PATCHDIR}/0038-dragobject-dont-prefer-unknown.patch \
		${PATCHDIR}/0044-qscrollview-windowactivate-fix.diff \
		${PATCHDIR}/0046-qiconview-no-useless-scrollbar.diff \
		${PATCHDIR}/0047-fix-kmenu-width.diff \
		${PATCHDIR}/0048-qclipboard_hack_80072.patch \
		${PATCHDIR}/0049-qiconview-rubber_on_move.diff \
		${PATCHDIR}/0056-khotkeys_input_84434.patch \
		${PATCHDIR}/0059-qpopup_has_mouse.patch \
		${PATCHDIR}/0060-qpopup_ignore_mousepos.patch \
		${PATCHDIR}/0061-qscrollview-propagate-horizontal-wheelevent.patch \
		${PATCHDIR}/0073-xinerama-aware-qpopup.patch \
		${PATCHDIR}/0076-fix-qprocess.diff \
		${PATCHDIR}/0078-argb-visual-hack.patch \
		${PATCHDIR}/0079-compositing-types.patch \
		${PATCHDIR}/0080-net-wm-sync-request.patch \
		${PATCHDIR}/xxxx-qt-font-default-subst.patch
PKGNAMESUFFIX=	-copy
COMMENT+=	(+ KDE patches)
CONFLICTS+=	qt-3.3.*
.elif defined(WITHOUT_KDE_PATCHES)
CONFLICTS+=	qt-copy-[0-9]*
.endif

post-patch:
.if defined(PLATFORM)
	@${REINPLACE_CMD} -e 's|$$outpath/bin/qmake|${QTBASE}/bin/qmake|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|$$OUTDIR/bin/qmake|${QTBASE}/bin/qmake|g' \
		${WRKSRC}/config.tests/unix/endian.test \
		${WRKSRC}/config.tests/unix/largefile.test \
		${WRKSRC}/config.tests/unix/ptrsize.test
.else
	@${REINPLACE_CMD} -e 's|$$outpath/bin/qmake|${LOCALBASE}/bin/qmake|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|$$OUTDIR/bin/qmake|${LOCALBASE}/bin/qmake|g' \
		${WRKSRC}/config.tests/unix/endian.test \
		${WRKSRC}/config.tests/unix/largefile.test \
		${WRKSRC}/config.tests/unix/ptrsize.test
.endif
	@${REINPLACE_CMD} -e 's|^	cd qmake.*||' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's|^CFG_PRECOMPILE=no|CFG_PRECOMPILE=auto|g' \
		${WRKSRC}/configure

post-configure:
	@${REINPLACE_CMD} -e \
		's|/lib/pkgconfig/|/libdata/pkgconfig/|g' \
		-e 's|^INCPATH.*=|INCPATH  = -I../include|g' \
			${WRKSRC}/src/Makefile

post-build:
.for tool in makeqpf mergetr msg2qm qembed qvfb
	@cd ${WRKSRC}/tools/${tool}; ${SETENV} ${MAKE_ENV} ${MAKE}
.endfor
	@${FIND} ${WRKSRC} -name Makefile | ${XARGS} ${GREP} --mmap -F -l -- \
		"${PLATFORM}" | ${XARGS} ${REINPLACE_CMD} -e "s,${PLATFORM}/qmake.conf,," \
		-e "s,${PLATFORM},,"
	@${RM} -f ${WRKSRC}/doc/html/qmake*

# Work around qmake generated dependencies
pre-install:
	${MKDIR} ${PREFIX}/lib ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/lib/*.prl ${PREFIX}/lib
	${INSTALL_SCRIPT} ${WRKSRC}/bin/findtr ${PREFIX}/bin
.for tool in makeqpf mergetr msg2qm qembed qvfb
	${INSTALL_PROGRAM} ${WRKSRC}/tools/${tool}/${tool} ${PREFIX}/bin
.endfor

post-install:
	${RM} -f ${PREFIX}/lib/libqt-mt.la

.include <bsd.port.post.mk>
