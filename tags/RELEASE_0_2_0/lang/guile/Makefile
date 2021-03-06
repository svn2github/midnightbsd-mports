# New ports collection makefile for:	guile
# Date created:		2 November 1997
# Whom:			jseger@FreeBSD.org
# 
# $MidnightBSD: mports/lang/guile/Makefile,v 1.4 2008/03/31 03:22:28 laffer1 Exp $
# $FreeBSD: ports/lang/guile/Makefile,v 1.60 2006/06/08 15:54:14 lawrance Exp $
#

PORTNAME=	guile
PORTVERSION=	1.8.5
CATEGORIES=	lang scheme
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	guile

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Ubiquitous Intelligent Language for Extension
LICENSE=	lgpl

LIB_DEPENDS=	gmp.7:${PORTSDIR}/math/libgmp4

USE_AUTOTOOLS=	autoconf:261 libltdl:15
USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnometarget
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0 \
			--host=${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GUILE_VER=	1.8
PLIST_SUB=	GUILE_VER=${GUILE_VER}

REINPLACE_FILES=	libguile/smob.c libguile/filesys.c libguile/gc.c \
			libguile/mallocs.c libguile/eval.c libguile/gc-malloc.c \
			libguile/ports.c libguile/gc-mark.c libguile/gc_os_dep.c


INFO=		goops guile-tut guile r5rs

.include <bsd.port.pre.mk>

post-extract:
	cd ${WRKSRC}; ${CHMOD} u+w ${REINPLACE_FILES}
	@${FIND} ${WRKSRC}/doc -name "*.info*" -delete

post-patch:
	@cd ${WRKSRC} ; \
	  ${REINPLACE_CMD} -e 's|<malloc\.h>|<stdlib.h>|g' ${REINPLACE_FILES}
	@${REINPLACE_CMD} -e 's|%%X11BASE%%|${LOCALBASE}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g' ${WRKSRC}/libguile/load.c

.include <bsd.port.post.mk>
