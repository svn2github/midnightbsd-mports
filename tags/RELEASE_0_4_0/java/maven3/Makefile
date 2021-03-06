# $MidnightBSD: mports/java/maven3/Makefile,v 1.1 2012/02/28 02:17:44 laffer1 Exp $

PORTNAME=	maven3
DISTVERSION=	3.0.3
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	maven/binaries
DISTNAME=	apache-maven-${DISTVERSION}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java project management tool, 3.x branch
LICENSE=	apache2

RUN_DEPENDS=	mvn:${PORTSDIR}/java/maven-wrapper

USE_JAVA=	yes
JAVA_VERSION=	1.6+
NO_BUILD=	yes
DATADIR=	${JAVASHAREDIR}/${PORTNAME}
WRKSRC=		${WRKDIR}/apache-maven-${DISTVERSION}
SUB_FILES=	mvn.sh
SUB_LIST=	CLASSWORLDS_JAR=plexus-classworlds-2.4.jar
INSTANCE_FILE=	030003-${PORTNAME}-${PORTVERSION}
INSTANCES_DIR=	etc/maven-wrapper/instances.d/
PLIST_FILES=	${INSTANCES_DIR}/${INSTANCE_FILE}

post-extract:
	${RM} -f ${WRKSRC}/bin/*.bat
	${ECHO_CMD} "${DATADIR}" > ${WRKSRC}/${INSTANCE_FILE}

do-install:
	cd ${WRKSRC} && ${FIND} . -type d -exec ${MKDIR} ${DATADIR}/{} \;
	cd ${WRKSRC} && ${FIND} . -type f -not -path "\./bin/" -exec ${INSTALL_DATA} {} ${DATADIR}/{} \;
	${INSTALL_DATA} ${WRKSRC}/bin/m2.conf ${DATADIR}/bin/
	${INSTALL_SCRIPT} ${WRKDIR}/mvn.sh ${DATADIR}/bin/mvn
	${MKDIR} ${PREFIX}/${INSTANCES_DIR}
	${INSTALL_DATA} ${WRKSRC}/${INSTANCE_FILE} ${PREFIX}/${INSTANCES_DIR}

post-install:
	@${FIND} -s ${WRKSRC} -not -type d 2>/dev/null | \
		${SED} -ne 's,^${WRKSRC},${DATADIR:S,^${PREFIX}/,,},p' >> ${TMPPLIST}
	@${FIND} -s -d ${WRKSRC} -type d 2>/dev/null | \
		${SED} -ne 's,^${WRKSRC},@dirrm ${DATADIR:S,^${PREFIX}/,,},p' >> ${TMPPLIST}

.include <bsd.port.mk>
