# $MidnightBSD$

PORTNAME=	libgnomeprint
PORTVERSION=	2.18.8
PORTREVISION=	1
CATEGORIES=	print gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome print support library
LICENSE=        gpl2

USES=		tar:bzip2

.if !defined(REFERENCE_PORT)

OPTIONS=	CUPS "Enable CUPS printing system" on

LIB_DEPENDS=	fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig \
		popt.0:${PORTSDIR}/devel/popt

USE_BISON=	build
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack gnomehier glib20 pango libxml2 \
		libartlgpl2 ltverhack
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION=${PORTVERSION} \
		LIBVERSION=2.2

.include <bsd.port.pre.mk>

.if defined(WITH_CUPS)
CONFIGURE_ARGS+=	--with-cups
LIB_DEPENDS+=		gnomecups-1.0:${PORTSDIR}/print/libgnomecups
PLIST_SUB+=		CUPS:=""
.else
CONFIGURE_ARGS+=	--without-cups
PLIST_SUB+=		CUPS:="@comment "
.endif

post-patch:
	@${FIND} ${WRKSRC} -name '*.[ch]' | ${XARGS} ${REINPLACE_CMD} -e \
		's|<malloc[.]h>|<stdlib.h>|'
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s|tests||" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s|doc||" ${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${PREFIX}/etc/gnome/libgnomeprint-2.0/fonts
	@${TOUCH} ${PREFIX}/etc/gnome/libgnomeprint-2.0/fonts/gnome-print.fontmap

.include <bsd.port.post.mk>

.endif
