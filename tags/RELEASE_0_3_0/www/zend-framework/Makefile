# $MidnightBSD: mports/www/zend-framework/Makefile,v 1.6 2009/10/13 02:01:28 laffer1 Exp $

PORTNAME=	ZendFramework
PORTVERSION=	1.9.3
CATEGORIES=	www
MASTER_SITES=	http://framework.zend.com/releases/${DISTNAME}/ \
		GENTOO/distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A framework for developing PHP web applications
LICENSE=	bsd3

NO_BUILD=	yes
USE_PHP=	spl
WANT_PHP_WEB=	yes
USE_GETTEXT=	yes

SUB_FILES=	pkg-message

OPTIONS=	\
		EDOJO "Install embedded Dojo" On \
		PDOJO "Install Dojo from ports" Off \
		MYSQL "Install MySQL PDO support" Off \
		MYSQLI "Install MySQLi support" Off \
		DBLIB "Install DBLIB PDO support" Off \
		PGSQL "Install PostgreSQL PDO support" Off \
		ODBC "Install ODBC PDO support" Off \
		SQLITE "Install SQLite v3 PDO support" Off \
		REQPHP "Install required PHP dependencies" On \
		OPTPHP "Install optional PHP dependencies" Off

.include <bsd.port.pre.mk>

# Check for mutually-exclusive options
.if defined(WITH_EDOJO) && defined(WITH_PDOJO)
IGNORE=		please select only one type of Dojo installation
.endif

INSTALL_DIRS=	library extras/library

.if defined(WITH_EDOJO)
DOJO=		""
INSTALL_DIRS+=	externals/dojo/dijit externals/dojo/dojo \
		externals/dojo/dojox externals/dojo/util
CONFLICTS+=	dojo-1.*
.else
DOJO=		"@comment "
.endif
PLIST_SUB+=	DOJO=${DOJO}

.if defined(WITH_PDOJO)
RUN_DEPENDS+=	dojo>=0:${PORTSDIR}/www/dojo
.endif

# Add all of the required and/or optional PHP extension dependencies,
# if chosen by the user.
#
# See http://framework.zend.com/manual/en/requirements.html for
# a table of what PHP extensions are required for what ZF classes.

.if defined(WITH_REQPHP)
USE_PHP+=	apc ctype curl dom gd hash iconv mbstring ldap mcrypt \
		memcache pcre pdo session simplexml soap spl \
		sqlite xml zlib
.endif
.if defined(WITH_OPTPHP)
USE_PHP+=	bcmath bitset json posix
.endif

.if defined(WITH_MYSQL)
USE_PHP+=	pdo_mysql
.endif

.if defined(WITH_MYSQLI)
USE_PHP+=	mysqli
.endif

.if defined(WITH_DBLIB)
RUN_DEPENDS+=	${LOCALBASE}/lib/php/${PHP_EXT_DIR}/pdo_dblib.so:${PORTSDIR}/databases/php5-pdo_dblib
.endif

.if defined(WITH_PGSQL)
RUN_DEPENDS+=	${LOCALBASE}/lib/php/${PHP_EXT_DIR}/pdo_pgsql.so:${PORTSDIR}/databases/php5-pdo_pgsql
.endif

.if defined(WITH_ODBC)
RUN_DEPENDS+=	${LOCALBASE}/lib/php/${PHP_EXT_DIR}/pdo_odbc.so:${PORTSDIR}/databases/php5-pdo_odbc
.endif

.if defined(WITH_SQLITE)
USE_PHP+=	pdo_sqlite
.endif

do-install:
	@cd ${WRKSRC} && ${COPYTREE_SHARE} "${INSTALL_DIRS}" ${DATADIR}
	@${CHOWN} -R ${WWWOWN}:${WWWGRP} ${DATADIR}
	@${ECHO_CMD} '@exec ${CHOWN} -R ${WWWOWN}:${WWWGRP} \
		${DATADIR:S|^${PREFIX}/|%D/|}' >> ${TMPPLIST}
	@${FIND} ${DATADIR} -type f -print0 | ${XARGS} -0 ${CHMOD} 644
	@${ECHO_CMD} '@exec ${FIND} ${DATADIR} -type f -print0 | \
		${XARGS} -0 ${CHMOD} 644' >> ${TMPPLIST}
	@${FIND} ${DATADIR} -type d -print0 | ${XARGS} -0 ${CHMOD} 755
	@${ECHO_CMD} '@exec ${FIND} ${DATADIR} -type d -print0 | \
		${XARGS} -0 ${CHMOD} 755' >> ${TMPPLIST}
	@cd ${WRKSRC}/bin && ${INSTALL_SCRIPT} zf.sh ${PREFIX}/bin/zf
	@cd ${WRKSRC}/bin && ${INSTALL_DATA} zf.php ${PREFIX}/bin/zf.php
.if !defined(NOPORTEXAMPLES)
	@cd ${WRKSRC} && ${COPYTREE_SHARE} "demos tests" ${EXAMPLESDIR}
	@${CHOWN} -R ${WWWOWN}:${WWWGRP} ${EXAMPLESDIR}
	@${ECHO_CMD} '@exec ${CHOWN} -R ${WWWOWN}:${WWWGRP} \
		${EXAMPLESDIR:S|^${PREFIX}/|%D/|}' >> ${TMPPLIST}
	@${FIND} ${EXAMPLESDIR} -type f -print0 | ${XARGS} -0 ${CHMOD} 644
	@${ECHO_CMD} '@exec ${FIND} ${EXAMPLESDIR} -type f -print0 | \
		${XARGS} -0 ${CHMOD} 644' >> ${TMPPLIST}
	@${FIND} ${EXAMPLESDIR} -type d -print0 | ${XARGS} -0 ${CHMOD} 755
	@${ECHO_CMD} '@exec ${FIND} ${EXAMPLESDIR} -type d -print0 | \
		${XARGS} -0 ${CHMOD} 755' >> ${TMPPLIST}
.endif

# Maintainer-mode target to speed up fixup of output from genplist
fix-new-plist:
	@if [ -f pkg-plist.new ]; then \
		${PERL} -ni.bak -e \
				's#^(.*%%DATADIR%%/externals)#%%DOJO%%$$1#g; \
				print;' pkg-plist.new; \
	else \
		${ECHO_CMD} Please run genplist to create pkg-plist.new; \
	fi

post-install:
.if !defined(NOPORTDOCS)
	@${INSTALL} -d ${DOCSDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} "INSTALL.txt README.txt" ${DOCSDIR}
	@${INSTALL} -d ${DOCSDIR}/extras/api
	@cd ${WRKSRC}/extras/documentation/api/extras && \
		${COPYTREE_SHARE} . ${DOCSDIR}/extras/api
	@${INSTALL} -d ${DOCSDIR}/extras/manual
	@cd ${WRKSRC}/extras/documentation/manual/extras/en && \
		${COPYTREE_SHARE} . ${DOCSDIR}/extras/manual
.endif

.include <bsd.port.post.mk>
