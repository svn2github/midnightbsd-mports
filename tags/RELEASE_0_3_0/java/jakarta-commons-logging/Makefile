# New ports collection makefile for:	Jakarta Commons Logging
# Date created:				November 14, 2002
# Whom:					Ernst de Haan <znerd@FreeBSD.org>
#
# $MidnightBSD: mports/java/jakarta-commons-logging/Makefile,v 1.1 2006/10/05 01:32:36 laffer1 Exp $
# $FreeBSD: ports/java/jakarta-commons-logging/Makefile,v 1.11 2006/05/16 15:43:15 hq Exp $
#

PORTNAME=	commons-logging
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE_COMMONS_BINARIES}
MASTER_SITE_SUBDIR=	${PORTNAME:S,commons-,,}
PKGNAMEPREFIX=	jakarta-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic logging wrapper library
LICENSE=	apache2

USE_JAVA=	yes
JAVA_VERSION=	1.2+
NO_BUILD=	yes

.include <bsd.port.pre.mk>

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif
PLIST_FILES=	%%JAVAJARDIR%%/commons-logging.jar

do-install:
	@${ECHO_MSG} -n ">> Installing JAR as ${JAVAJARDIR}/${PORTNAME}.jar..."
	@${INSTALL_DATA} ${WRKSRC}/${PORTNAME}-${PORTVERSION}.jar ${JAVAJARDIR}/${PORTNAME}.jar
	@${ECHO_MSG} " [ DONE ]"

.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}/..."
	@cd ${WRKSRC}/docs \
	  && ${FIND} . -type d -exec ${MKDIR} ${DOCSDIR}/{} \; \
	  && ${FIND} . -type f -exec ${INSTALL_DATA} {} ${DOCSDIR}/{} \;
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.post.mk>
