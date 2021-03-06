# $MidnightBSD: mports/devel/libsoup/Makefile,v 1.19 2011/09/27 17:40:25 laffer1 Exp $
# $FreeBSD: ports/devel/libsoup/Makefile,v 1.82 2010/12/04 07:31:19 ade Exp $

PORTNAME=	libsoup
PORTVERSION=	2.34.3
PORTREVISION?=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A SOAP (Simple Object Access Protocol) implementation in C
LICENSE=	gpl2

USE_XZ=		yes

BUILD_DEPENDS=	glib-networking>=2.28.4:${PORTSDIR}/net/glib-networking
LIB_DEPENDS=	gcrypt.18:${PORTSDIR}/security/libgcrypt
RUN_DEPENDS=	glib-networking>=2.28.4:${PORTSDIR}/net/glib-networking

.if !defined(REFERENCE_PORT)

USE_GNOME=	gnomehack glib20 libxml2 ltverhack referencehack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CPPFLAGS=	-I${LOCALBASE}/include
CONFIGURE_ENV=	LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION="2.4"

.include <bsd.port.pre.mk>

.if defined(SOUP_SLAVE)
LIB_DEPENDS+=	soup-2.4.1:${PORTSDIR}/devel/libsoup \
		gnome-keyring.0:${PORTSDIR}/security/libgnome-keyring \
		sqlite3.8:${PORTSDIR}/databases/sqlite3
CONFIGURE_ARGS+=--with-gnome
.else
BUILD_DEPENDS+=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
CONFIGURE_ARGS+=--without-gnome
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
		${WRKSRC}/configure

.if defined(SOUP_SLAVE)
do-build:
	cd ${WRKSRC}/libsoup && ${GMAKE} libsoup-gnome-2.4.la

do-install:
	${INSTALL_DATA} ${WRKSRC}/libsoup/.libs/libsoup-gnome-2.4.a ${PREFIX}/lib/
	${INSTALL_DATA} ${WRKSRC}/libsoup/.libs/libsoup-gnome-2.4.la ${PREFIX}/lib/
	${INSTALL_DATA} ${WRKSRC}/libsoup/.libs/libsoup-gnome-2.4.so ${PREFIX}/lib/
	${INSTALL_DATA} ${WRKSRC}/libsoup/.libs/libsoup-gnome-2.4.so.1 ${PREFIX}/lib/
	cd ${WRKSRC}/libsoup && ${GMAKE} install-libsoupgnomeincludeHEADERS
.endif

post-install:
.if defined(SOUP_SLAVE)
	@${MKDIR} ${PREFIX}/libdata/pkgconfig
	@${INSTALL_DATA} ${WRKSRC}/libsoup-gnome-2.4.pc \
		${PREFIX}/libdata/pkgconfig/
.else
	@${INSTALL_DATA} ${WRKSRC}/libsoup/soup-connection.h \
	    	${PREFIX}/include/libsoup-2.4/libsoup/soup-connection.h
.endif

.include <bsd.port.post.mk>

.endif
