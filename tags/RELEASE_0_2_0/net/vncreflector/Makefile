# Ports collection makefile for:	vncreflector
# Date created:				Wed, Jan 19 2005
# Whom:					Brooks Davis <brooks@freebsd.org>
#
# $MidnightBSD$
# $FreeBSD: ports/net/vncreflector/Makefile,v 1.4 2007/04/24 05:56:39 sobomax Exp $
#

PORTNAME=	vncreflector
PORTVERSION=	1.2.4
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=vnc-reflector
DISTNAME=	vnc_reflector-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-client VNC proxy server

LIB_DEPENDS+=	jpeg.9:${PORTSDIR}/graphics/jpeg

USE_RC_SUBR=	vncreflector.sh

ALL_TARGET=	default
WRKSRC=		${WRKDIR}/vnc_reflector

post-patch:
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/Makefile

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	@${MKDIR} -m0750 ${PREFIX}/etc/${PORTNAME}
	@${CHOWN} root:wheel ${PREFIX}/etc/${PORTNAME}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
