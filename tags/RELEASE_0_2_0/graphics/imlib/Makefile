# New ports collection makefile for:	imlib
# Date created:		10 June 1997
# Whom:			Yukihiro Nakai <Nakai@Mlab.t.u-tokyo.ac.jp>
#
# $MidnightBSD: mports/graphics/imlib/Makefile,v 1.4 2007/04/29 02:30:39 ctriv Exp $
# $FreeBSD: ports/graphics/imlib/Makefile,v 1.97 2006/05/07 23:46:09 edwin Exp $
#

PORTNAME=	imlib
PORTVERSION=	1.9.15
PORTREVISION=	5
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/imlib/1.9
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphic library for enlightenment package

LIB_DEPENDS=	png.5:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff \
		ungif.5:${PORTSDIR}/graphics/libungif

USE_AUTOTOOLS=        libtool:15
USE_XLIB=     yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gtk12 gnomehack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc/imlib --disable-modules \
		--build=${MACHINE_ARCH}-portbld-freebsd6.0 
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"

MAN1=		imlib-config.1 imlib_config.1

pre-configure:
	@${REINPLACE_CMD} -e "s|10:15:9|5:0:0|" ${WRKSRC}/*/Makefile.in
	@${REINPLACE_CMD} -e "s|glib-config|${GLIB_CONFIG}|" ${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s|@SUPPORT_LIBS@|-L${LOCALBASE}/lib @SUPPORT_LIBS@|" ${WRKSRC}/imlib-config.in

.include <bsd.port.mk>
