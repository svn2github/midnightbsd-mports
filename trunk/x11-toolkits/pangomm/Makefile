# $MidnightBSD$

PORTNAME=	pangomm
PORTVERSION=	2.28.4
PORTREVISION?=	0
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Pango
LICENSE=	gpl2

USE_XZ=		yes

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		pathfix
USE_GNOME=	pango cairomm glibmm
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-documentation \
		--enable-static=yes

PLIST_SUB=	VERSION="2.4" API_VERSION="1.4"

post-patch:
.for d in tests
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/${d}//' \
		${WRKSRC}/Makefile.in
.endfor

.include <bsd.port.mk>

.endif
