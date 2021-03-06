# $MidnightBSD$
# $FreeBSD: ports/devel/opengrok/Makefile,v 1.5 2011/12/26 17:21:01 jgh Exp $

PORTNAME=	opengrok
PORTVERSION=	0.11.1
CATEGORIES=	devel java
MASTER_SITES=	http://hub.opensolaris.org/bin/download/Project+opengrok/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and powerful code search and cross-reference egine
LICENSE=	cddl

RUN_DEPENDS=	exctags:${PORTSDIR}/devel/ctags

USE_JAVA=	yes
JAVA_VERSION=	1.6+
JAVA_VENDOR?=	freebsd
SHAREOWN=	www
SHAREGRP=	www
NO_BUILD=	yes
SUB_FILES=	opengrok
SUB_LIST+=	LIBFILES="${LIBFILES:S,^,${DATADIR}/,}" \
		JARFILE="${JARFILE}"
PLIST_SUB=	T=${WEBAPP_DIRS:S|^${LOCALBASE}/||} \
		CONF_EXT=${CONF_EXT}
CONF_EXT=	sample

OPTIONS=	TOMCAT6		"Use Jakarta Tomcat 6"		on	\
		TOMCAT55	"Use Jakarta Tomcat 5.5"	off

.include <bsd.port.pre.mk>

JARFILE=	${DATADIR}/opengrok.jar
DOCS=		CHANGES.txt EXAMPLE.txt LICENSE.txt
LIBFILES=	ant.jar \
		bcel-5.2.jar \
		jrcs.jar \
		lucene-core-3.0.2.jar \
		lucene-spellchecker-3.0.2.jar \
		swing-layout-0.9.jar

.if defined(WITH_TOMCAT6)
WEBAPP_DIRS=	apache-tomcat6.0
BUILD_DEPENDS+=	${LOCALBASE}/apache-tomcat6.0/bin/bootstrap.jar:${PORTSDIR}/www/tomcat6
RUN_DEPENDS+=	${LOCALBASE}/apache-tomcat6.0/bin/bootstrap.jar:${PORTSDIR}/www/tomcat6
.endif

.if defined(WITH_TOMCAT55)
WEBAPP_DIRS=	tomcat5.5
BUILD_DEPENDS+=	${LOCALBASE}/tomcat5.5/bin/bootstrap.jar:${PORTSDIR}/www/tomcat55
RUN_DEPENDS+=	${LOCALBASE}/tomcat5.5/bin/bootstrap.jar:${PORTSDIR}/www/tomcat55
.endif

.if ( defined(WITH_TOMCAT6) && ( defined(WITH_TOMCAT55) || defined(WITH_RESIN3)))
IGNORE=	you can only define one application server
.elif ( defined(WITH_TOMCAT55) && ( defined(WITH_TOMCAT6) || defined(WITH_RESIN3)))
IGNORE=	you can only define one application server
.elif ( defined(WITH_RESIN) && ( defined(WITH_TOMCAT6) || defined(WITH_TOMCAT55)))
IGNORE=	you can only define one application server
.elif !defined(WEBAPP_DIRS)
IGNORE=	you need at least one application server
.endif

post-extract:
	@${MKDIR} ${WRKSRC}/lib/${PORTNAME}
	@${TAR} xf ${WRKSRC}/lib/source.war -C ${WRKSRC}/lib/${PORTNAME}

do-install:
	@${INSTALL} -d -o ${WWWOWN} -g ${WWWGRP} ${PREFIX}/${WEBAPP_DIRS}/webapps/${PORTNAME}
	@${MV} ${WRKSRC}/lib/${PORTNAME}/WEB-INF/web.xml ${WRKSRC}/lib/${PORTNAME}/WEB-INF/web.xml.${CONF_EXT}
	@cd ${WRKSRC}/lib/${PORTNAME} && ${COPYTREE_SHARE} \* ${PREFIX}/${WEBAPP_DIRS}/webapps/${PORTNAME}

	@if [ ! -e "${PREFIX}/${WEBAPP_DIRS}/webapps/${PORTNAME}/WEB-INF/web.xml" ]; then \
			${ECHO_MSG} "	Installing local configuration file: ${PREFIX}/${WEBAPP_DIRS}/webapps/${PORTNAME}/WEB-INF/web.xml"; \
			${INSTALL_DATA} ${WRKSRC}/lib/${PORTNAME}/WEB-INF/web.xml.${CONF_EXT} ${PREFIX}/${WEBAPP_DIRS}/webapps/${PORTNAME}/WEB-INF/web.xml; \
		else \
			${ECHO_MSG} "	Preserving local configuration file: ${PREFIX}/${WEBAPP_DIRS}/webapps/${PORTNAME}/WEB-INF/web.xml"; \
	fi;
	@${INSTALL_DATA} ${WRKSRC}/lib/${PORTNAME}/WEB-INF/web.xml.${CONF_EXT} ${PREFIX}/${WEBAPP_DIRS}/webapps/${PORTNAME}/WEB-INF

	@${MKDIR} ${DATADIR}/lib
	@${INSTALL_DATA} ${LIBFILES:S,^,${WRKSRC}/lib/lib/,} ${DATADIR}/lib/
	@${INSTALL_DATA} ${WRKSRC}/lib/opengrok.jar ${DATADIR}/
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/doc/,} ${DOCSDIR}/
.endif
	@${INSTALL_SCRIPT} ${WRKDIR}/opengrok ${PREFIX}/bin

.include <bsd.port.post.mk>
