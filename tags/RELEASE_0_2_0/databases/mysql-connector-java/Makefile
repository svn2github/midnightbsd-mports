# New ports collection makefile for:	mysql-connector-java
# Date created:		8 October 2003
# Whom:			Matthew Seaman <m.seaman@infracaninophile.co.uk>
#
# $MidnightBSD: mports/databases/mysql-connector-java/Makefile,v 1.1 2007/03/17 01:18:08 laffer1 Exp $
# $FreeBSD: ports/databases/mysql-connector-java/Makefile,v 1.41 2007/03/05 12:07:19 rafan Exp $
#

PORTNAME=	mysql-connector-java
PORTVERSION=	5.0.5
CATEGORIES=	databases java
MASTER_SITES=	${MASTER_SITE_MYSQL}
MASTER_SITE_SUBDIR=	Connector-J

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MySQL Connector/J: JDBC interface for MySQL
LICENSE=        gpl2
RUN_DEPENDS=	${JAVALIBDIR}/log4j.jar:${PORTSDIR}/devel/log4j

.if !defined(WITHOUT_COMPILE)

BUILD_DEPENDS=	${JAVALIBDIR}/junit.jar:${PORTSDIR}/java/junit \
		${JAVALIBDIR}/log4j.jar:${PORTSDIR}/devel/log4j

USE_JAVA=	yes
USE_ANT=	yes
JAVA_VERSION=	1.4+
ALL_TARGET=	clean dist
MAKE_ARGS=	-Djavalibdir=${JAVALIBDIR}
BUILDDIR=	${WRKDIR}/${DISTNAME}/build/${DISTNAME}

.else

USE_JAVA=	yes
JAVA_VERSION=	1.2+
BUILDDIR=	${WRKDIR}/${DISTNAME}

.endif

APIDOCSDIR=	${DOCSDIR}/javadoc
SRCDIR=		${WRKDIR}/${DISTNAME}/src
JAVADOCDIR=	${WRKDIR}/${DISTNAME}/javadoc
DESTJARFILE=	${PORTNAME}.jar
EXTRAJARS=	jdbc2_0-stdext.jar jta-spec1_0_1.jar
EXTRADOCS=	README CHANGES docs/connector-j.html docs/connector-j.pdf
JARFILE=	${DISTNAME}-bin.jar
JDCLASSPATH=	${SRCDIR}:${SRCDIR}/lib/jdbc2_0-stdext.jar:${SRCDIR}/lib/jta-spec1_0_1.jar:${CLASSPATH}

PLIST_FILES=	%%JAVAJARDIR%%/jdbc2_0-stdext.jar \
		%%JAVAJARDIR%%/jta-spec1_0_1.jar  \
		%%JAVAJARDIR%%/mysql-connector-java.jar

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

pre-fetch:
	@${ECHO_MSG} ""
	@${ECHO_MSG} "You may use the following build options to override the"
	@${ECHO_MSG} "default behaviour:"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "    WITHOUT_COMPILE=yes    Install the pre-compiled .jar file"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "This port requires JDK 1.4.x or better to compile, but the"
	@${ECHO_MSG} "JDBC driver can be made to operate with JVM 1.2.x or better"
	@${ECHO_MSG} ""

.if !defined(WITHOUT_COMPILE)
post-build:
.else
do-build:
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${JAVADOCDIR} && (cd ${SRCDIR}; \
	    ${JAVADOC} -quiet -breakiterator      \
		-d ${JAVADOCDIR} -package         \
	        -classpath  ${JDCLASSPATH}        \
	         com.mysql.jdbc org.gjt.mm.mysql)
.endif

do-install: do-install-jar do-install-apidocs

do-install-jar:
	@${ECHO_MSG} -n ">> Installing .jar files..."
	@${INSTALL_DATA} ${BUILDDIR}/${JARFILE} ${JAVAJARDIR}/${DESTJARFILE}
	@for extrajar in ${EXTRAJARS} ; do                                     \
	  ${INSTALL_DATA} ${INSTALL_WRKSRC}/src/lib/$$extrajar ${JAVAJARDIR} ; \
	done
	@${ECHO_MSG} " [ DONE ]"

do-install-apidocs:
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${APIDOCSDIR}
	@cd ${JAVADOCDIR} && for src in $$( ${FIND} . ) ; do \
	    dst=${APIDOCSDIR}$${src#.} ; \
	    if ${TEST} -d $$src ; then \
	        ${MKDIR} $$dst ; \
	    else \
	        ${INSTALL_DATA} $$src $$dst ; \
	    fi \
	done
	@for extradoc in ${EXTRADOCS} ; do                          \
	  ${INSTALL_DATA} ${INSTALL_WRKSRC}/$$extradoc ${DOCSDIR} ; \
	done
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.mk>
