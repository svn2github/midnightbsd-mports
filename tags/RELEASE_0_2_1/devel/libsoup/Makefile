# New ports collection makefile for:	libsoup
# Date created:				7 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/devel/libsoup/Makefile,v 1.5 2008/03/21 01:30:02 laffer1 Exp $
# $FreeBSD: ports/devel/libsoup/Makefile,v 1.53 2007/07/01 08:56:12 novel Exp $
#   $MCom: ports/devel/libsoup/Makefile,v 1.36 2006/04/13 07:52:33 bland Exp $
#

PORTNAME=	libsoup
PORTVERSION=	2.4.1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A SOAP (Simple Object Access Protocol) implementation in C
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_GNOME=	gnomehack glib20 libxml2 ltverhack referencehack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
USE_GMAKE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION="2.4"

.if !defined(WITHOUT_SSL)
LIB_DEPENDS+=	gnutls.26:${PORTSDIR}/security/gnutls
.else
CONFIGURE_ARGS+=--disable-ssl
.endif

.include <bsd.port.pre.mk>

pre-everything::
	@${ECHO_MSG} ""
	@${ECHO_MSG} "libsoup has the following configurable option(s):"
	@${ECHO_MSG} "	WITHOUT_SSL	Disable GnuTLS SSL support"
	@${ECHO_MSG} ""

.include <bsd.port.post.mk>

.endif
