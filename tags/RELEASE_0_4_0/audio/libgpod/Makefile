# New ports collection makefile for:	libgpod
# Date created:				Wed Jan 1 00:48:58 EST 2006
# Whom:					Devon Ryan <dpryan@dpryan.com>
#
# $MidnightBSD: mports/audio/libgpod/Makefile,v 1.2 2008/02/28 01:31:33 laffer1 Exp $
# $FreeBSD: ports/audio/libgpod/Makefile,v 1.16 2007/08/04 11:40:39 gabor Exp $
#

PORTNAME=	libgpod
PORTVERSION=	0.7.2
CATEGORIES=	audio
MASTER_SITES=	SF/gtkpod/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for direct access of iPod's contents
LICENSE=	lgpl

USE_GNOME=	gtk20
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--without-hal --with-html-dir="${PREFIX}/share/doc"

OPTIONS=	PYTHON	"Enable Python bindings"		off \
		TOOLS	"Build SysInfo detection utility"	off

.include <bsd.mport.options.mk>

.if defined(WITH_PYTHON)
USE_PYTHON=	yes
BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/gtk-2.0/gobject/__init__.py:${PORTSDIR}/devel/py-gobject \
		${PYTHON_SITELIBDIR}/mutagen/__init__.py:${PORTSDIR}/audio/py-mutagen \
		swig:${PORTSDIR}/devel/swig13
RUN_DEPENDS:=	${BUILD_DEPENDS}
PLIST_SUB+=	PYTHON=""
.else
CONFIGURE_ARGS+=	--without-python
PLIST_SUB+=	PYTHON="@comment "
.endif

# SysInfo detection utility is required in order to support iPod classic
# and nano 3G
.if defined(WITH_TOOLS) || exists(${LOCALBASE}/lib/libsgutils.so)
LIB_DEPENDS+=	sgutils.1:${PORTSDIR}/sysutils/sg3_utils
PLIST_FILES+=	bin/ipod-read-sysinfo-extended
.endif

pre-patch: .SILENT
# Adjust pkgconfigdir to the FreeBSD world
	${REINPLACE_CMD} -e \
		's,libdir)/pkgconfig,prefix)/libdata/pkgconfig,' \
			${WRKSRC}/Makefile.in
# Allow to build tools without HAL
	${REINPLACE_CMD} -e \
		'/noinst_PROGRAMS =/s,^,@HAVE_HAL_TRUE@,' \
			${WRKSRC}/tools/Makefile.in
.if defined(NOPORTDOCS)
	${REINPLACE_CMD} -e 's, docs,,' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
