# New ports collection makefile for:	vat
# Date created:		2 November 1996
# Whom:			fenner
#
# $MidnightBSD$
# $FreeBSD: ports/mbone/vat/Makefile,v 1.26 2006/12/04 03:12:19 fenner Exp $
#

PORTNAME=	vat
PORTVERSION=	4.0b2
PORTREVISION=	1
CATEGORIES=	mbone tk83
MASTER_SITES=	ftp://ftp.ee.lbl.gov/conferencing/vat/alpha-test/
DISTFILES=	vatsrc-4.0b2.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Visual Audio Tool - multicast audioconferencing

GSM_DIR=	${.CURDIR}/../../audio/gsm
GSM_WORK=	${WRKDIRPREFIX}${GSM_DIR}/work/gsm-1.0-pl12

# If configure is changed to look for libgsm.a in ${PREFIX}/lib, then
# we can use this first BUILD_DEPENDS and save some work.
#BUILD_DEPENDS=	${GSM_WORK}/inc/private.h:${GSM_DIR}:patch
BUILD_DEPENDS=	${GSM_WORK}/lib/libgsm.a:${GSM_DIR}:build
LIB_DEPENDS=	tk83.1:${PORTSDIR}/x11-toolkits/tk83 \
		gsm.1:${GSM_DIR}

USE_X_PREFIX=	yes
USE_AUTOTOOLS=	autoconf:213
CONFIGURE_ARGS=	--with-gsm=${GSM_WORK}
INSTALL_TARGET=	install install-man
MAN1=		vat.1
PLIST_FILES=	bin/vat

.include <bsd.port.pre.mk>

post-install:
	${STRIP_CMD} ${PREFIX}/bin/vat

.include <bsd.port.post.mk>
