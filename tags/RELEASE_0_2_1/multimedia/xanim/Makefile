# New ports collection makefile for:	xanim
# Date created:         Sat Nov 5 11:43:03 PST 1994
# Whom:                 piero
#
# $MidnightBSD: mports/multimedia/xanim/Makefile,v 1.2 2007/10/31 04:13:58 laffer1 Exp $
# $FreeBSD: ports/multimedia/xanim/Makefile,v 1.41 2005/10/02 05:59:11 dinoex Exp $
#

PORTNAME=	xanim
PORTVERSION=	2.92.0
PORTREVISION=	2
CATEGORIES=	multimedia graphics
MASTER_SITES=	ftp://ftp.informatik.uni-hamburg.de/pub/soft/graphics/xanim/:main \
		${MASTER_SITE_LOCAL} \
		ftp://ftp.informatik.uni-hamburg.de/pub/soft/graphics/xanim/dlls/
MASTER_SITE_SUBDIR=	dinoex
DISTNAME=	xanim2920
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:main ${EXTRA_FILES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Play most popular animation formats and show pictures

USE_IMAKE=	yes
USE_XLIB=	yes
MAN1=		xanim.1
MAKE_ARGS+=	-j 2 # safe and helps even the single-CPU machines
DLLDIR=		${PREFIX}/lib/X11/xanim
PLIST_FILES+=	bin/xanim

post-extract:
	${CP} ${WRKSRC}/docs/xanim.man ${WRKSRC}

.include <bsd.port.pre.mk>

.if (${ARCH} == "i386")
EXTRA_FILES=	vid_cvid_2.1_freebsdELFx86.tgz \
		vid_cyuv_1.0_freebsdELFx86.tgz \
		vid_h261_1.0_freebsdELFx86.tgz \
		vid_h263_1.0_freebsdELFx86.tgz \
		vid_iv32_2.1_freebsdELFx86.tgz \
		vid_iv41_1.1_freebsdELFx86.tgz \
		vid_iv50_1.0_freebsdELFx86.tgz
PLIST_FILES+=	lib/X11/xanim/cvid.readme lib/X11/xanim/cyuv.readme \
		lib/X11/xanim/h261.readme lib/X11/xanim/h263.readme \
		lib/X11/xanim/iv32.readme lib/X11/xanim/iv41.readme \
		lib/X11/xanim/iv50.readme \
		lib/X11/xanim/vid_cvid_2.1_freebsdELFx86.xa \
		lib/X11/xanim/vid_cyuv_1.0_freebsdELFx86.xa \
		lib/X11/xanim/vid_h261_1.0_freebsdELFx86.xa \
		lib/X11/xanim/vid_h263_1.0_freebsdELFx86.xa \
		lib/X11/xanim/vid_iv32_2.1_freebsdELFx86.xa \
		lib/X11/xanim/vid_iv41_1.1_freebsdELFx86.xa \
		lib/X11/xanim/vid_iv50_1.0_freebsdELFx86.xa
PLIST_DIRS+=	lib/X11/xanim

post-install:
	@${MKDIR} ${DLLDIR}
	${INSTALL_DATA} ${WRKDIR}/*.readme ${DLLDIR}
	${INSTALL_DATA} ${WRKDIR}/*.xa ${DLLDIR}
.endif

.include <bsd.port.post.mk>
