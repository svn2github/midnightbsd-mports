# New ports collection makefile for:  rat
# Date created:			      3 July 1999
# Whom:				      O.Hodson@cs.ucl.ac.uk (Orion Hodson)
#
# $MidnightBSD: mports/mbone/rat/Makefile,v 1.3 2007/11/07 21:49:00 ctriv Exp $
# $FreeBSD: ports/mbone/rat/Makefile,v 1.37 2007/03/03 18:32:58 kris Exp $
#

PORTNAME=	rat
PORTVERSION=	4.2.25
PORTREVISION=	2
CATEGORIES=	mbone audio ipv6 tk
MASTER_SITES=								      \
	http://www-mice.cs.ucl.ac.uk/multimedia/software/rat/releases/${PORTVERSION}/ \
	http://www.icir.org/hodson/ucl-mirror/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPv4/v6 Multicast and unicast audio conferencing tool
LICENSE=	bsd4

TCLTK_VERSION=	8.3
LIB_DEPENDS=	tk83.1:${PORTSDIR}/x11-toolkits/tk83

USE_AUTOTOOLS=	autoconf:213
USE_GMAKE=	yes
CONFIGURE_ARGS=	--x-libraries=${X11BASE}/lib --x-includes=${X11BASE}/include

MAN1=		rat.1
MANCOMPRESSED=	no

RAT_BUILD_DIRS=	common rat
RAT=		${PORTNAME}-${PORTVERSION}
RAT_SCRIPT=	${PORTNAME}
PLIST_SUB=	PORTVERSION=${PORTVERSION}

.include <bsd.port.pre.mk>

ENABLE_IPv6=	--enable-ipv6

post-patch:
	${REINPLACE_CMD} -e "s,-Werror,," ${WRKSRC}/common/configure.in \
		${WRKSRC}/rat/configure.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rat/${RAT} ${PREFIX}/bin/${RAT}
	${INSTALL_PROGRAM} ${WRKSRC}/rat/${RAT}-ui ${PREFIX}/bin/${RAT}-ui
	${INSTALL_PROGRAM} ${WRKSRC}/rat/${RAT}-media ${PREFIX}/bin/${RAT}-media
	${INSTALL_SCRIPT} ${WRKSRC}/rat/${RAT_SCRIPT} ${PREFIX}/bin/${RAT_SCRIPT}
	${INSTALL_MAN}  ${WRKSRC}/rat/man/man1/rat.1 ${PREFIX}/man/man1
	${MKDIR} ${PREFIX}/etc/sdr/plugins
	${INSTALL_DATA} ${WRKSRC}/rat/sdr2.plugin.S02.audio.rtp.*.${RAT} ${PREFIX}/etc/sdr/plugins

do-build:
	cd ${WRKSRC}/common/src && ${GMAKE}
	cd ${WRKSRC}/rat && ${GMAKE}

run-autotools::
	@${DO_NADA}

do-configure:
	cd ${WRKSRC}/common && ${AUTOCONF} && ./configure ${CONFIGURE_ARGS} ${ENABLE_IPv6}
	cd ${WRKSRC}/rat && ${AUTOCONF} && ./configure ${CONFIGURE_ARGS} --with-tcl=${LOCALBASE} --with-tk=${LOCALBASE} ${ENABLE_IPv6} --with-tcltk-version=${TCLTK_VERSION}

.include <bsd.port.post.mk>
