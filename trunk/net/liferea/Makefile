# $MidnightBSD$
# $FreeBSD: ports/net/liferea/Makefile,v 1.148 2010/12/04 07:32:56 ade Exp $

PORTNAME=	liferea
PORTVERSION=	1.6.5
CATEGORIES=	net gnome
MASTER_SITES=	SF/${PORTNAME}/Liferea%20Stable/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple RSS/RDF feed reader
LICENSE=	gpl2

LIB_DEPENDS=	sqlite3.8:${PORTSDIR}/databases/sqlite3 \
		webkit-1.0.13:${PORTSDIR}/www/webkit-gtk2

USE_GNOME=	gnomeprefix gnomehack libglade2 gconf2
USE_GMAKE=	yes
USES=	libtool
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
MAKE_JOBS_SAFE=	yes

MAN1=		liferea.1
MANLANG=	"" pl
GCONF_SCHEMAS=	liferea.schemas
INSTALLS_ICONS=	yes

OPTIONS=	LIBNOTIFY "Enable libnotify support" on

.include <bsd.port.pre.mk>

.ifdef WITHOUT_LIBNOTIFY
CONFIGURE_ARGS+=--disable-libnotify
PLIST_SUB+=	NOTIFY="@comment "
.else
LIB_DEPENDS+=	notify.1:${PORTSDIR}/devel/libnotify
PLIST_SUB+=	NOTIFY=""
.endif

.include <bsd.port.post.mk>
