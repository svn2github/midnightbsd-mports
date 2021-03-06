# $MidnightBSD$

PORTNAME=	fltk
PORTVERSION=	1.3.2
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_EASYSW}
MASTER_SITE_SUBDIR=	fltk/${PORTVERSION}
DISTNAME=	${PORTNAME}-${PORTVERSION}-source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform C++ graphical user interface toolkit
LICENSE=	lgpl

LIB_DEPENDS=	png15:${PORTSDIR}/graphics/png \
		jpeg:${PORTSDIR}/graphics/jpeg

USE_LDCONFIG=	yes
USE_XORG=	xft
USE_GL=		glu
USE_PKGCONFIG=	build
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--enable-threads \
		--enable-shared \
		--enable-xft

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${WRKSRC}/src -L${LOCALBASE}/lib

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

PORTDOCS=	*

MAN1=	fltk-config.1 fluid.1
MAN3=	fltk.3

post-patch:
	prefix="${PREFIX}" ; plength=$$(($${#prefix}+10)) ; \
	${REINPLACE_CMD} -e "\|/etc/fltk|{s||${PREFIX}&|;s|10|$${plength}|;}" \
	${WRKSRC}/src/Fl_Preferences.cxx

.if !defined(NOPORTDOCS)
post-install:
	cd ${WRKSRC}/documentation && ${MAKE} ${FAKE_MAKEARGS} docinstall
	cd ${WRKSRC}/test && ${MAKE} ${FAKE_MAKEARGS} install
.endif

.include <bsd.port.mk>
