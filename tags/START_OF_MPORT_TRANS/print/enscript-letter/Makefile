# New ports collection makefile for:	enscript (letter)
# Date created:			24 Jul, 1997
# Whom:				kline
#
# $FreeBSD: ports/print/enscript-letter/Makefile,v 1.29 2006/06/27 03:58:57 rafan Exp $
# $MidnightBSD$
#

PORTNAME=	enscript
PORTVERSION=	1.6.4
PORTREVISION=	1
CATEGORIES+=	print
MASTER_SITES=	http://www.codento.com/people/mtr/genscript/
PKGNAMESUFFIX=	-${PAPERSIZE}
DISTNAME=	enscript-${PORTVERSION}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	ASCII to PostScript filter

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-nls --with-media=${PS}
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0

INFO=		enscript
MAN1=		diffpp.1 enscript.1 sliceprint.1 states.1

PAPERSIZE?=	letter

.if ${PAPERSIZE} == a4
PS=A4
.elif ${PAPERSIZE} == letter
PS=Letter
.elif ${PAPERSIZE} == letterdj
PS=Letterdj
.else
.BEGIN:
	@${ECHO} "Error: invalid value for PAPERSIZE: \"${PAPERSIZE}\""
	@${ECHO} "Possible values are:  a4, letter, or letterdj"
	@${FALSE}
.endif

.include <bsd.port.mk>
