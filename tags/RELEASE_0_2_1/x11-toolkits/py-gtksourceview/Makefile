# New ports collection makefile for:	py-gtksourceview
# Date created:				25 June 2007
# Whom:					Mezz <mezz@FreeBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/py-gtksourceview/Makefile,v 1.2 2008/06/08 18:40:09 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/py-gtksourceview/Makefile,v 1.1 2007/10/24 23:37:20 marcus Exp $
#   $MCom: ports/x11-toolkits/py-gtksourceview/Makefile,v 1.6 2007/09/17 13:46:28 ahze Exp $
#

PORTNAME=	gtksourceview
PORTVERSION=	2.2.0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/pygtksourceview/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pygtksourceview-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A python bindings for the version 2 of the GtkSourceView library
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnomeprefix gnometarget gtksourceview2 pygtk2
USE_PYTHON=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-docs

post-patch:
	@${REINPLACE_CMD} -e 's| == x| = x|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
