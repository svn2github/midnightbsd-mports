# New ports collection makefile for:	x11vnc
# Date created:				7 June 2005
# Whom:					Loren M. Lang
#
# $MidnightBSD: mports/net/x11vnc/Makefile,v 1.1 2008/01/30 22:20:01 laffer1 Exp $
# $FreeBSD: ports/net/x11vnc/Makefile,v 1.10 2007/10/10 01:16:52 araujo Exp $
#

PORTNAME=	x11vnc
PORTVERSION=	0.9.3
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_EXTENDED}
MASTER_SITE_SUBDIR=libvncserver

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server for use with real X displays

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg

USE_GNOME=	gnometarget
USE_XLIB=	yes
GNU_CONFIGURE=	yes
USE_GCC=	3.4+
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		x11vnc.1
PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README README.LibVNCServer TODO

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' \
		${WRKSRC}/configure

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
