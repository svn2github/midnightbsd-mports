# $MidnightBSD$

PORTNAME=	pidgin
PORTREVISION=	0

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pidgin multi-protocol messaging client (GTK+ UI)
LICENSE=	gpl2

LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification \
		purple.10:${PORTSDIR}/net-im/libpurple

MASTERDIR=	${.CURDIR}/../libpurple
BUILD_WRKSRC=	${WRKSRC}/pidgin
INSTALL_WRKSRC=	${BUILD_WRKSRC}
INSTALLS_ICONS=	yes
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

PIDGIN_SLAVE=	yes
WITH_GTKUI=	yes

USE_LDCONFIG=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gtk20
USE_XORG=	xscrnsaver sm
WANT_GNOME=	yes
CONFIGURE_ARGS=	--disable-consoleui \
		--disable-nm \
		--enable-screensaver \
		--with-dynamic_prpls=${PRPL_MODULES:S/,$//}

MAN1=		pidgin.1

post-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} \
	    	Makefile ${MAKE_ARGS} pidgin.desktop

post-install:
	${MKDIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/pidgin.desktop \
	    	${PREFIX}/share/applications/pidgin.desktop
	${INSTALL_MAN} ${WRKSRC}/doc/pidgin.1 ${MAN1PREFIX}/man/man1

.include "${MASTERDIR}/Makefile"
