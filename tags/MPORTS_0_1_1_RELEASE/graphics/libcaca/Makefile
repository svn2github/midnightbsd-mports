# New ports collection makefile for:   libcaca
# Date created:			11 January 2004
# Whom:				Vincent Tantardini <vinc@FreeBSD-fr.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/libcaca/Makefile,v 1.15 2006/10/05 19:17:34 mezz Exp $

PORTNAME=	libcaca
PORTVERSION=	0.9
PORTREVISION=	5
CATEGORIES=	graphics
MASTER_SITES=	http://libcaca.zoy.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphics library that outputs text instead of pixels

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -lm -lncurses"
CONFIGURE_ARGS=	--enable-ncurses --disable-doc

MAN1=		caca-config.1 cacademo.1 cacaview.1

.if defined(WITHOUT_X11)
CONFIGURE_ARGS+=	--disable-x11
.else
USE_XLIB=	yes
.endif
.if defined(WITHOUT_IMLIB2)
CONFIGURE_ARGS+=	--disable-imlib2
.else
LIB_DEPENDS+=		Imlib2.3:${PORTSDIR}/graphics/imlib2
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_SLANG) || exists(${LOCALBASE}/lib/libslang.so)
LIB_DEPENDS+=		slang.1:${PORTSDIR}/devel/libslang
CONFIGURE_ARGS+=	--enable-slang
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,-g -O2 ,,g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's,: install-docDATA,:,g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's,resize_term,resizeterm,g' ${WRKSRC}/src/graphics.c

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in README BUGS TODO AUTHORS NEWS NOTES THANKS
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
