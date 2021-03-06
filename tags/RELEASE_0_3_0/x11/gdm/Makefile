# New ports collection makefile for:   gdm2
# Date created:        20 May 2002
# Whom:                Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/gdm/Makefile,v 1.4 2008/06/14 01:19:59 laffer1 Exp $
# $FreeBSD: ports/x11/gdm/Makefile,v 1.93 2007/08/27 20:12:05 marcus Exp $
#   $MCom: ports/x11/gdm/Makefile,v 1.58 2007/03/12 16:56:06 marcus Exp $
#

PORTNAME=	gdm
PORTVERSION=	2.30.5
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 version of xdm display manager
LICENSE=	gpl2

BUILD_DEPENDS=	zenity:${PORTSDIR}/x11/zenity \
    		${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
LIB_DEPENDS=	ck-connector.0:${PORTSDIR}/sysutils/consolekit \
		polkit-gtk-1.0:${PORTSDIR}/sysutils/polkit-gnome \
    		execinfo:${PORTSDIR}/devel/libexecinfo \
		upower-glib.1:${PORTSDIR}/sysutils/upower \
		xklavier.12:${PORTSDIR}/x11/libxklavier \
		canberra-gtk.0:${PORTSDIR}/audio/libcanberra
RUN_DEPENDS=	zenity:${PORTSDIR}/x11/zenity \
		${LOCALBASE}/libexec/gnome-settings-daemon:${PORTSDIR}/sysutils/gnome-settings-daemon \
		gnome-session:${PORTSDIR}/x11/gnome-session \
		${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes

USERS=		gdm
GROUPS=		gdm

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_XORG=	dmx dmxproto
INSTALLS_ICONS=	yes
USE_RC_SUBR=	gdm
USE_GNOME_SUBR=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack intlhack gnomehier gconf2 librsvg2 \
		gnomedocutils gnomeprefix gnomepanel
GCONF_SCHEMAS=	gdm-simple-greeter.schemas
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-working-directory=${PREFIX}/etc/gdm/home
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -DHAS_SA_LEN" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="-lm" \
		GTKDOC="false"

SUB_FILES+=	gdm.pam

GDMDIR?=	${PREFIX}/etc/gdm
PKGMESSAGE=	${WRKDIR}/pkg-message

GNOME_LOCALSTATEDIR=	/var

OPTIONS=	IPV6 "Enable IPv6 support" off \
		KEYRING "Enable GnomeKeyring/PAM integration" on

.include <bsd.port.pre.mk>

.if defined(WITHOUT_KEYRING)
SUB_LIST+=	PAM_KEYRING=\#
.else
RUN_DEPENDS+=	${LOCALBASE}/lib/pam_gnome_keyring.so:${PORTSDIR}/security/gnome-keyring
SUB_LIST+=	PAM_KEYRING=
.endif

.if defined(WITH_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|root:root|root:wheel|g' \
		${WRKSRC}/data/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
	    	-e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
	    	${WRKSRC}/daemon/gdm-session-worker.c \
		${WRKSRC}/data/gconf.path
	@${REINPLACE_CMD} -e 's|/bin/true|/usr/bin/true|g' \
	    	${WRKSRC}/data/session-setup.entries
	@${REINPLACE_CMD} -e 's|/usr/X11R6|${LOCALBASE}|g' \
		${WRKSRC}/configure ${WRKSRC}/daemon/*.c ${WRKSRC}/po/*.po
	@${REINPLACE_CMD} -e 's|/usr/lib|${LOCALBASE}/lib|g' \
		${WRKSRC}/data/greeter-autostart/*.desktop.in*

post-install:
	${INSTALL_DATA} ${WRKSRC}/data/gconf.path \
	    	${PREFIX}/share/gdm/gconf.path
	${INSTALL_DATA} ${WRKSRC}/data/session-setup.entries \
	    	${PREFIX}/share/gdm/session-setup.entries
.if !defined(PACKAGE_BUILDING)
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif
	${INSTALL_DATA} ${WRKSRC}/data/gdm.conf-custom \
		${PREFIX}/etc/gdm/custom.conf.default
	${MKDIR} ${PREFIX}/share/xsessions
	${INSTALL_DATA} ${WRKDIR}/gdm.pam ${PREFIX}/etc/pam.d/gdm
	@${SED} -e 's|%%PREFIX%%|${PREFIX}|g' < ${PKGDIR}/pkg-message \
		| /usr/bin/fmt 75 79 > ${PKGMESSAGE}

.include <bsd.port.post.mk>
