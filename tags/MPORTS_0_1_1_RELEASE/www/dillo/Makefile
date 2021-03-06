# New ports collection makefile for:   dillo
# Date created:        23 February 2001
# Whom:                George Reid <greid@ukug.uk.freebsd.org>
#
# $MidnightBSD$
# $FreeBSD: ports/www/dillo/Makefile,v 1.36 2006/06/03 02:01:25 mnag Exp $
#
# Tunables:
# WITH_DILLO_SSL: enable experimental SSL support
# WITH_DILLO_DLGUI: enable experimental FLTK2 based gui for file downloads
#

PORTNAME=	dillo
PORTVERSION=	0.8.6
CATEGORIES=	www ipv6
MASTER_SITES=	http://www.dillo.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast, small graphical Web browser built upon GTK+

RUN_DEPENDS=	wget:${PORTSDIR}/ftp/wget
LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png

USE_BZIP2=	yes
USE_GNOME=	gnometarget gtk12
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--enable-cookies --enable-ipv6 --enable-threaded-dns \
		--libdir=${PREFIX}/libexec

.if defined(WITH_DILLO_SSL)
CONFIGURE_ARGS+=	--enable-ssl
EXTRA_PATCHES+=	${PATCHDIR}/enable-ssl.patch
USE_OPENSSL=	yes
.else
CONFIGURE_ARGS+=	--disable-ssl
.endif

.if defined(WITH_DILLO_DLGUI)
CONFIGURE_ARGS+=	--enable-dlgui
BUILD_DEPENDS+=	fltk>=2.0.r4825:${PORTSDIR}/x11-toolkits/fltk2
CPPFLAGS+=	-I${X11BASE}/include
LDFLAGS+=	-L${X11BASE}/lib
.else
CONFIGURE_ARGS+=	--disable-dlgui
.endif

CONFLICTS=	dillo-i18n-*[0-9]*

post-patch:
	@${REINPLACE_CMD} -e 's|-pthread|${PTHREAD_LIBS}|g ; \
		 s|-D_THREAD_SAFE|${PTHREAD_CFLAGS}|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|dillorc|dillorc.sample|g' ${WRKSRC}/Makefile.in
	@${CP} ${WRKSRC}/dillorc ${WRKSRC}/dillorc.sample

pre-configure:
.if !defined(WITH_DILLO_SSL)
	@${ECHO_CMD} ""
	@${ECHO_CMD} "   Set WITH_DILLO_SSL=yes in your make environment or on the"
	@${ECHO_CMD} "   commandline to enable experimental SSL support."
.endif
.if !defined(WITH_DILLO_DLGUI)
	@${ECHO_CMD} ""
	@${ECHO_CMD} "   Set WITH_DILLO_DLGUI=yes in your make environment or on the"
	@${ECHO_CMD} "   commandline to enable a FLTK2 based gui for download operations."
.endif
	@${ECHO_CMD} ""

.include <bsd.port.mk>
