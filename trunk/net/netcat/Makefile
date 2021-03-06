# $MidnightBSD$

PORTNAME=	netcat
PORTVERSION=	1.10
PORTREVISION=	3
CATEGORIES=	net ipv6
MASTER_SITES=	ftp://coast.cs.purdue.edu/pub/tools/unix/netutils/netcat/  \
		ftp://ftp.cuhk.edu.hk/pub/packages/security/purdue/netutils/netcat/  \
		http://www.planetmirror.com/pub/lprng/TOOLS/
DISTNAME=	nc110
EXTRACT_SUFX=	.tgz

PATCH_SITES=	ftp://sith.mimuw.edu.pl/pub/users/baggins/IPv6/
PATCHFILES=	nc-v6-20000918.patch.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple utility which reads and writes data across network connections
LICENSE=	unknown

NO_WRKSUBDIR=	yes
ALL_TARGET=	freebsd

OPTIONS=	IPV6 "enable IPv6 support" on \
		TELNET "enable TELNET support" on \
		GAPING "enable GAPING_SECURITY_HOLE support" on

PLIST_FILES=	bin/netcat
PORTDOCS=	README
MAN1=		netcat.1

.include <bsd.port.pre.mk>

.if defined (WITH_IPV6)
XFLAGS+=	-DIPV6
.endif

.if defined (WITH_TELNET)
XFLAGS+=	-DTELNET
.endif

.if defined (WITH_GAPING)
XFLAGS+=	-DGAPING_SECURITY_HOLE
.endif

MAKE_ENV=	XFLAGS="${XFLAGS}"

post-patch:
	${SED} -e 's|%%DOCSDIR%%|${DOCSDIR}|g' ${FILESDIR}/nc.1 > ${WRKDIR}/${PORTNAME}.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/nc ${PREFIX}/bin/${PORTNAME}
	${INSTALL_MAN} ${WRKDIR}/${PORTNAME}.1 ${PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
