# New ports collection makefile for:	koffice
# Date created:				Sun May 14 2000 16:33:15
# Whom:					Will Andrews <will@FreeBSD.org>
#
# $FreeBSD: ports/editors/koffice-kde3/Makefile,v 1.93 2006/09/12 23:26:15 lofi Exp $
# $MidnightBSD: mports/editors/koffice-kde3/Makefile,v 1.4 2007/10/20 02:47:47 laffer1 Exp $
#

PORTNAME=	koffice
PORTVERSION=	1.6.3
PORTREVISION=	2
PORTEPOCH=	2
CATEGORIES=	editors kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}-${PORTVERSION:S/a//}/src
DIST_SUBDIR=	KDE/koffice

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Office Suite for KDE3

BUILD_DEPENDS=	${LOCALBASE}/lib/libpqxx.a:${PORTSDIR}/databases/postgresql-libpqxx
LIB_DEPENDS=	GraphicsMagick++:${PORTSDIR}/graphics/GraphicsMagick \
		art_lgpl_2.5:${PORTSDIR}/graphics/libart_lgpl \
		aspell:${PORTSDIR}/textproc/aspell \
		exif.12:${PORTSDIR}/graphics/libexif \
		fontconfig:${PORTSDIR}/x11-fonts/fontconfig \
		freetype:${PORTSDIR}/print/freetype2 \
		lcms:${PORTSDIR}/graphics/lcms \
		paper:${PORTSDIR}/print/libpaper \
		poppler-qt:${PORTSDIR}/graphics/poppler-qt \
		wpd-0.8:${PORTSDIR}/textproc/libwpd \
		wv2:${PORTSDIR}/textproc/wv2 \
		xml2:${PORTSDIR}/textproc/libxml2 \
		xslt:${PORTSDIR}/textproc/libxslt
RUN_DEPENDS=	${LOCALBASE}/lib/libpqxx.a:${PORTSDIR}/databases/postgresql-libpqxx

USE_AUTOTOOLS=  libtool:15
USE_LDCONFIG=	yes
PREFIX=		${KDE_PREFIX}
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_KDELIBS_VER=3
USE_MYSQL=	yes
USE_PYTHON=	yes
USE_RUBY=	yes
USE_PGSQL=	yes

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=--with-pgsqlincdir=${LOCALBASE}/include \
		--with-pgsqllibdir=${LOCALBASE}/lib \
		--with-pqxx-includes=${LOCALBASE}/include \
		--with-pqxx-libraries=${LOCALBASE}/lib

.include <bsd.port.post.mk>
