# $MidnightBSD$

PORTNAME=	squirrelmail
PORTVERSION=	1.4.22
PORTREVISION=	2
CATEGORIES=	mail www
MASTER_SITES=	SF/${PORTNAME}/stable/${PORTVERSION}
DISTNAME=	${PORTNAME}-webmail-${PORTVERSION}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Webmail system which accesses mail over IMAP

LICENSE=	gpl2

USE_PHP=	session gettext mbstring pcre openssl xml
WANT_PHP_WEB=	yes

USES=		gettext tar:bzip2 cpe

.ifdef WITH_DATABASE
RUN_DEPENDS+=	${PREFIX}/share/pear/DB.php:${PORTSDIR}/databases/pear-DB
.endif

.ifdef WITH_LDAP
USE_PHP+=	ldap
.endif

.ifndef WITHOUT_WWWDIR
SQUIRRELDIR?=	${PREFIX}/www/${PORTNAME}
.else
SQUIRRELDIR?=	${PREFIX}/${PORTNAME}
.endif

PLIST_SUB=	PORTVERSION=${PORTVERSION} \
		SQUIRRELDIR="${SQUIRRELDIR:S,^${PREFIX}/,,}"

SUB_FILES=	pkg-message pkg-install pkg-deinstall
SUB_LIST=	SQUIRRELDIR=${SQUIRRELDIR}

PORTDOCS=	*

pre-everything::
	@${ECHO_CMD} "SquirrelMail is installed into ${SQUIRRELDIR}"
	@${ECHO_CMD} "To use the old location ${PREFIX}/${PORTNAME} define"
	@${ECHO_CMD} "WITHOUT_WWWDIR when patching or installing"
	@${ECHO_CMD}
	@${ECHO_CMD} "Use WITH_LDAP to ensure PHP LDAP support is installed"
	@${ECHO_CMD} "Use WITH_DATABASE to ensure PEAR framework for database support is installed"
	@${ECHO_CMD} "   (note that this does not install the database specific PEAR support, e.g. MySQL)"
	@${ECHO_CMD}

post-patch:
.ifndef PATCH_DEBUG
	@${RM} -f \
		${WRKSRC}/class/deliver/Deliver.class.php.orig \
		${WRKSRC}/config/config_default.php.orig \
		${WRKSRC}/functions/global.php.orig \
		${WRKSRC}/functions/i18n.php.orig \
		${WRKSRC}/functions/imap_search.php.orig \
		${WRKSRC}/src/addrbook_search_html.php.orig \
		${WRKSRC}/src/compose.php.orig
.endif
	@${REINPLACE_CMD} -e 's|ispell|${LOCALBASE}/bin/ispell|g' \
		${WRKSRC}/plugins/squirrelspell/sqspell_config.php
	@${REINPLACE_CMD} -e 's|/usr/bin/fortune|/usr/games/fortune|g' \
		${WRKSRC}/plugins/fortune/fortune_functions.php
	@${RM} ${WRKSRC}/plugins/squirrelspell/sqspell_config.php.bak \
		${WRKSRC}/plugins/fortune/fortune_functions.php.bak

# Rearrange the documentation
do-build:
	@${MV} ${WRKSRC}/themes/README.themes ${WRKSRC}/doc/
	@cd ${WRKSRC} ; for f in `${FIND} plugins -name "README*" -or \
		-name INSTALL -or -name CHANGES -or -name HISTORY`; \
		do \
		${MKDIR} doc/`dirname $$f` ; \
		${MV} $$f doc/`dirname $$f` ; \
	done; \
	${MV} doc/plugins/squirrelspell/doc/README doc/plugins/squirrelspell ; \
	${RM} -rf doc/plugins/squirrelspell/doc ; \
	${MV} plugins/squirrelspell/doc/* doc/plugins/squirrelspell ; \
	${RM} -f doc/plugins/squirrelspell/index.php ; \
	${RM} -rf plugins/squirrelspell/doc
	@${FIND} ${WRKSRC} -name '*.orig' -delete
	@${ECHO} "left_refresh=300" >> ${WRKSRC}/data/default_pref
	@${MV} ${WRKSRC}/config/config_local.php ${WRKSRC}/config/config_local.php.sample

pre-install:
	@${ECHO} "Your umask should be lax while installing this. Like, 022 or something."
	@${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${FILESDIR}/111.clean-squirrelmail ${PREFIX}/etc/periodic/daily
	${MKDIR} ${SQUIRRELDIR}
	${INSTALL_DATA} ${WRKSRC}/index.php ${SQUIRRELDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/configure ${SQUIRRELDIR}
.for DIR in class config data functions help images include locale plugins po src themes
	cd ${WRKSRC} && ${FIND} ${DIR} | ${CPIO} -pdmu --quiet ${SQUIRRELDIR}
.endfor
	${CHOWN} -R ${WWWOWN}:${WWWGRP} ${SQUIRRELDIR}/data
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/doc && ${FIND} . | ${CPIO} -pdmu --quiet ${DOCSDIR}
.endif

.include <bsd.port.mk>
