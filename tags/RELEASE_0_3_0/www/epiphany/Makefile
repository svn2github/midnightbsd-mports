# $MidnightBSD: mports/www/epiphany/Makefile,v 1.15 2011/01/15 04:06:19 laffer1 Exp $

PORTNAME=	epiphany
PORTVERSION=	2.22.3
CATEGORIES=	www gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidinghtBSD.org
COMMENT=	An extremely lightweight and simple web browser for GNOME 2
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
                notify.1:${PORTSDIR}/devel/libnotify
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes \
		${LOCALBASE}/share/icons/HighContrastLargePrint/index.theme:${PORTSDIR}/x11-themes/gnome-themes

USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_PYTHON=	yes
GNOME_DESKTOP_VERSION=2
USE_GNOME=	gnomeprefix gnomehack intlhack gnomedesktop desktopfileutils
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
INSTALLS_OMF=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS} ${EXTRA_CFLAGS}"  \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS} ${EXTRA_LIBS} " 

GCONF_SCHEMAS=	epiphany-lockdown.schemas epiphany.schemas \
		epiphany-fonts.schemas epiphany-pango.schemas

PLIST_SUB+=	EPHY_VERSION="${PORTVERSION:C/\.[0-9]+$//}" \
		EPHY_PREFIX="${PREFIX}"

MAN1=		epiphany.1

OPTIONS=	SPELL_CHECKER "Enable spell checking support" off

.if defined(PACKAGE_BUILDING)
.undef WITHOUT_GNOME
WITH_GNOME=	yes
.endif

.include <bsd.port.pre.mk>

.if defined(EPHY_SLAVE) && ${EPHY_SLAVE}=="webkit"
LIB_DEPENDS+=	webkit-1.0.9:${PORTSDIR}/www/webkit-gtk2
CONFIGURE_ARGS+=	--with-engine=webkit
EXTRA_CFLAGS+=	`pkg-config --cflags WebKitGtk` -I${LOCALBASE}/include/WebKit/webkit
EXTRA_LIBS+=	`pkg-config --libs WebKitGtk`
CONFLICTS=	epiphany-[1-9]*
PLIST_SUB+=	GECKO="@comment "
.else
USE_GECKO=	browser3<->firefox xulrunner
CONFIGURE_ARGS+=	--with-gecko=${GECKO} \
			--with-engine=mozilla
CONFLICTS=	epiphany-webkit-[1-9]*
PLIST_SUB+=	GECKO=""
.endif


NO_WERROR=	yes
# allow build with more warnings enabled
.if defined(NO_WERROR)
CONFIGURE_ARGS+=	--enable-compile-warnings=no
.endif

.if ${HAVE_GNOME:Mpygnome2}!=""
USE_PYTHON=	yes
USE_GNOME+=	pygnome2
CONFIGURE_ARGS+=--enable-python
PLIST_SUB+=	PYTHON=""
.else
CONFIGURE_ARGS+=--disable-python
PLIST_SUB+=	PYTHON="@comment "
.endif

.if defined(WITH_SPELL_CHECKER)
LIB_DEPENDS+=	enchant.1:${PORTSDIR}/textproc/enchant
CONFIGURE_ARGS+=--enable-spell-checker
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|WebKitGdk|WebKitGtk|' ${WRKSRC}/configure
	@${FIND} ${WRKSRC} -name "Makefile.in*" | ${XARGS} ${REINPLACE_CMD} -e \
		 's|-lpthread|${PTHREAD_LIBS}|g'
	@${REINPLACE_CMD} -e 's|execinfo.h|#|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|/lib/mozilla/plugins"|/lib/browser_plugins" ":" MOZILLA_PREFIX "/lib/browser_linux_plugins"|' \
		${WRKSRC}/embed/mozilla/mozilla-embed-single.cpp

post-install:
	${INSTALL_DATA} ${WRKSRC}/data/epiphany-fonts.schemas \
		${PREFIX}/etc/gconf/schemas

.include <bsd.port.post.mk>
