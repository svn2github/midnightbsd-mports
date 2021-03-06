# Ports collection Makefile for:	epiphany-extensions
# Date created:				30 December 2003
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD: ports/www/epiphany-extensions/Makefile,v 1.52 2008/06/06 14:06:51 edwin Exp $
#   $MCom: ports/www/epiphany-extensions/Makefile,v 1.105 2008/03/11 17:19:08 mezz Exp $
# $MidnightBSD$

PORTNAME=	epiphany-extensions
PORTVERSION=	2.22.2
PORTREVISION=	1
CATEGORIES=	www gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of add-ons for the Epiphany web browser
LICENSE=        gpl2     

BUILD_DEPENDS=	epiphany:${PORTSDIR}/www/epiphany
LIB_DEPENDS=	pcre.0:${PORTSDIR}/devel/pcre
RUN_DEPENDS=	epiphany:${PORTSDIR}/www/epiphany

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_GECKO=	firefox xulrunner
USE_GNOME=	gnomeprefix gnomehack intlhack gnometarget
INSTALLS_OMF=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"
CONFIGURE_ARGS=	--with-mozilla=${GECKO}

GCONF_SCHEMAS=	smart-bookmarks.schemas

EPHY_EXTENSIONS=all,rss
EPHY_VERSION=	2.22

PLIST_SUB=	VERSION="2.22" EPHY_VERSION=${EPHY_VERSION}

OPTIONS=	OPENSP "Enable OpenSP SGML support" off

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/www/mozilla/bsd.gecko.mk"

.if defined(WITH_OPENSP)
CONFIGURE_ARGS+=	--enable-opensp=yes
.else
CONFIGURE_ARGS+=	--disable-opensp
.endif

.if exists(${LOCALBASE}/share/pygtk/2.0/defs/epiphany.defs)
USE_PYTHON=	yes
.include "${PORTSDIR}/Mk/bsd.python.mk"
PLIST_SUB+=	PYTHON=""
.else
PLIST_SUB+=	PYTHON="@comment "
.endif

CONFIGURE_ARGS+=--with-extensions="${EPHY_EXTENSIONS}"

pre-everything::
	@${ECHO_MSG} "Epiphany-extensions also supports the following tunable option(s):"
	@${ECHO_MSG} "	WITH_OPENSP=yes		Enable support for OpenSP SGML validation"
	@${ECHO_MSG} ""

.include <bsd.port.post.mk>
