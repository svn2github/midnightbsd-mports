# $MidnightBSD: mports/devel/libgtop/Makefile,v 1.9 2010/11/17 13:57:59 laffer1 Exp $

PORTNAME=	libgtop
PORTVERSION=	2.28.1
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 top library
LICENSE=	gpl2

RUN_DEPENDS=	lsof:${PORTSDIR}/sysutils/lsof
LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_BZIP2=	yes
USE_PERL5_BUILD=yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20 ltverhack intlhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -lgeom -ldevstat"
CONFIGURE_TARGET=--build=${ARCH}-portbld-freebsd7.0 \
		 --host=${ARCH}-portbld-freebsd7.0 \
		 --target=${ARCH}-portbld-freebsd7.0
CFLAGS+=	-D__FreeBSD_version=700055

INFO=		libgtop2

PKGMESSAGE=	${FILESDIR}/pkg-message

.include <bsd.port.pre.mk>

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${TOUCH} -f

post-install:
	@${CHGRP} kmem ${PREFIX}/bin/libgtop_server2
	@${CHMOD} 2555 ${PREFIX}/bin/libgtop_server2

.include <bsd.port.post.mk>
