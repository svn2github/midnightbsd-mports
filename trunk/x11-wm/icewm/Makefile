# New ports collection makefile for:	icewm
# Date created:		10 August 1997
# Whom:			Yukihiro Nakai <Nakai@Mlab.t.u-tokyo.ac.jp>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-wm/icewm/Makefile,v 1.134 2008/03/23 11:11:23 miwi Exp $
#

PORTNAME=	icewm
PORTVERSION=	1.3.7
CATEGORIES=	x11-wm
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-${PORTVERSION:R}/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Window Manager designed for speed, usability and consistency
LICENSE=	lgpl

WANT_GNOME=	yes
USE_XORG=	x11 ice xinerama xext xrandr sm
USE_GNOME=	 gtk20 # gdkpixbuf really :-)
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--enable-shaped-decorations \
		--enable-guievents \
		--with-cfgdir=${DATADIR} \
		--with-libdir=${DATADIR} \
		--with-kdedatadir=${LOCALBASE}/share \
		--with-docdir=${PREFIX}/share/doc \
		--with-mkfontdir=${NONEXISTENT}

OPTIONS=	GNOMEDESKTOP	"Enable GNOME desktop support"		off \
		ESOUND		"Enable EsounD daemon support"		off \
		XFT		"Enable Xft support for fonts"		on \
		XINERAMA	"Enable Xinerama support"		off \
		X86_ASM		"Use optimized x86 assembly code"	on \
		BEASTIE		"Use Beastie'fied startup button"	off \
		NLS		"Enable National Language Support"	on

# Restrict to stable (even) versions, indicated by the second component.
#PORTSCOUT=	limitw:1,even

.include <bsd.port.pre.mk>

.if defined(WITH_GNOMEDESKTOP)
USE_GNOME+=	gnomedesktop
CONFIGURE_ARGS+=--enable-menus-gnome2
INSTALL_TARGET=	install install-gnome
PLIST_SUB+=	GNOMEDESKTOP=""
.else
PLIST_SUB+=	GNOMEDESKTOP="@comment "
.endif

.if defined(WITH_ESOUND)
USE_GNOME+=	esound
CONFIGURE_ARGS+=--with-icesound=esound
.else
CONFIGURE_ARGS+=--with-icesound=oss
.endif

.if !defined(WITHOUT_XFT)
LIB_DEPENDS+=	Xft.2:${PORTSDIR}/x11-fonts/libXft
CONFIGURE_ARGS+=--enable-gradients
.else
CONFIGURE_ARGS+=--enable-corefonts --disable-xfreetype
.endif

.if defined(WITHOUT_XINERAMA)
CONFIGURE_ARGS+=--disable-xinerama
.endif

.if ${ARCH} != "i386" || defined(WITHOUT_X86_ASM)
CONFIGURE_ARGS+=--disable-x86-asm
.endif

.if defined(WITH_BEASTIE)
STARTUP_PIXMAP=	${DATADIR}/taskbar/bsd-daemon.xpm
.else
STARTUP_PIXMAP=	icewm-logo.xpm
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls --disable-i18n
PLIST_SUB+=	NLS="@comment "
.endif

post-extract:
.for dir in taskbar themes/Infadel2/taskbar
	@cd ${WRKSRC}/lib/${dir} && ${MV} start.xpm icewm-logo.xpm
.endfor
	@${CP} -f ${FILESDIR}/bsd-daemon.xpm ${WRKSRC}/lib/taskbar

post-patch:
	@${REINPLACE_CMD} -e '/test/s|==|=|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		's|/usr/share/control|${LOCALBASE}/share/control|g ; \
		 s|/usr/share/app|${LOCALBASE}/share/app|g ; \
		 s|/usr/share/gnome|${LOCALBASE}/share/gnome|g' \
		 ${WRKSRC}/src/gnome2.cc

post-configure:
	${REINPLACE_CMD} -e 's|icewm-set-gnomewm||g' ${WRKSRC}/Makefile

post-install:
.for dir in taskbar themes/Infadel2/taskbar
	@${LN} -sf ${STARTUP_PIXMAP} ${DATADIR}/${dir}/start.xpm
.endfor
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
. for f in CHANGES INSTALL README TODO
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
. endfor
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${DOCSDIR}
.endif
	@${ECHO_CMD}; ${CAT} ${PKGMESSAGE}; ${ECHO_CMD}

.include <bsd.port.post.mk>
