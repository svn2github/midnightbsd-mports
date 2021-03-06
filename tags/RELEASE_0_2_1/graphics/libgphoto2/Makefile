# New ports collection makefile for: 	libgphoto2
# Date created:		26 May 1999
# Whom:			Anders Nordby <anders@fix.no>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/libgphoto2/Makefile,v 1.37 2008/05/18 15:08:07 pav Exp $
#

PORTNAME=	libgphoto2
PORTVERSION=	2.4.1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	gphoto

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A universal digital camera picture control tool
LICENSE=	lgpl

LIB_DEPENDS=	usb-0.1.8:${PORTSDIR}/devel/libusb \
		exif.12:${PORTSDIR}/graphics/libexif

USE_BZIP2=	yes
USE_GNOME=	gnometarget pkgconfig ltverhack
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15 libltdl:15
LIBTOOLFILES=	configure libgphoto2_port/configure
USE_LDCONFIG=	yes
CONFIGURE_ENV=	LTDLINCL="-I${LOCALBASE}/include" LIBLTDL="-L${LOCALBASE}/lib -lltdl"
PLIST_SUB=	VERSION="${PORTVERSION}" VERSION_PORT=0.8.0

MAN3=		libgphoto2.3 libgphoto2_port.3

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

post-patch:
.for file in configure libgphoto2_port/configure
	@${REINPLACE_CMD} -e \
		's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|g ; \
		 s|-g -O2||g' ${WRKSRC}/${file}
.endfor
	@${REINPLACE_CMD} -e 's|linux-hotplug ||' ${WRKSRC}/packaging/Makefile.in
	@${REINPLACE_CMD} -e 's|@HAVE_DOXYGEN_TRUE@|#| ; s|@HAVE_DOXYGEN_FALSE@||' ${WRKSRC}/doc/Makefile.in

.include <bsd.port.mk>
