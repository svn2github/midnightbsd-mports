# Ports collection makefile for:  libnet
# Date created:			Sun Feb 3, 1999
# Whom:				shipley@dis.org
#
# $FreeBSD: ports/net/libnet10/Makefile,v 1.17 2005/11/15 06:50:28 ade Exp $
# $MidnightBSD$
#

PORTNAME=	libnet
PORTVERSION=	1.0.2a
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	net
MASTER_SITES=	http://www.packetfactory.net/libnet/dist/
PKGNAMESUFFIX=	10

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A C library for creating IP packets

CONFLICTS=	libnet-devel-1.1.*\
		libnet-1.1.*

USE_AUTOTOOLS=	autoconf:213

WRKSRC=		${WRKDIR}/Libnet-${PORTVERSION}
MAN3=		libnet.3

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/libnet.3 ${PREFIX}/man/man3
.if !defined(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/share/doc/libnet
	@${MKDIR} ${PREFIX}/share/doc/libnet/examples
	@${MKDIR} ${PREFIX}/share/doc/libnet/ancillary
.for i in CHANGELOG CHANGELOG-NEWFUNCTIONS COPYING README TODO-1.0 TODO-1.1
	${INSTALL_DATA} ${WRKSRC}/doc/${i} ${PREFIX}/share/doc/libnet
.endfor
.for i in README.asn.1 README.bpf README.legacy-applications README.libnet-config README.linux README.rawsockets
	${INSTALL_DATA} ${WRKSRC}/doc/Ancillary/${i} ${PREFIX}/share/doc/libnet/ancillary
.endfor
.for i in libnet-example-1.c libnet-example-2.c libnet-example-3.c libnet-example-4.c
	${INSTALL_DATA} ${WRKSRC}/example/${i} ${PREFIX}/share/doc/libnet/examples
.endfor
.endif

.include <bsd.port.mk>
