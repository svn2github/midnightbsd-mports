# New ports collection makefile for:	limewire
# Date created:				Fri Feb 22 00:28:41 CST 2002
# Whom:					Kyle Martin <mkm@ieee.org> et al
#
# $MidnightBSD$
# $FreeBSD: ports/net-p2p/limewire/Makefile,v 1.30 2007/05/19 20:20:07 flz Exp $
#

PORTNAME=	limewire
PORTVERSION=	4.12.11
PORTEPOCH=	1
CATEGORIES=	net-p2p java
MASTER_SITES=	http://www10.limewire.com/download/
DISTNAME=	LimeWireOther

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Java based Gnutella client

RUN_DEPENDS=	java:${PORTSDIR}/java/javavmwrapper

USE_ZIP=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.3+
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/LimeWire

DATADIR=	${JAVASHAREDIR}/${PORTNAME}

SUB_FILES=	${PORTNAME}.sh

post-extract:
	@cd ${WRKSRC} && \
		${RM} -f *.exe *.dll *.so *.sh cygwin.* COPYING SOURCE && \
		${MV} README.txt ..

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh ${PREFIX}/bin/${PORTNAME}
	${MKDIR} ${DATADIR}
	${CP} -R ${WRKSRC}/* ${DATADIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/README.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
