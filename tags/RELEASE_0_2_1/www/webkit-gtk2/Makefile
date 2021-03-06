# New ports collection makefile for:	webkit
# Date created:		2007-10-21
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/www/webkit-gtk2/Makefile,v 1.3 2008/07/26 12:08:02 laffer1 Exp $
# $FreeBSD: ports/www/webkit-gtk2/Makefile,v 1.2 2008/03/31 10:33:05 ahze Exp $
#   $MCom: ports/www/webkit-gtk2/Makefile,v 1.5 2008/03/24 01:51:52 mezz Exp $
#

PORTNAME=	webkit
PORTVERSION=	0.0.35289
CATEGORIES=	www
MASTER_SITES=	http://nightly.webkit.org/files/trunk/src/
PKGNAMESUFFIX=	-gtk2
DISTNAME=	WebKit-r${PORTVERSION:S/0.0.//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An opensource browser engine
LICENSE=	lgpl

LIB_DEPENDS=	icutu.38:${PORTSDIR}/devel/icu \
		curl.4:${PORTSDIR}/ftp/curl \
		sqlite3.8:${PORTSDIR}/databases/sqlite3

WANT_GSTREAMER=	yes
USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 libxslt
USE_PERL5=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	autoconf:261 automake:110 libtool:15
USE_GSTREAMER=	gnomevfs theora
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-webkit-target=x11 \
		--enable-icon-database \
		--enable-svg \
		--enable-video
MAKEFILE=	GNUmakefile

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|autoconf|${AUTOCONF}|g ; \
		s|automake|${AUTOMAKE}|g ; s|aclocal|${ACLOCAL}|g ; \
		s|autoheader|${AUTOHEADER}|g ; \
		s|LIBTOOLIZE=libtoolize|LIBTOOLIZE=${LIBTOOLIZE}|g ; \
		s|$$srcdir/configure|#$$srcdir/configure|g' \
			${WRKSRC}/autogen.sh
	@${FIND} ${WRKSRC} -name GNUmakefile.am | ${XARGS} ${REINPLACE_CMD} -e \
		's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g'

pre-configure:
	@(cd ${WRKSRC} && ${SH} autogen.sh)

post-install:
# Install compat pkg-config file so we don't have to patch ports
	${CP} ${PREFIX}/libdata/pkgconfig/webkit-1.0.pc \
		${PREFIX}/libdata/pkgconfig/WebKitGtk.pc

.include <bsd.port.post.mk>
