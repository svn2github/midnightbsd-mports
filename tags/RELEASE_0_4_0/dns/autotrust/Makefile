# $MidnightBSD: mports/dns/autotrust/Makefile,v 1.1 2010/09/18 18:08:27 laffer1 Exp $

PORTNAME=	autotrust
PORTVERSION=	0.3.1
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://www.nlnetlabs.nl/downloads/autotrust/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool to automatically update DNSSEC trust anchors
LICENSE=	bsd3

LIB_DEPENDS+=	ldns:${PORTSDIR}/dns/ldns \
		unbound:${PORTSDIR}/dns/unbound

GNU_CONFIGURE=	yes
CFLAGS=		-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -pthread

MAN8=		autotrust.8

PLIST_FILES=	sbin/autotrust \
		etc/autotrust/autotrust.conf.sample
PLIST_DIRS=	etc/autotrust

do-patch:
	${REINPLACE_CMD} \
		'45s!=!\?=!; \
		46s!^\(CFLAGS \)\(= -I.\) @CFLAGS@!\1+\2!' \
		${WRKSRC}/Makefile.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/sbin
	${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.conf.sample ${ETCDIR}
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
