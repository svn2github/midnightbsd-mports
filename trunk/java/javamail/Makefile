# $MidnightBSD$

PORTNAME=	javamail
PORTVERSION=	1.5.1
CATEGORIES=	java mail
MASTER_SITES=	https://java.net/projects/javamail/downloads/download/source/
DISTNAME=	javaxmail-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Reference Implementation of JSR 919

LICENSE=	gpl2 cddl
LICENSE_COMB=	dual

OPTIONS_DEFINE=	DOCS EXAMPLES

USES=		zip
USE_JAVA=	YES
JAVA_VERSION=	1.6+
USE_ANT=	YES

WRKSRC=		${WRKDIR}

PLIST_FILES=	%%JAVAJARDIR%%/mail.jar

PORTDOCS=	*
PORTEXAMPLES=	*

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
ALL_TARGET=	all docs
.endif

do-install:
	@${ECHO_MSG} -n ">> Install JAR files in ${JAVAJARDIR}..."
	@${INSTALL_DATA} ${WRKSRC}/target/release/mail.jar ${JAVAJARDIR}/
	@${ECHO_MSG} " [ DONE ]"
.if ${PORT_OPTIONS:MDOCS}
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC}/target/release && ${FIND} *.txt \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
	@cd ${WRKSRC}/target/release/docs && ${FIND} *.txt javadocs \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
	@${ECHO_MSG} " [ DONE ]"
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	@${ECHO_MSG} -n ">> Installing samples in ${EXAMPLESDIR}..."
	@${MKDIR} ${EXAMPLESDIR}
	@cd ${WRKSRC}/demo && ${FIND} src \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${EXAMPLESDIR} > /dev/null 2>&1
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.mk>
