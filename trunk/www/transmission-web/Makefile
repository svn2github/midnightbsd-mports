# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	www net-p2p
PKGNAMESUFFIX=	-web

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and lightweight WebUI for Transmission BitTorrent client

LICENSE=	gpl2

DESCR=		${.CURDIR}/pkg-descr
MASTERDIR=	${.CURDIR}/../../net-p2p/transmission-cli
PLIST=		${NONEXISTENT}
SLAVEPORT=	web

PORTDATA=	web
PORTDOCS=	*

NO_BUILD=	yes

post-extract:
	@${FIND} ${WRKSRC}/web -name Makefile.* -delete

do-install:
	@${MKDIR} ${DATADIR}/web
	@(cd ${WRKSRC}/web && ${COPYTREE_SHARE} \* ${DATADIR}/web)

.include "${MASTERDIR}/Makefile"
