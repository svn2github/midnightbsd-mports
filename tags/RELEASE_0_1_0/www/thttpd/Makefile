# New ports collection makefile for: 	thttpd
# Date created:		24 May 1999
# Whom:			Anders Nordby <anders@fix.no>
#
# $MidnightBSD: mports/www/thttpd/Makefile,v 1.1 2006/10/02 23:32:50 laffer1 Exp $
# $FreeBSD: ports/www/thttpd/Makefile,v 1.39 2006/02/26 01:12:54 mnag Exp $
#

PORTNAME=	thttpd
PORTVERSION=	2.25b
PORTREVISION=	2
CATEGORIES=	www ipv6
MASTER_SITES=	http://www.acme.com/software/thttpd/ \
		http://atreides.freenix.no/~anders/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} notes.html
DIST_SUBDIR=	${PORTNAME}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny/turbo/throttling HTTP server

IGNOREFILES=	notes.html

GNU_CONFIGURE=	yes

USE_RC_SUBR=	thttpd.sh
SUB_FILES=	pkg-message thttpd.conf.sample
SUB_LIST=	WWWOWN=${WWWOWN}
PORTDOCS=	notes.html

MAN1=		makeweb.1 htpasswd.1
MAN8=		thttpd.8 redirect.8 ssi.8 syslogtocern.8

.include <bsd.port.pre.mk>

post-configure:
	@cd ${WRKSRC} && ${PATCH} < ${PATCHDIR}/extra-patch-config.h

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/thttpd ${PREFIX}/sbin/
	@${INSTALL_MAN} ${WRKSRC}/thttpd.8 ${PREFIX}/man/man8
	@${INSTALL} -d -o root -g wheel -m 0755 ${PREFIX}/www
	@${INSTALL} -d -o root -g wheel -m 0755 ${PREFIX}/www/data
	@${INSTALL} -d -o root -g wheel -m 0755 ${PREFIX}/www/cgi-bin
	@${INSTALL_PROGRAM} ${WRKSRC}/cgi-src/redirect ${PREFIX}/www/cgi-bin/
	@${INSTALL_PROGRAM} ${WRKSRC}/cgi-src/ssi ${PREFIX}/www/cgi-bin/
	@${INSTALL_PROGRAM} ${WRKSRC}/cgi-src/phf ${PREFIX}/www/cgi-bin/
	@${INSTALL_MAN} ${WRKSRC}/cgi-src/redirect.8 ${PREFIX}/man/man8
	@${INSTALL_MAN} ${WRKSRC}/cgi-src/ssi.8 ${PREFIX}/man/man8
	@${INSTALL_PROGRAM} ${WRKSRC}/extras/makeweb ${PREFIX}/bin/
	@${INSTALL_PROGRAM} ${WRKSRC}/extras/htpasswd ${PREFIX}/bin/
	@${INSTALL_SCRIPT} ${WRKSRC}/extras/syslogtocern ${PREFIX}/bin/
	@${INSTALL_MAN} ${WRKSRC}/extras/makeweb.1 ${PREFIX}/man/man1
	@${INSTALL_MAN} ${WRKSRC}/extras/htpasswd.1 ${PREFIX}/man/man1
	@${INSTALL_MAN} ${WRKSRC}/extras/syslogtocern.8 ${PREFIX}/man/man8
	@${INSTALL_DATA} ${WRKDIR}/thttpd.conf.sample ${PREFIX}/etc/thttpd.conf.sample
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/notes.html ${DOCSDIR}/
.endif

.include <bsd.port.post.mk>
