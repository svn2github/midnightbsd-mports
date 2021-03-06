# $MidnightBSD: mports/x11-wm/fvwm2/Makefile,v 1.3 2009/08/15 19:09:41 laffer1 Exp $

PORTNAME=	fvwm
PORTVERSION=	2.4.20
CATEGORIES=	x11-wm
MASTER_SITES=	ftp://ftp.fvwm.org/pub/fvwm/version-2/ \
		http://www.fvwm.org/generated/icon_download/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} fvwm_icons-20070101.tar.gz
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Popular virtual window manager for X
LICENSE=	agg
#it's gpl2 + x11 and other licenses.

RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

.if defined(WITH_STROKE)
LIB_DEPENDS+=	stroke.0:${PORTSDIR}/devel/libstroke
.endif

# Other ports this port cannot coexist with
CONFLICTS?=	fvwm-1.* fvwm-2.5.*
# Other ports reference this port's Makefile
.if defined(PKGNAMESUFFIX)
LATEST_LINK=	${PORTNAME}${PKGNAMESUFFIX}
PKGNAMESUFFIX:=	${PKGNAMESUFFIX}-imlib
.else
LATEST_LINK=	${PORTNAME}2
PKGNAMESUFFIX=	-imlib
.endif
USE_GMAKE=	yes
USE_XORG=	xpm
USE_BZIP2=	yes
WANT_GNOME=	yes

.include <bsd.port.pre.mk>

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--mandir=${PREFIX}/man

.if defined(WITH_STROKE)
CONFIGURE_ARGS+=	--with-stroke --with-stroke-library=${LOCALBASE}/lib \
			--with-stroke-includes=${LOCALBASE}/include
.endif

.if defined(WITHOUT_SESSION_MGMT)
CONFIGURE_ARGS+=	--disable-sm
.endif

.if defined(WITHOUT_SHAPE)
CONFIGURE_ARGS+=	--disable-shape
.endif

.if defined(WITH_MULTIBYTE)
CONFIGURE_ARGS+=	--enable-multibyte
.endif

PLIST_SUB+=	FVWM_VERSION="${PORTVERSION}"

MAN1=	FvwmAnimate.1 FvwmAuto.1 FvwmBacker.1 FvwmBanner.1 FvwmButtons.1 \
	FvwmCommand.1 FvwmConsole.1 FvwmConsoleC.pl.1 FvwmCpp.1 FvwmDebug.1 \
	FvwmDragWell.1 FvwmEvent.1 FvwmForm.1 FvwmIconBox.1 \
	FvwmIconMan.1 FvwmIdent.1 FvwmM4.1 FvwmPager.1 FvwmRearrange.1 \
	FvwmSave.1 FvwmSaveDesk.1 FvwmScript.1 FvwmScroll.1 FvwmTaskBar.1 \
	FvwmTheme.1 FvwmWharf.1 FvwmWinList.1 fvwm-menu-desktop.1 \
	fvwm-menu-directory.1 fvwm-menu-headlines.1 fvwm-menu-xlock.1 \
	fvwm2.1 fvwm24_convert.1 fvwmbug.1 fvwmrc_convert.1 xpmroot.1 \
	fvwm-config.1

.if ${HAVE_GNOME:Mimlib}!=""
USE_GNOME=	imlib
CONFIGURE_ARGS+=	--with-gnome --enable-gnome-hints \
			--enable-gtktest --enable-imlibtest
PLIST_SUB+=	GTK=""
MAN1+=	FvwmGtk.1
.else
CONFIGURE_ARGS+=	--without-gnome --disable-gnome-hints \
			--disable-gtktest --disable-imlibtest \
			--with-gtk-prefix=/no/dir --with-imlib-prefix=/no/dir
PLIST_SUB+=	GTK="@comment not installed: "
.endif

post-extract:
	@${MKDIR} ${WRKDIR}/icons
	@${TAR} -xzf ${DISTDIR}/fvwm_icons-20070101.tar.gz -C ${WRKDIR}/icons

post-patch:
	@${REINPLACE_CMD} -e 's,%%LOCALBASE%%,${LOCALBASE},' \
		${WRKSRC}/modules/FvwmM4/FvwmM4.c

post-install:
	@${INSTALL_DATA} ${WRKSRC}/sample.fvwmrc/system.fvwm2rc \
		${PREFIX}/etc/system.fvwm2rc.dist
	@if [ ! -e ${PREFIX}/etc/system.fvwm2rc ]; then \
		${INSTALL_DATA} ${WRKSRC}/sample.fvwmrc/system.fvwm2rc \
			${PREFIX}/etc/system.fvwm2rc; \
	fi
	@${MKDIR} ${PREFIX}/share/fvwm2/pixmaps
	${INSTALL_DATA} ${WRKDIR}/icons/fvwm_icons-20070101/*.xpm \
		${PREFIX}/share/fvwm2/pixmaps

.include <bsd.port.post.mk>
