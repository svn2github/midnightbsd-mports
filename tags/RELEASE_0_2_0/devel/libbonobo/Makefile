# New ports collection makefile for:   libbonobo
# Date Created:			14 February 2002
# Whom:				Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libbonobo/Makefile,v 1.4 2008/06/14 14:44:38 laffer1 Exp $
# $FreeBSD: ports/devel/libbonobo/Makefile,v 1.54 2007/03/19 05:13:31 marcus Exp $
#    $MCom: ports/devel/libbonobo/Makefile,v 1.58 2007/03/12 17:59:36 marcus Exp $
#

PORTNAME=	libbonobo
PORTVERSION=	2.22.0
PORTREVISION?=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A component and compound document system for GNOME2
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_GMAKE=	yes
USE_BISON=	build
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_PERL5=	yes
USE_GNOME=	gnomehack intlhack libxml2 orbit2 referencehack
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc \
		--mandir=${PREFIX}/man
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"
MAKE_ENV=	gnomelocaledir=${PREFIX}/share/locale

MAN1=		bonobo-activation-server.1

.include <bsd.port.mk>

.endif
