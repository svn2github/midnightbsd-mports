# New ports collection makefile for:	popd
# Date created:				17 April 2001
# Whom:					ianf@za.uu.net
#
# $FreeBSD: ports/mail/popd/Makefile,v 1.19 2005/06/16 16:35:10 ume Exp $
# $MidnightBSD$
#

PORTNAME=	popd
PORTVERSION=	2.2.2a
PORTREVISION=	4
CATEGORIES=	mail
MASTER_SITES=	ftp://ftp3.za.freebsd.org/pub/popd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Very fast, highly configurable POP3 server (fully RFC1939 compliant)

MAN5=	popd.conf.5
MAN8=	popd.8

INSTALLS_SHLIB=	yes
MANCOMPRESSED=	maybe
.if defined(NOPROFILE)
PLIST_SUB=	NOPROFILE="@comment "
.else
PLIST_SUB=	NOPROFILE=""
.endif

post-install:
	${INSTALL_DATA} ${WRKSRC}/src/popd.conf.default ${PREFIX}/etc/.

.include <bsd.port.mk>
