# $MidnightBSD: mports/databases/phppgadmin/Makefile,v 1.3 2009/03/13 02:35:54 laffer1 Exp $

PORTNAME=	phppgadmin
PORTVERSION=	4.2.2
CATEGORIES=	databases www
MASTER_SITES=	SF/${PORTNAME}/phpPgAdmin%20%5Bstable%5D/phpPgAdmin-${PORTVERSION}
DISTNAME=	phpPgAdmin-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web Based Postgres Administration
LICENSE=	gpl2

USE_BZIP2=	YES
.if !defined(WITHOUT_PHP_DEPENDS)
USE_PHP=	pgsql pcre session
.endif
NO_BUILD=	YES
PGADMDIR?=	www/phpPgAdmin
PLIST_SUB+=	PGADMDIR=${PGADMDIR}
PGADMOLDDIR?=	www/data-dist/phpPgAdmin
PLIST_SUB+=	PGADMOLDDIR=${PGADMOLDDIR}

pre-everything::
	@${ECHO_CMD} "# you can customize the installation directory"
	@${ECHO_CMD} "# by setting PGADMDIR in /etc/make.conf"

do-configure:
	${REINPLACE_CMD} -e "s|/usr/bin/pg|${LOCALBASE}/bin/pg|" \
		${WRKSRC}/conf/config.inc.php-dist
	${RM} -f ${WRKSRC}/conf/config.inc.php \
		${WRKSRC}/conf/config.inc.php-dist.bak

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} ${PREFIX}/${PGADMDIR}
	${RM} -f ${WRKSRC}/classes/database/Postgres81.php.orig
	${CP} -Rp ${WRKSRC}/ ${PREFIX}/${PGADMDIR}/
.if exists(${PREFIX}/${PGADMOLDDIR}/conf/config.inc.php)
	${CP} -np ${PREFIX}/${PGADMOLDDIR}/conf/config.inc.php \
		${PREFIX}/${PGADMDIR}/conf/config.inc.php
.endif
	${CP} -np ${PREFIX}/${PGADMDIR}/conf/config.inc.php-dist \
		${PREFIX}/${PGADMDIR}/conf/config.inc.php

.include <bsd.port.post.mk>
