# $MidnightBSD: mports/www/tomcat6/Makefile,v 1.6 2010/04/25 22:56:55 laffer1 Exp $

PORTNAME=	apache-tomcat
PORTVERSION=	6.0.29
CATEGORIES=	www java
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	tomcat/tomcat-6/v${PORTVERSION}/bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source Java web server by Apache, 6.x branch
LICENSE=	apache2

USE_JAVA=	yes
JAVA_VERSION=	1.5+
NO_BUILD=	YES

USE_RC_SUBR=	tomcat6.sh
SUB_FILES=	pkg-install pkg-deinstall

MAJOR_VER=	${PORTVERSION:R}
APP_HOME?=	${PREFIX}/${PKGBASE}${PORTVERSION:R}
LOG_DIR=	${APP_HOME}/logs
APP_TITLE=	Apache Tomcat
APP_SHORTNAME=	tomcat${MAJOR_VER:S/.//}
TOMCAT_USER?=	www
TOMCAT_GROUP?=	www
PW?=		/usr/sbin/pw
HTTP_PORT?=	8180
SHUTDOWN_PORT?=	8005
AJP_1_3_PORT?=	8009
STDOUT_LOG=	${LOG_DIR}/stdout.log
STDERR_LOG=	${LOG_DIR}/stderr.log
PID_FILE=	/var/run/${APP_SHORTNAME}.pid
WRKDIR?=	${WRKDIRPREFIX}${.CURDIR}/work
WRKSRC=		${WRKDIR}/apache-tomcat-${PORTVERSION}
REPLACE_FILES=	${WRKSRC}/conf/server.xml
REPLACE_LIST_TEMP=	${SUB_LIST:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/}
JAR_FILE=	bin/bootstrap.jar
PLIST_SUB+=	T=${APP_HOME:S/^${PREFIX}\///} WWWOWN=${TOMCAT_USER} WWWGRP=${TOMCAT_GROUP}
LATEST_LINK=	${APP_SHORTNAME}
CONF_EXT=	sample
PLIST_SUB+=	CONF_EXT=${CONF_EXT}

SUB_LIST=	AJP_1_3_PORT=${AJP_1_3_PORT} \
		APP_HOME=${APP_HOME} \
		APP_SHORTNAME=${APP_SHORTNAME} \
		APP_TITLE="${APP_TITLE}" \
		GROUP=${TOMCAT_GROUP} \
		HTTP_PORT=${HTTP_PORT} \
		JAR_FILE=${JAR_FILE} \
		PID_FILE=${PID_FILE} \
		SHUTDOWN_PORT=${SHUTDOWN_PORT} \
		STDERR_LOG=${STDERR_LOG} \
		STDOUT_LOG=${STDOUT_LOG} \
		TOMCAT_HOME=${APP_HOME} \
		TOMCAT_VERSION=${MAJOR_VER:S/.//} \
		USER=${TOMCAT_USER}

.include <bsd.port.pre.mk>

pre-patch:
	@${ECHO_MSG} "Installation settings:"
	@${ECHO_MSG} "   Destination directory:    ${APP_HOME}"
	@${ECHO_MSG} "   Location of JDK:          ${JAVA_HOME}"
	@${ECHO_MSG} "   Location of Java port:    ${JAVA_PORT}"
	@${ECHO_MSG} "   Running as (user/group):  ${TOMCAT_USER}/${TOMCAT_GROUP}"
	@${ECHO_MSG} "   HTTP port:                ${HTTP_PORT}"
	@${ECHO_MSG} "   Shutdown listener port:   ${SHUTDOWN_PORT}"
	@${ECHO_MSG} "   AJP 1.3 connector port:   ${AJP_1_3_PORT}"
	@${ECHO_MSG} "   Logfile stdout:           ${STDOUT_LOG}"
	@${ECHO_MSG} "   Logfile stderr:           ${STDERR_LOG}"

post-patch:
	@${RM} -f `${FIND} ${WRKSRC} -name '*.bat'` `${FIND} ${WRKSRC} -name '*.orig'` `${FIND} ${WRKSRC} -name '*.exe'`

.for file in ${REPLACE_FILES}
	@${ECHO_MSG} -n ">> Customizing `basename ${file}`..."
	@${SED} ${REPLACE_LIST_TEMP} ${file} > ${WRKDIR}/`basename ${file}`
	@${ECHO_MSG} " [ DONE ]"
.endfor

pre-install:
	@PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

do-install:
	@${MKDIR} ${APP_HOME}
	@${MKDIR} ${LOG_DIR}

	@${CP} ${WRKDIR}/server.xml ${WRKSRC}/conf/
	@(cd ${WRKSRC};${FIND} conf -type f | ${SED} -e '/${CONF_EXT}/d') \
		| while read a; do \
			${MV} ${WRKSRC}/$$a ${WRKSRC}/$$a.${CONF_EXT}; \
			if [ ! -e "${APP_HOME}/$$a" ]; then \
				${ECHO_MSG} "	Installing local configuration file: ${APP_HOME}/$$a"; \
				${CP} ${WRKSRC}/$$a.${CONF_EXT} ${WRKSRC}/$$a; \
			else \
				${ECHO_MSG} "	Preserving local configuration file: ${APP_HOME}/$$a"; \
			fi; \
		done
	@${CP} -R ${WRKSRC}/* ${APP_HOME}

	@${INSTALL} -m 664 -o ${TOMCAT_USER} -g ${TOMCAT_GROUP} /dev/null ${STDOUT_LOG}
	@${INSTALL} -m 664 -o ${TOMCAT_USER} -g ${TOMCAT_GROUP} /dev/null ${STDERR_LOG}

	@${LN} -sf ${JAVA_HOME}/lib/tools.jar ${APP_HOME}/lib/tools.jar

	@${CHOWN} -R ${TOMCAT_USER}:${TOMCAT_GROUP} ${APP_HOME}/conf ${APP_HOME}/logs \
		${APP_HOME}/temp ${APP_HOME}/work

	@${CHMOD} 755 `${FIND} ${APP_HOME} -type d`

post-install:
	@${ECHO_MSG} "${APP_TITLE} ${PORTVERSION} has been installed in ${APP_HOME}."

.include <bsd.port.post.mk>
