# $MidnightBSD$

PORTNAME=	xorg-nestserver
PORTREVISION=	1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nesting X server from X.Org
LICENSE=	mit

MASTERDIR=	${.CURDIR}/../xorg-server
DESCR=		${.CURDIR}/pkg-descr
USE_XORG=	x11 xf86driproto glproto randrproto renderproto fixesproto \
		damageproto xcmiscproto xextproto xf86miscproto inputproto \
		xf86vidmodeproto xf86bigfontproto scrnsaverproto bigreqsproto \
		dri2proto resourceproto fontsproto xf86dgaproto videoproto \
		compositeproto trapproto recordproto resourceproto \
		xineramaproto xinerama evieproto xkbfile xfont fontenc xkbui \
		xxf86misc xxf86vm xaw7 xmu xpm xext pixman xtrans

CONFIGURE_ARGS=	--disable-dmx --disable-xvfb \
		--without-xmlto --disable-docs --disable-devel-docs \
		--localstatedir=/var --without-dtrace

SLAVE_PORT=	yes
PLIST_FILES=	bin/Xnest
MAN1=		Xnest.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/hw/xnest/Xnest ${PREFIX}/bin/
.if defined(WITH_NEW_XORG)
	${INSTALL_MAN} ${WRKSRC}/hw/xnest/man/Xnest.1 ${PREFIX}/man/man1/
.else
	${INSTALL_MAN} ${WRKSRC}/hw/xnest/Xnest.1 ${PREFIX}/man/man1/
.endif

.include "${MASTERDIR}/Makefile"
