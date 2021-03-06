# New ports collection makefile for:	liboil
# Date created:				Nov 24, 2004
# Whom:					ijliao
#
# $MidnightBSD: mports/devel/liboil/Makefile,v 1.4 2009/09/20 00:41:19 laffer1 Exp $
# $FreeBSD: ports/devel/liboil/Makefile,v 1.25 2007/03/24 21:50:39 marcus Exp $

PORTNAME=	liboil
PORTVERSION=	0.3.16
CATEGORIES=	devel
MASTER_SITES=	http://liboil.freedesktop.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of optimized inner loops
LICENSE=	bsd2

USE_GNOME=	pkgconfig gnomehack gnometarget ltverhack
USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--disable-glib
CFLAGS+=	-O2

.include <bsd.port.pre.mk>

.if defined(WITH_3DNOW_GCC40)
USE_GCC=	4.2+
.endif

pre-everything::
.if ${MACHINE_CPU:M3dnow}!=""
.if !defined(WITH_3DNOW_GCC40)
	@${ECHO_MSG} "You can enable 3dnow extensions by defining"
	@${ECHO_MSG} "WITH_3DNOW_GCC40=yes"
.endif
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Note: ${PORTNAME} will depend on gcc4.0+ with WITH_3DNOW_GCC40"
	@${ECHO_MSG} "defined."
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|\\$$(libdir)/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|<stdint\.h|<inttypes.h|g' \
		${WRKSRC}/liboil/liboiltypes.h \
		${WRKSRC}/liboil/liboilprofile.h \
		${WRKSRC}/liboil/liboil.h

.include <bsd.port.post.mk>
