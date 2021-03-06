# $MidnightBSD$

PORTNAME=	gstreamer
PORTVERSION=	0.10.36
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gstreamer/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Development framework for creating media applications

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

CFLAGS:=	${CFLAGS} -O2 -Wno-format
USES=		bison gmake libtool:keepla pathfix pkgconfig tar:bzip2
USE_GNOME=	glib20 introspection libxml2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-tests \
		--disable-examples \
		--disable-failing-tests \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	ac_cv_func_register_printf_function="no"
PLIST_SUB=	VERSION="${GST_VERSION}"
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
GST_VERSION=	0.10

OPTIONS_DEFINE=	LIBCHECK NLS
LIBCHECK_DESC=	Unit tests support

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MLIBCHECK}
LIB_DEPENDS+=	libcheck.so:${PORTSDIR}/devel/libcheck
PLIST_SUB+=	CHECK=""
.else
CONFIGURE_ARGS+=--disable-check
PLIST_SUB+=	CHECK="@comment "
.endif

# workaround a crash in clang 3.3 crash llvm bug # 15840
USE_GCC=	any

BUILD_DEPENDS+=	${LOCALBASE}/bin/flex:${PORTSDIR}/textproc/flex
CONFIGURE_ENV+=	FLEX_PATH="${LOCALBASE}/bin/flex"

.if ${PORT_OPTIONS:MNLS}
USES+=	gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
