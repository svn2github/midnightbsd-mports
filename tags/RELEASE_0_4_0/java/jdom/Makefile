# $MidnightBSD: mports/java/jdom/Makefile,v 1.4 2011/12/24 03:40:58 laffer1 Exp $
# $FreeBSD: ports/java/jdom/Makefile,v 1.15 2004/12/03 01:01:24 hq Exp $
#

PORTNAME=	jdom
PORTVERSION=	1.1.1
PORTEPOCH=	1
CATEGORIES=	java textproc
MASTER_SITES=	http://www.jdom.org/dist/source/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java library for accessing and manipulating XML documents
LICENSE=	other
# very simliar to bsd license.

RUN_DEPENDS=	${JAVALIBDIR}/jaxen-jdom.jar:${PORTSDIR}/java/jaxen

USE_GCPIO=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.6+
USE_ANT=	yes

ALL_TARGET=	package
.if !defined(NOPORTDOCS)
ALL_TARGET+=	javadoc
OTHERDOCS=	README.txt TODO.txt CHANGES.txt COMMITTERS.txt LICENSE.txt
PORTDOCS=	apidocs ${OTHERDOCS}
.endif

WRKSRC=		${WRKDIR}/${PORTNAME}

MAKE_ENV+=	CLASSPATH=${JAVALIBDIR}/jaxen-jdom.jar

PLIST_FILES=	%%JAVAJARDIR%%/jdom.jar

do-install:
	@${ECHO_MSG} -n ">> Installing JAR as ${JAVAJARDIR}/jdom.jar..."
	@${MKDIR} ${JAVAJARDIR}
	@${INSTALL_DATA} ${WRKSRC}/build/jdom.jar ${JAVAJARDIR}/
	@${ECHO_MSG} " [ DONE ]"
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing samples in ${EXAMPLESDIR}..."
	@${MKDIR} ${EXAMPLESDIR}
	@cd ${WRKSRC}/build/samples/ && ${FIND} . \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${EXAMPLESDIR} > /dev/null 2>&1
	@${ECHO_MSG} " [ DONE ]"
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${DOCSDIR}/apidocs
	@cd ${WRKSRC}/build/ && ${FIND} apidocs \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
	@${INSTALL_DATA} ${OTHERDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
	@${ECHO_MSG} " [ DONE ]"
.endif

.if !defined(NOPORTDOCS)
post-install:
	@${FIND} -s ${WRKSRC}/build/samples -not -type d | \
		${SED} -ne 's,^${WRKSRC}/build/samples,${EXAMPLESDIR:S,${PREFIX}/,,},p' >> ${TMPPLIST}
	@${FIND} -s -d ${WRKSRC}/build/samples -type d | \
		${SED} -ne 's,^${WRKSRC}/build/samples,@dirrm ${EXAMPLESDIR:S,${PREFIX}/,,},p' >> ${TMPPLIST}
.endif

.include <bsd.port.mk>
