# New ports collection makefile for:	gnomepanel
# Date created:				27 April 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11/gnome-panel/Makefile,v 1.90 2008/04/20 00:42:32 marcus Exp $
#   $MCom: ports/x11/gnome-panel/Makefile,v 1.177 2008/03/23 06:13:12 marcus Exp $
#

PORTNAME=	gnome-panel
PORTVERSION=	2.22.1.3
PORTREVISION?=	0
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gnome-panel/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Panel component for the GNOME 2 Desktop
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	gweather.1:${PORTSDIR}/net/libgweather \
    		polkit-gnome.0:${PORTSDIR}/sysutils/policykit-gnome

USE_XORG=	x11
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gnomedesktop librsvg2 \
		libwnck gnomemenus gnomedocutils ltverhack referencehack
WANT_GNOME=	yes
GNOME_DESKTOP_VERSION=2
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_ARGS=	--with-kde-datadir=${LOCALBASE}/share \
		--with-kde-docdir=${LOCALBASE}/share/doc \
		--disable-network-manager \
		--enable-polkit
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		gnome-panel.1
GCONF_SCHEMAS=	clock.schemas fish.schemas \
		panel-compatibility.schemas panel-general.schemas \
		panel-global.schemas panel-object.schemas \
		panel-toplevel.schemas window-list.schemas \
		workspace-switcher.schemas

OPTIONS=	EVOLUTION "use the Evolution calendar if installed" on

.if defined(PACKAGE_BUILDING)
.undef WITHOUT_GNOME
WITH_GNOME=	yes
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_EVOLUTION) && ${HAVE_GNOME:Mevolutiondataserver}!=""
USE_GNOME+=	evolutiondataserver
CONFIGURE_ARGS+=--enable-eds
.else
CONFIGURE_ARGS+=--disable-eds
.endif

post-patch:
	@${FIND} ${WRKSRC} -type f | \
		${XARGS} -n 10 ${REINPLACE_CMD} -e \
		's|"applications.menu"|"gnome-applications.menu"|'
.if ( ${OSVERSION} > 600000 && ${OSVERSION} < 600006 ) || \
	( ${OSVERSION} < 503101 )
.for po in da.po it.po zh_CN.po zh_TW.po
	@${REINPLACE_CMD} -e 's|%-|%|g' ${WRKSRC}/po/${po}
.endfor
.endif

post-install:
	${MKDIR} ${PREFIX}/share/gnome-panel
	${INSTALL_DATA} ${FILESDIR}/iso3166.tab \
	    	${PREFIX}/share/gnome-panel/iso3166.tab

.include <bsd.port.post.mk>

.endif
