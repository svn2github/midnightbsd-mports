# New ports collection makefile for:	libdv
# Date created:				Sun Nov 18 19:42:02 BRST 2001
# Whom:			Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
#
# $MidnightBSD: mports/multimedia/libdv/Makefile,v 1.3 2008/08/13 19:01:29 laffer1 Exp $
# $FreeBSD: ports/multimedia/libdv/Makefile,v 1.36 2006/12/15 13:29:55 nork Exp $
#

PORTNAME=	libdv
PORTVERSION=	0.104
PORTREVISION=	5
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	libdv-${PORTVERSION:C/\.(.)$/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quasar DV codec (libdv): software codec for DV video encoding format
LICENSE=	lgpl

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		popt.0:${PORTSDIR}/devel/popt

USE_GNOME=	gnometarget
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gtk-prefix="${LOCALBASE}" \
		--x-includes="${LOCALBASE}/include" \
		--x-libraries="${LOCALBASE}/lib"
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}" \
		PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:${LOCALBASE}/libdata/pkgconfig
USE_LDCONFIG=	yes

MAN1=	dubdv.1 dvconnect.1 encodedv.1

PORTDOCS=      AUTHORS COPYING COPYRIGHT ChangeLog NEWS README \
		README.dvconnect README.encoder TODO

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mgtk12}!=""
USE_GNOME+=	gtk12
MAN1+=		playdv.1
PLIST_FILES+=	bin/playdv
.else
CONFIGURE_ARGS+=--disable-gtk
.endif

# XXX - work around compiler bug
# Optimizations -O{1,s,2,3} work
# However, lack of -O{1,s,2,3} or -O0 BREAK the build
# Therefore, make sure we have AT LEAST -O and avoid -O0
CONFIGURE_ENV+=	CFLAGS="-O ${CFLAGS:N-O0}"

.ifndef(WITHOUT_SDL)
USE_SDL=	sdl
CONFIGURE_ARGS+= --enable-sdl
.endif

pre-everything::
.ifndef(WITHOUT_SDL)
	@${ECHO_MSG} '===>'
	@${ECHO_MSG} '===> Define WITHOUT_SDL to disable SDL support'
	@${ECHO_MSG} '===>'
.endif

post-patch:
	@${REINPLACE_CMD} -E \
		-e 's|(pkgconfigdir =).+(/pkgconfig)|\1 ${PREFIX}/libdata\2|' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -E -e 's|(-lXv)|\1 -lXext -L${LOCALBASE}/lib|; \
		/objformat=/s|=.*|=elf|; \
		s@(PKG_CONFIG --(cflags|libs) )"\$$REQUIRES"@\1 gtk@' \
		${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}
	@${REINPLACE_CMD} -e 's|stdint.h|sys/types.h|' \
		${WRKSRC}/libdv/dv.h \
		${WRKSRC}/libdv/dv_types.h \
		${WRKSRC}/libdv/headers.c \
		${WRKSRC}/libdv/encode.c
	@${REINPLACE_CMD} -E -e 's|^void swab.+$$||' ${WRKSRC}/libdv/encode.c
	@${REINPLACE_CMD} -e 's|SDL/||' ${WRKSRC}/playdv/display.h
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|' ${WRKSRC}/encodedv/dvavi.c \
		${WRKSRC}/encodedv/dvconnect.c
# XXX - revise at every port update
# protect popt from prefix changes
	@${REINPLACE_CMD} -E -e 's|(@REQUIRES_NOPKGCONFIG@)|-L${LOCALBASE}/include \1|' \
		${WRKSRC}/libdv.pc.in

pre-configure:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|' \
		${WRKSRC}/configure

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
