# $MidnightBSD: mports/security/skipfish/Makefile,v 1.1 2010/03/21 20:31:47 laffer1 Exp $

PORTNAME=	skipfish
PORTVERSION=	1.07b
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://skipfish.googlecode.com/files/
DISTFILES=	${PORTNAME}-${PORTVERSION}.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File and block device wiping utility
LICENSE=	apache2

LIB_DEPENDS=	idn.16:${PORTSDIR}/dns/libidn

USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}
SUB_FILES=	pkg-message
SUB_LIST=	DATADIR="${DATADIR}"
MAKE_JOBS_SAFE=	yes

.include <bsd.port.pre.mk>

do-install:
	@${INSTALL} ${WRKSRC}/skipfish ${PREFIX}/bin/
	@${MKDIR} ${DATADIR}
	@(cd ${WRKSRC} && ${PAX} -rw dictionaries ${DATADIR})
	(cd ${WRKSRC} && ${PAX} -rw assets ${DATADIR})

.include <bsd.port.post.mk>
