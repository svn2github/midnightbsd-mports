# $MidnightBSD: mports/java/javamail/Makefile,v 1.1 2012/02/28 01:03:05 laffer1 Exp $
# $FreeBSD: ports/java/javamail/Makefile,v 1.28 2011/02/18 10:11:12 ale Exp $

PORTNAME=	javamail
PORTVERSION=	1.4.5
CATEGORIES=	java mail
MASTER_SITES=	http://kenai.com/downloads/javamail/
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Reference Implementation of JSR 919
LICENSE=	cddl

BUILD_DEPENDS=	${JAVALIBDIR}/activation.jar:${PORTSDIR}/java/jaf
RUN_DEPENDS=	${JAVALIBDIR}/activation.jar:${PORTSDIR}/java/jaf

USE_ZIP=	YES
USE_JAVA=	YES
JAVA_VERSION=	1.6+
USE_ANT=	YES
MAKE_ENV=	ANT_INCLUDE_SHARED_JARS=YES

WRKSRC=		${WRKDIR}

.if !defined(NOPORTDOCS)
ALL_TARGET=	all docs
.endif

PLIST_FILES=	%%JAVAJARDIR%%/mail.jar

PORTDOCS=	*
PORTEXAMPLES=	*

do-install:
	@${ECHO_MSG} -n ">> Install JAR files in ${JAVAJARDIR}..."
	@${INSTALL_DATA} ${WRKSRC}/target/release/mail.jar ${JAVAJARDIR}/
	@${ECHO_MSG} " [ DONE ]"
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC}/target/release && ${FIND} *.txt \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
	@cd ${WRKSRC}/target/release/docs && ${FIND} *.txt javadocs \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
	@${ECHO_MSG} " [ DONE ]"
.endif
.if !defined(NOPORTEXAMPLES)
	@${ECHO_MSG} -n ">> Installing samples in ${EXAMPLESDIR}..."
	@${MKDIR} ${EXAMPLESDIR}
	@cd ${WRKSRC}/demo && ${FIND} src \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${EXAMPLESDIR} > /dev/null 2>&1
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.mk>
