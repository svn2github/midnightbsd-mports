# New ports collection makefile for:	pico
# Date created:			16 December 2000
# Whom:				Jeremy Shaffner <jeremy@external.org>
#
# $MidnightBSD$
# $FreeBSD: ports/editors/pico/Makefile,v 1.20 2006/08/28 06:03:13 dougb Exp $
#
# All patch files have been taken from mail/pine4

PORTNAME=	pico
PORTVERSION=	4.64
CATEGORIES=	editors
MASTER_SITES=	ftp://ftp.cac.washington.edu/pine/ \
		http://mirror.sit.wisc.edu/pub/net/mail/pine/ \
		ftp://sunsite.icm.edu.pl/pub/unix/mail/pine/ \
		ftp://ftp.uni-magdeburg.de/pub/mirror/ftp.cac.washington.edu/pine/ \
		ftp://ftp.fu-berlin.de/unix/mail/pine/ \
		ftp://ftp.ut.ee/pub/unix/mail/pine/ \
		ftp://gd.tuwien.ac.at/infosys/mail/pine/ \
		http://dougbarton.us/Downloads/
DISTNAME=	pine${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PIne's message COmposition editor

OPTIONS=	ISPELL "Use ispell as the spell checker" on \
		NO_SPELLER "Do not use a spell checker" off

.include <bsd.port.pre.mk>

.if !defined(WITH_NO_SPELLER)
.if !defined(WITHOUT_ISPELL)
RUN_DEPENDS=	ispell:${PORTSDIR}/textproc/ispell
.endif
.endif

WRKSRC=		${WRKDIR}/pine${PORTVERSION}/pico
PATCH_WRKSRC=	${WRKSRC}/..

MAKEFILE=	makefile.bsf
ALL_TARGET=	pico

MAN1=		pico.1
PLIST_FILES=	bin/pico

post-patch:
	${CP} ${WRKSRC}/osdep/os-bsf.h ${WRKSRC}/osdep/os-bsf.h.presed
	${SED} -e "s:@@PREFIX@@:${PREFIX}:g" \
	${WRKSRC}/osdep/os-bsf.h.presed > ${WRKSRC}/osdep/os-bsf.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/pico ${PREFIX}/bin/pico
	${INSTALL_MAN} ${WRKSRC}/../doc/pico.1 ${PREFIX}/man/man1/pico.1

.include <bsd.port.post.mk>
