# New ports collection makefile for:   libIDL
# Date Created:			12 February 2002
# Whom:				Maxim Sobolev <sobomax@FreeBSD.org>
#
# $FreeBSD: ports/devel/libIDL/Makefile,v 1.40 2006/07/24 15:03:26 ahze Exp $
#    $MCom: ports/devel/libIDL/Makefile,v 1.5 2006/07/24 14:11:11 ahze Exp $

PORTNAME=	libIDL
PORTVERSION=	0.8.7
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/0.8
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for creating trees of CORBA IDL files

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_BISON=	yes
USE_GNOME=	gnomehack glib20
INSTALLS_SHLIB=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

INFO=		libIDL2

.include <bsd.port.mk>
