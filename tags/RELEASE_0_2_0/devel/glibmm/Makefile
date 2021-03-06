# New ports collection makefile for:    glibmm
# Date created:         		04 December 2003
# Whom:                 		Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/devel/glibmm/Makefile,v 1.5 2008/06/13 06:28:03 laffer1 Exp $
# $FreeBSD: ports/devel/glibmm/Makefile,v 1.22 2006/06/07 06:08:04 marcus Exp $
#   $MCom: ports/devel/glibmm/Makefile,v 1.31 2006/04/14 21:55:21 mezz Exp $
#

PORTNAME=	glibmm
PORTVERSION=	2.16.3
PORTREVISION?=	0
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interfaces for glib2
LICENSE=	lgpl

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	sigc-2.0.0:${PORTSDIR}/devel/libsigc++20
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget glib20
USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static

PLIST_SUB=	VERSION="2.4" API_VERSION="2.4"

post-patch:
.for d in docs examples tests
	@${REINPLACE_CMD} -e '/^SUBDIRS = /s/${d}//' ${WRKSRC}/Makefile.in
.endfor

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/docs/reference/beautify_docs.pl \
		${PREFIX}/lib/glibmm-2.4/proc

.include <bsd.port.mk>

.endif
