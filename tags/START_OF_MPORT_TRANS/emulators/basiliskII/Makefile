# New ports collection makefile for:	BasiliskII
# Date created:				17 April 2000
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/emulators/basiliskII/Makefile,v 1.1 2007/03/09 18:01:54 laffer1 Exp $
# $FreeBSD: ports/emulators/basiliskII/Makefile,v 1.30 2007/01/23 19:08:20 miwi Exp $
#

PORTNAME=	basiliskII
PORTVERSION=	1.0
PORTREVISION=	5
CATEGORIES=	emulators
MASTER_SITES=	http://gwenole.beauchesne.info/projects/basilisk2/files/
MASTER_SITE_SUBDIR=	basilisk
DISTNAME=	BasiliskII_src_01052006

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A free, portable, Open Source 68k Mac emulator

WRKSRC=		${WRKDIR}/BasiliskII-${PORTVERSION}/src/Unix

USE_XLIB=	yes
USE_BZIP2=	yes
USE_GNOME=	esound gtk20
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--disable-fbdev-dga --enable-fpe=uae ac_cv_have_33bit_addressing=no
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

MAN1=		BasiliskII.1

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
BROKEN=	does not compile on AMD64 architectures
.endif

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
