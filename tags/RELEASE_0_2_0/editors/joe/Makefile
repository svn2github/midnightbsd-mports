# New ports collection makefile for:	joe
# Date created:		01 Jul 1995
# Whom:			torstenb@FreeBSD.org
#
# $MidnightBSD: mports/editors/joe/Makefile,v 1.6 2008/04/25 23:50:42 ctriv Exp $
#

PORTNAME=	joe
PORTVERSION=	3.5
PORTREVISION=	1
CATEGORIES=	editors
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}-editor
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Joe's Own Editor
LICENSE=	gpl

# '

BUILD_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell
RUN_DEPENDS=	aspell:${PORTSDIR}/textproc/aspell

CONFLICTS=	joe-2.* jupp

USE_GMAKE=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -liconv"

ALL_TARGET=	${PORTNAME}
MAN1=		${PORTNAME}.1

.include <bsd.port.pre.mk>

post-install:
	@${CAT} ${FILESDIR}/ftyperc.mbsd >> ${PREFIX}/etc/${PORTNAME}/ftyperc
.for file in jmacsrc jpicorc jstarrc rjoerc joerc
.if !exists(${PREFIX}/etc/${PORTNAME}/${file}.dist)
	@${CP} ${PREFIX}/etc/${PORTNAME}/${file} ${PREFIX}/etc/${PORTNAME}/${file}.dist
.endif
.endfor

.include <bsd.port.post.mk>
