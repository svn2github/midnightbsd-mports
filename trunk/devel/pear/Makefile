# $MidnightBSD$

PORTNAME=	pear
PORTVERSION=	1.9.4
CATEGORIES=	devel
MASTER_SITES=	http://miwibox.org/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEAR framework for PHP

LICENSE=	php

USE_BZIP2=	yes
NO_BUILD=	yes

WANT_PHP_CLI=	yes
USE_PHP_BUILD=	yes
USE_PHP=	pcre xml

FAKE_OPTS+=	prefixhack

PEARDIR=	${PREFIX}/share/pear

post-patch:
	@${MKDIR} ${FAKE_DESTDIR}${PEARDIR}
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${FAKE_DESTDIR}${PREFIX}|" \
		-e "s|%%BUNDLEDIR%%|${WRKSRC}/go-pear-bundle|" \
		-e "s|%%TMPDIR%%|/tmp/pear|" \
		${WRKSRC}/go-pear
	@cd ${WRKSRC}/go-pear-bundle && ${MKDIR} tmp && ${TAR} -C tmp -xf PEAR-${PORTVERSION}.tar
	@cd ${WRKSRC}/go-pear-bundle/tmp/PEAR-${PORTVERSION} && ${PATCH} -s -p0 < ${FILESDIR}/extra-patch-PEAR-Config.php
	@${RM} ${WRKSRC}/go-pear-bundle/tmp/PEAR-${PORTVERSION}/PEAR/Config.php.orig
	@${MD5} -q ${WRKSRC}/go-pear-bundle/tmp/PEAR-${PORTVERSION}/PEAR/Config.php > ${WRKSRC}/Config.php.md5
	@${REINPLACE_CMD} -E -e "s|(file md5sum=\").*(\" name=\"PEAR/Config.php\" role=\"php\")|\1`${CAT} ${WRKSRC}/Config.php.md5`\2|g" \
		${WRKSRC}/go-pear-bundle/tmp/package2.xml ${WRKSRC}/go-pear-bundle/package2.xml
	@cd ${WRKSRC}/go-pear-bundle/tmp && ${TAR} -cf ../PEAR-${PORTVERSION}.tar package2.xml PEAR-${PORTVERSION} package.xml

do-install:
	${LOCALBASE}/bin/php -q ${WRKSRC}/go-pear
	@${SED} -i "" "s|<?php|<?php dl('pcre.so'); dl('xml.so');|" \
		${PEARDIR}/peclcmd.php

post-install:
	@${CP} -n ${PREFIX}/etc/pear.conf.sample ${PREFIX}/etc/pear.conf || ${TRUE}
	${SED} -i "" "s|${FAKE_DESTDIR}||g" \
		${PREFIX}/bin/pear \
		${PREFIX}/bin/peardev \
		${PREFIX}/bin/pecl \
		${PEARDIR}/pearcmd.php \
		${PEARDIR}/peclcmd.php \
		${PEARDIR}/.registry/archive_tar.reg \
		${PEARDIR}/.registry/console_getopt.reg \
		${PEARDIR}/.registry/pear.reg \
		${PEARDIR}/.registry/structures_graph.reg \
		${PREFIX}/etc/pear.conf \
		${PREFIX}/etc/pear.conf.sample

.include <bsd.port.mk>
