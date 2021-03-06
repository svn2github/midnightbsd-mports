# $MidnightBSD$

PORTNAME=	libcaca
DISTVERSION=	0.99.beta18
PORTREVISION=	0
CATEGORIES=	graphics
MASTER_SITES=	http://caca.zoy.org/raw-attachment/wiki/libcaca/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphics library that outputs text instead of pixels
LICENSE=	unknown
# this guy has his own license, gpl and lgpl stuff... ?

USE_GNOME=	gnomehack ltverhack pkgconfig
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--disable-doc \
		--enable-ncurses \
		--disable-java \
		--disable-csharp \
		--disable-ruby \
		--disable-python

DOCS=		AUTHORS COPYING COPYING.GPL COPYING.LGPL ChangeLog NEWS \
		NOTES README THANKS
MAN1=		caca-config.1 cacademo.1 cacafire.1 cacaplay.1 cacaserver.1 \
		cacaview.1 img2txt.1

.if defined(WITHOUT_X11)
CONFIGURE_ARGS+=--disable-x11
.else
USE_XORG=	x11
.endif

.if defined(WITHOUT_IMLIB2)
CONFIGURE_ARGS+=--disable-imlib2
.else
USE_EFL+=	imlib2
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_SLANG)
LIB_DEPENDS+=	slang.2:${PORTSDIR}/devel/libslang2
CONFIGURE_ARGS+=--enable-slang
.else
CONFIGURE_ARGS+=--disable-slang
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-g -O2 ||g ; s| -fomit-frame-pointer||g ; \
		s|arpa\/inet.h ||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|: install-docDATA|:|g ; s| csharp||g' \
			${WRKSRC}/Makefile.in

.ifndef (NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
