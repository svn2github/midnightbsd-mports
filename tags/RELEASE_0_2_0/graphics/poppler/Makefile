# New ports collection makefile for:	poppler
# Date created:         03 March 2005
# Whom:                 marcus@FreeBSD.org
#
# $FreeBSD: ports/graphics/poppler/Makefile,v 1.20 2006/09/17 21:51:24 marcus Exp $
#   $MCom: ports/graphics/poppler/Makefile,v 1.23 2006/04/12 17:10:20 ahze Exp $
# $MidnightBSD: mports/graphics/poppler/Makefile,v 1.5 2007/10/21 23:49:43 laffer1 Exp $
#

PORTNAME=	poppler
PORTVERSION=	0.6.4
CATEGORIES=	graphics print
MASTER_SITES=	http://poppler.freedesktop.org/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	A PDF rendering library
LICENSE=	gpl2

RUN_DEPENDS=	poppler-data>0:${PORTSDIR}/graphics/poppler-data

USE_GMAKE=	yes
USE_XLIB=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack gnometarget libxml2
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-zlib \
		--enable-xpdf-headers \
		--with-html-dir=${DOCSDIR}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -I${LOCALBASE}/include/freetype2 ${PTHREAD_CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

.if !defined(SLAVEPORT)
OPTIONS=	CAIRO "Enable cairo output backend" on
.endif

.include <bsd.port.pre.mk>

.if defined(SLAVEPORT)
LIB_DEPENDS+=	poppler.2:${PORTSDIR}/graphics/poppler
.if ${SLAVEPORT}=="gtk"
CONFIGURE_ARGS+=--enable-poppler-glib
USE_GNOME+=	gtk20
BUILD_WRKSRC=	${WRKSRC}/glib
INSTALL_WRKSRC=	${WRKSRC}/glib
.else
CONFIGURE_ARGS+=--disable-poppler-glib
.endif 

.if ${SLAVEPORT}=="qt"
CONFIGURE_ARGS+=--enable-poppler-qt
USE_QT_VER+=	3
BUILD_WRKSRC=	${WRKSRC}/qt
INSTALL_WRKSRC=	${WRKSRC}/qt
# blah.. USE_QT_VER can't be defined after bsd.port.pre.mk
.include "${PORTSDIR}/Mk/bsd.kde.mk"
.else
CONFIGURE_ARGS+=--disable-poppler-qt
.endif

.if ${SLAVEPORT}=="qt4"
CONFIGURE_ARGS+=--enable-poppler-qt4
USE_QT_VER+=	4
QT_COMPONENTS=	gui corelib xml qtestlib
#BUILD_WRKSRC=	${WRKSRC}/qt4
INSTALL_WRKSRC=	${WRKSRC}/qt4
.else
CONFIGURE_ARGS+=--disable-poppler-qt4
.endif

.if ${SLAVEPORT}=="utils"
CONFIGURE_ARGS+=--enable-utils
CONFLICTS=	xpdf-[0-9]*
BUILD_WRKSRC=	${WRKSRC}/utils
INSTALL_WRKSRC=	${WRKSRC}/utils
MAN1=	pdffonts.1 pdfimages.1 pdfinfo.1 \
	pdftohtml.1  pdftops.1 pdftotext.1 pdftoppm.1
.else 
CONFIGURE_ARGS+=--disable-utils
.endif

.else
CONFIGURE_ARGS+=--disable-poppler-glib --disable-poppler-qt \
		--disable-poppler-qt4 --disable-utils
.if defined(WITHOUT_CAIRO)
CONFIGURE_ARGS+=	--disable-cairo-output
.else
LIB_DEPENDS+=		cairo.2:${PORTSDIR}/graphics/cairo
.endif
.endif

post-patch:
.if defined(SLAVEPORT) && ${SLAVEPORT}=="qt"
	@${REINPLACE_CMD} -e 's|/usr/local/qt/include|${PREFIX}/include|; \
		s|/usr/local/qt/lib|${PREFIX}/lib|' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|$$QTDIR|${PREFIX}|' ${WRKSRC}/configure
.endif

post-install:
.if defined(SLAVEPORT)
.if ${SLAVEPORT}=="gtk"
	${INSTALL_DATA} ${WRKSRC}/poppler-glib.pc ${PREFIX}/libdata/pkgconfig
.elif ${SLAVEPORT}=="qt"
	${INSTALL_DATA} ${WRKSRC}/poppler-qt.pc ${PREFIX}/libdata/pkgconfig
.elif ${SLAVEPORT}=="qt4"
	${INSTALL_DATA} ${WRKSRC}/poppler-qt4.pc ${PREFIX}/libdata/pkgconfig
.endif
.endif

.include <bsd.port.post.mk>
