# New ports collection makefile for:	libpcap
# Date created:		10 December 2003
# Whom:			Bruce M Simpson <bms@FreeBSD.org>
#
# $FreeBSD: ports/net/libpcap/Makefile,v 1.8 2006/08/04 12:34:46 erwin Exp $
# $MidnightBSD: mports/net/libpcap/Makefile,v 1.1 2006/12/26 01:40:46 laffer1 Exp $
#

PORTNAME=	libpcap
PORTVERSION=	0.9.7
CATEGORIES=	net ipv6
MASTER_SITES=	http://www.tcpdump.org/release/ \
		http://www.icrew.org/mirror/tcp_dump/tcpdump_3_9/
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ubiquitous network traffic capture library

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MAN3=		pcap.3

GNU_CONFIGURE=	yes
USE_BISON=	build
USE_LDCONFIG=	yes

.if defined(LIBPCAP_OVERWRITE_BASE)
PREFIX=		/usr
PKGNAMESUFFIX=	-overwrite-base
MANPREFIX=	${TARGETDIR}/share
CONFIGURE_ARGS+=--mandir=${MANPREFIX}/man
PLIST_SUB+=	NOTBASE="@comment "
PLIST_SUB+=	BASE=""
EXTRA_PATCHES+=	${FILESDIR}/patchbase-Makefile.in
PKGMESSAGE=	${FILESDIR}/pkg-message-base
.else
PLIST_SUB+=	BASE="@comment "
PLIST_SUB+=	NOTBASE=""
.endif

.if !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.endif

.if !defined(WITH_DAG)
CONFIGURE_ARGS+=	--without-dag
.endif

.if defined(LIBPCAP_OVERWRITE_BASE)
post-install:
	${CAT} ${PKGMESSAGE}
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-fPIC
.endif

.include <bsd.port.post.mk>
