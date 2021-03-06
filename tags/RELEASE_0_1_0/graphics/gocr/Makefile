# New ports collection makefile for:	gocr
# Date created:				03 June 2002
# Whom:					Kay Lehmann
#
# $FreeBSD: ports/graphics/gocr/Makefile,v 1.7 2006/05/07 23:46:04 edwin Exp $
# $MidnightBSD: mports/graphics/gocr/Makefile,v 1.1 2007/01/26 04:03:52 laffer1 Exp $
#

PORTNAME=	gocr
PORTVERSION=	0.40
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	jocr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GOCR/JOCR is an OCR (Optical Character Recognition) program

BUILD_DEPENDS=	latex:${PORTSDIR}/print/teTeX
LIB_DEPENDS=	netpbm.1:${PORTSDIR}/graphics/netpbm

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--with-netpbm=${LOCALBASE}

.if !defined(WITHOUT_X11)
RUN_DEPENDS=	wish8.4:${PORTSDIR}/x11-toolkits/tk84
PLIST_FILES+=	bin/gocr.tcl
.endif

MAN1=		gocr.1

PORTDOCS=	examples.txt gocr.html unicode.txt
PLIST_FILES+=	bin/gocr include/gocr.h lib/libPgm2asc.a
# This port doesn't understand what DESTDIR is supposed to do.
FAKE_MAKEARGS=	${DESTDIRNAME}=${FAKE_DESTDIR}${PREFIX} ${MAKE_ARGS}

post-patch:
.if defined(WITHOUT_X11)
	@${REINPLACE_CMD} -e '/gocr.tcl/d' ${WRKSRC}/src/Makefile.in
.else
	@${REINPLACE_CMD} -e 's/exec wish/exec wish8.4/' ${WRKSRC}/bin/gocr.tcl
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC}/doc && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR})
.endif

.include <bsd.port.mk>
