# New ports collection makefile for:	net-mgmt/sysmon
# Date created:				23 January 2003
# Whom:					Manuel Kreutz <mk@nomtec.net>
#
# $FreeBSD: ports/net-mgmt/sysmon/Makefile,v 1.5 2005/11/08 13:40:53 mnag Exp $
# $MidnightBSD: mports/net-mgmt/sysmon/Makefile,v 1.2 2007/06/06 19:32:55 ctriv Exp $
#

PORTNAME=	sysmon
PORTVERSION=	0.92.2
CATEGORIES=	net-mgmt
MASTER_SITES=	ftp://puck.nether.net/pub/jared/ \
		http://titan.oxeo.com/mirror/sysmon.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A network tool designed for high performance and accurate monitoring
LICENSE=	gpl2

DOCS=		Changes.html binaries.html config.html docs.html index.html \
		jclient.jpg net-example.png sysmon.conf.man.html sysmon.jpg \
		sysmon.man.html reporting.xml-spec.txt
MAN8=		sysmon.man.8 sysmon.conf.man.8

GNU_CONFIGURE=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/sysmon ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/sysmond ${PREFIX}/bin
	${INSTALL_DATA} \
		${WRKSRC}/examples/sysmon.conf.dist ${PREFIX}/etc/sysmon.conf.sample

.for man in ${MAN8}
	${INSTALL_MAN} ${WRKSRC}/docs/${man:S/.8//} ${MANPREFIX}/man/man8/${man}
.endfor

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for doc in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
