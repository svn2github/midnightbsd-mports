# $MidnightBSD: mports/x11/xterm/Makefile,v 1.28 2013/06/05 00:03:29 laffer1 Exp $

PORTNAME=	xterm
PORTVERSION=	293
CATEGORIES=	x11
MASTER_SITES=	ftp://invisible-island.net/xterm/:src1 \
		CRITICAL:src1 CRITICAL:src2
EXTRACT_SUFX=	.tgz
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:src1 \
		bsd-xterm-icons-${ICONVERSION}${EXTRACT_SUFX}:src2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal emulator for the X Window System
LICENSE=	x11

CONFLICTS=	x11iraf-[0-9]*

USE_XORG=	xaw xft
WANT_GNOME=	desktopfileutils
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

CONFIGURE_ENV+=	LIBS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS+=	--with-utempter --enable-narrowproto

CPPFLAGS+=	-I${LOCALBASE}/include

ICONVERSION=	1

OPTIONS_DEFINE=	WCHAR LUIT DECTERM PCRE GNOME DABBREV 256COLOR

DABBREV_DESC=	Enable support for dabbrev-expand
DECTERM_DESC=	Enable DECterm Locator support
LUIT_DESC=	Use LUIT for locale convertion from/to UTF-8
WCHAR_DESC=	Enable wide-character support
256COLOR_DESC=	Enable 256-color support

OPTIONS_DEFAULT=WCHAR LUIT 256COLOR

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:M256COLOR}
CONFIGURE_ARGS+=	--enable-256-color
.endif

.if ${PORT_OPTIONS:MLUIT}
CONFIGURE_ARGS+=	--enable-luit
BUILD_DEPENDS=	luit:${PORTSDIR}/x11/luit
.endif

.if ${PORT_OPTIONS:MWCHAR}
CONFIGURE_ARGS+=	--enable-wide-chars
.endif

.if ${PORT_OPTIONS:MDECTERM}
CONFIGURE_ARGS+=	--enable-dec-locator
.endif

.if ${PORT_OPTIONS:MPCRE}
CONFIGURE_ARGS+=	--with-pcre
LIB_DEPENDS=		pcre:${PORTSDIR}/devel/pcre
.endif

.if ${PORT_OPTIONS:MDABBREV}
CONFIGURE_ARGS+=	--enable-dabbrev
.endif

.if ${PORT_OPTIONS:MGNOME}
USE_GNOME=	desktopfileutils
PLIST_SUB+=	GNOME=""
.else
PLIST_SUB+=	GNOME="@comment "
.endif

MAN1=		resize.1 koi8rxterm.1 uxterm.1 xterm.1

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4015
LIB_DEPENDS+=	utempter:${PORTSDIR}/sysutils/libutempter
.endif

post-extract:
	@${CP} ${WRKDIR}/bsd-xterm-icons-1/*.png ${WRKDIR}/bsd-xterm-icons-1/*.xpm \
		${WRKSRC}/icons/

post-install:
.for f in koi8rxterm resize uxterm xterm
	@${CHMOD} ${BINMODE} ${PREFIX}/bin/${f}
.endfor
	@${MKDIR} ${PREFIX}/share/applications/
	@${INSTALL_DATA} ${WRKSRC}/xterm.desktop ${PREFIX}/share/applications/

.include <bsd.port.post.mk>
