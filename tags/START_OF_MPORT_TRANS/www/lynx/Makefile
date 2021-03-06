# New ports collection makefile for:    lynx
# Date created:         15 Dec 1994
# Whom:                 ache
#
# $MidnightBSD$
# $FreeBSD: ports/www/lynx/Makefile,v 1.114 2005/12/12 21:33:23 lawrance Exp $
#

PORTNAME=	lynx
PORTVERSION=	2.8.5
PORTREVISION=	2
CATEGORIES=	www ipv6
MASTER_SITES=	http://lynx.isc.org/current/ \
		ftp://lynx.isc.org/lynx2.8.5/patches/:patches
DISTNAME=	${PORTNAME}2.8.5rel.1
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

PATCH_SITES=	ftp://lynx.isc.org/lynx2.8.5/patches/
.for i in 2 3 4
PATCHFILES+=	2.8.5rel.${i}.patch.gz
DISTFILES+=	2.8.5rel.${i}.patch.gz.asc:patches
.endfor
PATCH_DIST_STRIP=	-p1

MAINTAINER?=	jharris@widomaker.com
COMMENT?=	A non-graphical, text-based World-Wide Web client

CONFLICTS?=	lynx-ssl* lynx-current*

USE_GPG?=	yes
SIG_FILES=	${DISTFILES:M*.asc} ${PATCHFILES:M*.asc}
USE_BZIP2=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}2-8-5
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-screen=ncurses --with-zlib --libdir="${L_LIB}" \
		--enable-nsl-fork --enable-persistent-cookies \
		--enable-ipv6

.if defined(ENABLE_DEFAULT_COLORS)
CONFIGURE_ARGS+=--enable-default-colors
.endif

MAKE_ARGS=	helpdir=${L_HELP} docdir=${DOCSDIR}
MAKEFILE=	makefile
INSTALL_TARGET=	install-full
MAN1=		lynx.1

L_LIB=		${PREFIX}/etc
L_HELP=		${PREFIX}/share/lynx_help

post-patch:
	@${RM} -f ${WRKSRC}/CHANGES.orig

post-install:
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${L_HELP}
	${CHOWN} ${SHAREOWN}:${SHAREGRP} ${L_LIB}/lynx.cfg

.include <bsd.port.mk>
