# New ports collection makefile for:	GNU make
# Date created:		11 September 1994
# Whom:			jkh
#
# $MidnightBSD$
# $FreeBSD: ports/devel/gmake/Makefile,v 1.62 2006/06/29 22:39:05 ade Exp $
#

PORTNAME=	gmake
PORTVERSION=	3.81
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	make
DISTNAME=	make-${PORTVERSION}

MAINTAINER=	ade@FreeBSD.org
COMMENT=	GNU version of 'make' utility

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ARGS+=--program-prefix=g
.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE}
PLIST_SUB=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB=	NLS="@comment "
.endif
CONFIGURE_ENV+=	MAKEINFO="/usr/bin/makeinfo --no-split"

MAN1=		gmake.1
INFO=		make

.ifdef USE_GMAKE
.error You have `USE_GMAKE' variable defined either in environment or in make(1) arguments. Please undefine and try again.
.endif

post-patch:
	@${RM} ${WRKSRC}/doc/make.info*

# joerg@freebsd.org says our getloadavg() no longer requires setgid kmem

post-install:
	@${CHMOD} g-s ${PREFIX}/bin/gmake
	@chgrp ${BINGRP} ${PREFIX}/bin/gmake

.include <bsd.port.mk>
