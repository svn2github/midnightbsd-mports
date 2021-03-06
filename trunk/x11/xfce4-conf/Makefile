# $MidnightBSD$
# $FreeBSD: ports/x11/xfce4-conf/Makefile,v 1.11 2010/05/31 15:34:46 oliver Exp $

PORTNAME=	xfce4-conf
PORTVERSION=	4.10.0
PORTREVISION=	4
CATEGORIES=	x11 xfce
MASTER_SITES=	${MASTER_SITE_XFCE}
DISTNAME=	xfconf-${PORTVERSION}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XFce 4 configuration mananger

LICENSE=	gpl2

BUILD_DEPENDS=	p5-XML-Parser>=2.41:${PORTSDIR}/textproc/p5-XML-Parser
LIB_DEPENDS=	dbus-glib-1:${PORTSDIR}/devel/dbus-glib

GNU_CONFIGURE=	yes
USE_GNOME=	glib20 gtk20 intltool intlhack
USE_LDCONFIG=	yes
USE_PERL5_BUILD=	yes
USE_XFCE=	configenv libutil
USE_XORG=	x11
USES=		gmake pathfix pkgconfig tar:bzip2

OPTIONS_DEFINE=		DOCS PERL NLS

MAN3PREFIX?=	${PREFIX}/lib/perl5/${PERL_VER}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
CONFIGURE_ARGS+=--with-html-dir=${PREFIX}/share/gtk-doc/html
PLIST_SUB+=	APIDOCS=""
.else
CONFIGURE_ARGS+=--without-html-dir
PLIST_SUB+=	APIDOCS="@comment "
.endif

.if ${PORT_OPTIONS:MPERL}
MAN3=		Xfce4::Xfconf.3
BUILD_DEPENDS+=	p5-ExtUtils-Depends>=0.300:${PORTSDIR}/devel/p5-ExtUtils-Depends \
		p5-ExtUtils-PkgConfig>=1.12:${PORTSDIR}/devel/p5-ExtUtils-PkgConfig \
		p5-Glib2>=1.200:${PORTSDIR}/devel/p5-Glib2
RUN_DEPENDS+=	${BUILD_DEPENDS}
CONFIGURE_ARGS+=--enable-perl-bindings
PLIST_SUB+=	PERLBIND=""
.else
CONFIGURE_ARGS+=--disable-perl-bindings
PLIST_SUB+=	PERLBIND="@comment "
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
