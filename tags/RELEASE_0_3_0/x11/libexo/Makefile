# New ports collection makefile for:	libexo
# Date created:		23 October 2004
# Whom:			Matt Lancereau <ports@FreeBSD.org>
#
# $MidnightBSD: mports/x11/libexo/Makefile,v 1.2 2008/11/07 18:24:16 ctriv Exp $
# $FreeBSD: ports/x11/libexo/Makefile,v 1.28 2008/06/06 14:09:03 edwin Exp $

PORTNAME=	libexo
PORTVERSION=	0.3.100
CATEGORIES=	x11 xfce
DISTNAME=	exo-${PORTVERSION}
MASTER_SITES=	${MASTER_SITE_XFCE}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal library, extensions to Xfce by os-cillation
LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/URI.pm:${PORTSDIR}/net/p5-URI
RUN_DEPENDS=	${BUILD_DEPENDS}

WRKSRC=		${WRKDIR}/${DISTNAME}

GNU_CONFIGURE=	yes
INSTALLS_ICONS= yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 gnomehack gnometarget gtk20 intltool intlhack pkgconfig
USE_LDCONFIG=	yes
USE_PERL5=	yes
USE_XFCE=	configenv xfconf

OPTIONS=	HAL	"Enable HAL support"			on \
		NOTIFY  "Enable notification support"		on \
		PYTHON	"Enable Python support"			off 

MAN1=		exo-csource.1 exo-open.1

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_HAL)
CONFIGURE_ARGS+=--enable-hal
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
.else
CONFIGURE_ARGS+=--disable-hal
.endif

.if !defined(WITHOUT_NOTIFY)
CONFIGURE_ARGS+=--enable-notifications
LIB_DEPENDS+=	notify.1:${PORTSDIR}/devel/libnotify
PLIST_SUB+=	NOTIFY=""
.else
CONFIGURE_ARGS+=--disable-notifications
PLIST_SUB+=	NOTIFY="@comment "
.endif

.if defined(WITH_PYTHON)
CONFIGURE_ARGS+=--enable-python
USE_PYTHON=	yes
BUILD_DEPENDS+=	${PYTHON_SITELIBDIR}/pygtk.py:${PORTSDIR}/x11-toolkits/py-gtk2
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/pygtk.py:${PORTSDIR}/x11-toolkits/py-gtk2
PLIST_SUB+=	PYTHON=""
.else
CONFIGURE_ARGS+=--disable-python
PLIST_SUB+=	PYTHON="@comment "
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|FALSE;;|FALSE;|' ${WRKSRC}/exo/exo-icon-view.c
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
