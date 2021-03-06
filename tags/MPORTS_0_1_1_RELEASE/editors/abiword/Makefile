# New ports collection makefile for:    AbiWord2
# Date created:         22 February 2003
# Whom:                 Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/editors/abiword/Makefile,v 1.124 2007/05/19 20:03:58 flz Exp $
#   $MCom: ports/editors/abiword/Makefile,v 1.6 2006/09/30 04:39:56 ahze Exp $
#

PORTNAME=	abiword
PORTVERSION=	2.4.6
PORTREVISION=	1
CATEGORIES=	editors
MASTER_SITES=	http://www.abisource.com/downloads/%SUBDIR%/${PORTVERSION}/source/
MASTER_SITE_SUBDIR=	abiword
DIST_SUBDIR=	AbiWord

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source, cross-platform WYSIWYG word processor

# unzip is needed during the installation process
BUILD_DEPENDS=	unzip:${PORTSDIR}/archivers/unzip
LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt \
		png.5:${PORTSDIR}/graphics/png \
		wv-1.2:${PORTSDIR}/textproc/wv \
		fribidi.0:${PORTSDIR}/converters/fribidi

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
USE_GNOME=	libglade2 libxml2 libgnomeprintui desktopfileutils
WANT_GNOME=	yes
USE_XLIB=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-xft \
		--with-sys-wv \
		--with-popt=${LOCALBASE} \
		--with-zlib=${LOCALBASE} \
		--with-libpng=${LOCALBASE} \
		--with-libiconv=${LOCALBASE} \
		--with-libjpeg-prefix=${LOCALBASE} \
		--disable-peer-config
MAKEFILE=	GNUmakefile

ABIVERSION=	2.4
PLIST_SUB+=	ABIVERSION=${ABIVERSION}
WRKSRC=		${WRKDIR}/abiword-${PORTVERSION}/abi

EXTERNALS=	MSVC* abipbx abiword-docs abiword-plugins expat fribidi \
		libiconv libpng pbx popt wv zlib
EXTRACT_AFTER_ARGS=| ${TAR} -xpf - ${EXTERNALS:C,^,--exclude ${DISTNAME}/,}

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug \
			--enable-symbols
CFLAGS+=		-g
STRIP=
.endif

.ifndef(WITHOUT_GTKSPELL)
LIB_DEPENDS+=		enchant.1:${PORTSDIR}/textproc/enchant
PLIST_SUB+=		DICT:="@comment "
.else
CONFIGURE_ARGS+=	--disable-enchant
PLIST_SUB+=		DICT:=""
.endif

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mlibgnomeui}!=""
USE_GNOME+=		libgnomeui
CONFIGURE_ARGS+=	--enable-gnome
PKGNAMESUFFIX:=		-gnome
GNOME_ENABLED=		yes
.endif

.if defined(WITH_GUCHARMAP) || exists(${LOCALBASE}/libdata/pkgconfig/gucharmap.pc)
LIB_DEPENDS+=		gucharmap.6:${PORTSDIR}/deskutils/gucharmap
.else
CONFIGURE_ARGS+=	--enable-cmap=no
.endif

pre-everything::
	@${ECHO_MSG} ""
	@${ECHO_MSG} "AbiWord2 has the following tunable option(s):"
	@${ECHO_MSG} "	WITH_DEBUG=yes		Enable debug."
	@${ECHO_MSG} "	WITH_GUCHARMAP=yes	Enable use of Gucharmap as the symbol insertion tool (default: auto)"
	@${ECHO_MSG} "	WITHOUT_GTKSPELL=yes	Don't use Enchant, but still enable spellchecking and install the dictionary."
	@${ECHO_MSG} ""

post-patch:
	@${REINPLACE_CMD} -e 's|-ansi||g ; s|-pedantic||g' \
		${WRKSRC}/configure
	@${FIND} ${WRKSRC}/src/config/platforms -name "*.mk" | ${XARGS} \
		${REINPLACE_CMD} 's|-ansi||g ; s|-pedantic||g'
	@${FIND} ${WRKSRC} -name GNUmakefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|@.*PEER.*@||g ; \
		 s|WV_INCLUDES = |#WV_INCLUDES = |g ; \
		 s|[(]libdir[)]/@PACKAGE@|(datadir)/@PACKAGE@|g ; \
		 s|[(]libdir[)]/bonobo/servers|(prefix)/libdata/bonobo/servers|g'

post-install:
	@${MKDIR} ${PREFIX}/lib/AbiWord-${ABIVERSION}/plugins
	@${MKDIR} ${PREFIX}/share/applications
	@${INSTALL_DATA} ${WRKSRC}/abiword.desktop \
		${PREFIX}/share/applications/abiword.desktop
	@${MKDIR} ${PREFIX}/share/pixmaps
	@${LN} -sf ${PREFIX}/share/AbiSuite-${ABIVERSION}/icons/abiword_48.png \
		${PREFIX}/share/pixmaps/abiword_48.png
.if defined(GNOME_ENABLED)
	@${MKDIR} ${PREFIX}/libdata/bonobo/servers
	@${INSTALL_DATA} ${WRKDIR}/abiword-${PORTVERSION}/abidistfiles/GNOME_AbiWord_Control_${ABIVERSION:S/./_/}.server \
		${PREFIX}/libdata/bonobo/servers/
	@${MKDIR} ${PREFIX}/share/gnome/gnome-2.0/ui
	@${INSTALL_DATA} ${WRKDIR}/abiword-${PORTVERSION}/abidistfiles/abi-nautilus-view-file.xml \
		${PREFIX}/share/gnome/gnome-2.0/ui/
.endif
	@-update-desktop-database

.include <bsd.port.post.mk>
