# New ports collection makefile for:	JavaSVN
# Date created:				6 Aug 2005
# Whom:					tux@pinguru.net
#
# $MidnightBSD$
# $FreeBSD: ports/devel/svnkit/Makefile,v 1.17 2008/05/01 13:48:28 miwi Exp $
#

PORTNAME=	svnkit
PORTVERSION=	1.1.7
CATEGORIES=	devel java
MASTER_SITES=	http://svnkit.com/
DISTNAME=	org.tmatesoft.svn_${PORTVERSION}.standalone

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The only pure Java Subversion client library in the world
LICENSE=	agg

RUN_DEPENDS=	java:${PORTSDIR}/java/javavmwrapper

NO_BUILD=	yes
USE_ZIP=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.3+
DATADIR=	${JAVASHAREDIR}/${PORTNAME}
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}.4142

DATA_FILES=	COPYING \
		JNA-LICENSE JAVAHL-LICENSE SEQUENCE-LICENSE TRILEAD-LICENSE \
		changelog.txt logging.properties.disabled svnkitsrc.zip \
		jna.jar svnkit-cli.jar svnkit-javahl.jar svnkit.jar trilead.jar \
		README.txt THIRD-PARTY.txt

PLIST_FILES=	bin/jsvn bin/jsvnadmin bin/jsvnlook \
		bin/jsvnsync bin/jsvnversion \
		${DATA_FILES:S,^,%%DATADIR%%/,}
PLIST_DIRS=	%%DATADIR%%

SUB_FILES=	javasvn.sh svnsync.sh jsvnadmin.sh jsvnlook.sh jsvnversion.sh

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

do-install:
	${MKDIR} ${DATADIR}
.for file in ${DATA_FILES}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DATADIR}
.endfor
	${INSTALL_SCRIPT} ${WRKDIR}/javasvn.sh ${PREFIX}/bin/jsvn
	${INSTALL_SCRIPT} ${WRKDIR}/svnsync.sh ${PREFIX}/bin/jsvnsync
	${INSTALL_SCRIPT} ${WRKDIR}/jsvnadmin.sh ${PREFIX}/bin/jsvnadmin
	${INSTALL_SCRIPT} ${WRKDIR}/jsvnlook.sh ${PREFIX}/bin/jsvnlook
	${INSTALL_SCRIPT} ${WRKDIR}/jsvnversion.sh ${PREFIX}/bin/jsvnversion

.if !defined(NOPORTDOCS)
	cd ${WRKSRC}/doc/javadoc && \
		${FIND} . -type d -exec ${MKDIR} ${DOCSDIR}/{} \;
	cd ${WRKSRC}/doc/javadoc && \
		${FIND} . -not -type d -exec ${INSTALL_DATA} {} ${DOCSDIR}/{} \;
.endif

.include <bsd.port.mk>
