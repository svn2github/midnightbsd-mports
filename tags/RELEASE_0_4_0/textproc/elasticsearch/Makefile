# $MidnightBSD: mports/textproc/elasticsearch/Makefile,v 1.1 2013/02/26 03:49:48 laffer1 Exp $

PORTNAME=	elasticsearch
PORTVERSION=	0.90.0
CATEGORIES=	textproc java devel
MASTER_SITES=	http://download.elasticsearch.org/${PORTNAME}/${PORTNAME}/ \
		http://mirrors.rit.edu/zi/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-text search engine for Java
LICENSE=	apache2

USE_JAVA=	yes
NO_BUILD=	yes
JAVA_VERSION=	1.6+
ONLY_FOR_ARCHS=	i386 amd64
USE_RC_SUBR=	elasticsearch
SUB_FILES+=	elasticsearch

.include <bsd.mport.options.mk>

LUCENEVER=	4.2.1
CONFIG_FILES=	elasticsearch.yml logging.yml
JARS=		elasticsearch-${PORTVERSION}.jar \
		jna-3.3.0.jar \
		jts-1.12.jar \
		log4j-1.2.17.jar \
		lucene-analyzers-common-${LUCENEVER}.jar \
		lucene-codecs-${LUCENEVER}.jar \
		lucene-core-${LUCENEVER}.jar \
		lucene-grouping-${LUCENEVER}.jar \
		lucene-highlighter-${LUCENEVER}.jar \
		lucene-join-${LUCENEVER}.jar \
		lucene-memory-${LUCENEVER}.jar \
		lucene-queries-${LUCENEVER}.jar \
		lucene-queryparser-${LUCENEVER}.jar \
		lucene-sandbox-${LUCENEVER}.jar \
		lucene-spatial-${LUCENEVER}.jar \
		lucene-suggest-${LUCENEVER}.jar \
		spatial4j-0.3.jar
DOCS=		LICENSE.txt \
		NOTICE.txt \
		README.textile

SIGAR_ARCH=	${ARCH:S|i386|x86|}
SEARCHUSER?=	elasticsearch
SEARCHGROUP?=	${SEARCHUSER}
USERS=		${SEARCHUSER}
GROUPS=		${SEARCHGROUP}
ELASTIC_DBDIR=	/var/db/elasticsearch
ELASTIC_LOGDIR=	/var/log/elasticsearch

SUB_LIST=	SEARCHUSER=${SEARCHUSER} \
		SEARCHGROUP=${SEARCHGROUP} \
		PORTVERSION=${PORTVERSION}
SUB_FILES=	elasticsearch-plugin
PLIST_SUB=	SIGAR_ARCH=${SIGAR_ARCH} \
		SEARCHUSER=${SEARCHUSER} \
		SEARCHGROUP=${SEARCHGROUP} \
		LUCENEVER=${LUCENEVER} \
		PORTVERSION=${PORTVERSION} \
		ELASTIC_DBDIR=${ELASTIC_DBDIR} \
		ELASTIC_LOGDIR=${ELASTIC_LOGDIR}

post-patch:
	${SED} -i .bak -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/config/elasticsearch.yml

do-install:
	${INSTALL} -d -o ${SEARCHUSER} -g ${SEARCHUSER} -m 750 ${PREFIX}/etc/elasticsearch
.for f in ${CONFIG_FILES}
	${INSTALL} -o ${SEARCHUSER} -g ${SEARCHUSER} -m 444 ${WRKSRC}/config/${f} ${PREFIX}/etc/elasticsearch/${f}.sample
	@if [ ! -f ${CONFIG_DIR}/${f} ]; then \
		${CP} -p ${PREFIX}/etc/elasticsearch/${f}.sample ${PREFIX}/etc/elasticsearch/${f} ; \
	fi
.endfor
	${INSTALL_SCRIPT} ${WRKDIR}/elasticsearch-plugin ${PREFIX}/bin/elasticsearch-plugin
	${MKDIR} ${PREFIX}/lib/elasticsearch
.for f in ${JARS}
	${INSTALL_DATA} ${WRKSRC}/lib/${f} ${PREFIX}/lib/elasticsearch/
.endfor

	${MKDIR} ${PREFIX}/lib/elasticsearch/sigar
	${INSTALL_DATA} ${WRKSRC}/lib/sigar/sigar-1.6.4.jar ${PREFIX}/lib/elasticsearch/sigar/

.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
