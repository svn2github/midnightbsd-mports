# ex:ts=8
# Ports collection makefile for:	yasm
# Date created:			Apr 7, 2003
# Whom:				ijliao
#
# $MidnightBSD$
# $FreeBSD: ports/devel/yasm/Makefile,v 1.15 2006/12/09 03:38:17 shaun Exp $
#

PORTNAME=	yasm
PORTVERSION=	0.5.0
CATEGORIES=	devel lang
MASTER_SITES=	http://www.tortall.net/projects/yasm/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A complete rewrite of the NASM assembler

USE_ICONV=	yes
USE_AUTOTOOLS=	autoconf:259 libltdl:15
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CXXFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.pre.mk>

.if ${ARCH} == "ia64"
CFLAGS:=	${CFLAGS:C/-O[0-9]//g}
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
.else
USE_GETTEXT=	yes
.endif

.if !defined(NOPORTDOCS)
INSTALL_TARGET=	install install-man
MAN1=		yasm.1
MAN7=		yasm_arch.7
.endif

.include <bsd.port.post.mk>
