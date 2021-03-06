# New ports collection makefile for:	polypaudio
# Date created:		29 October 2004
# Whom:			Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD: ports/audio/polypaudio/Makefile,v 1.10 2006/11/05 02:38:49 mezz Exp $
# $MidnightBSD: mports/audio/polypaudio/Makefile,v 1.1 2007/01/25 23:15:56 laffer1 Exp $
#

PORTNAME=	polypaudio
PORTVERSION=	0.7
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	http://0pointer.de/lennart/projects/polypaudio/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound server for UNIX

BUILD_DEPENDS=	lynx:${PORTSDIR}/www/lynx
LIB_DEPENDS=	samplerate.1:${PORTSDIR}/audio/libsamplerate

USE_GNOME=	gnometarget gnomehack glib20
WANT_GNOME=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libltdl:15
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GETOPT_LONG=yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="-lm"

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mglib12}!=""
USE_GNOME+=	glib12
PLIST_SUB+=	GLIB12=""
.else
PLIST_SUB+=	GLIB12="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/polyp/default.pa.in
	@${REINPLACE_CMD} -e 's|seq|jot|' \
		${WRKSRC}/polyp/esdcompat.sh.in

post-install:
.for ii in default.pa daemon.conf client.conf
	${INSTALL_DATA} ${WRKSRC}/polyp/${ii} \
		${PREFIX}/etc/polypaudio/${ii}-dist
.endfor
.if !defined(PACKAGE_BUILDING)
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif

.include <bsd.port.post.mk>
