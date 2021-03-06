# $MidnightBSD: mports/databases/phpmyadmin/Makefile,v 1.29 2010/12/31 12:29:23 laffer1 Exp $

PORTNAME=	phpMyAdmin
DISTVERSION=	3.3.8
CATEGORIES=	databases www
MASTER_SITES=	SF/${PORTNAME:L}/${PORTNAME}/${PORTVERSION}
DISTNAME=	${PORTNAME}-${DISTVERSION}-all-languages

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of PHP-scripts to manage MySQL over the web
LICENSE=	gpl2

USE_BZIP2=	yes
NO_BUILD=	yes
.if !defined(WITHOUT_PHP_DEPENDS)
USE_PHP=	ctype mysql pcre session filter mbstring mcrypt
.endif
USE_MYSQL=	yes

SUB_LIST+=	"MYADMDIR=${MYADMDIR}" \
		"PKGNAME=${PKGNAME}"
SUB_FILES=	pkg-message

WANT_PHP_WEB=	yes

# Copy the way lang/php5-extensions deals with its OPTIONS -- avoids
# problems with include of bsd.port.pre.mk

OPTIONS=	BZ2	 "bzip2 library support" on \
		GD	 "GD library support" on \
		MCRYPT   "MCrypt library support" on \
		MYSQLI	 "Improved MySQL support" off \
		OPENSSL	 "OpenSSL support" on \
		PDF	 "PDFlib support (implies GD)" on \
		ZLIB	 "ZLIB support" on \
		ZIP	 "ZIP support" on

PORT_DBDIR?=	${DESTDIR}/var/db/ports
LATEST_LINK=	${PORTNAME}${PKGNAMESUFFIX}
OPTIONSFILE?=	${PORT_DBDIR}/${LATEST_LINK}/options

.if exists(${OPTIONSFILE})
.include "${OPTIONSFILE}"
.endif

.if !defined(WITHOUT_PHP_DEPENDS)
# Options that default to on:
.for opt in BZ2 GD OPENSSL PDF ZLIB MCRYPT MBSTRING ZIP
.    if !defined(WITHOUT_${opt}) || defined(WITH_${opt})
USE_PHP+=	${opt:L}
.    endif
.endfor

# Options that default to off:
.for opt in MYSQLI
.    if defined(WITH_${opt}) && !defined(WITHOUT_${opt})
USE_PHP+=	${opt:L}
.    endif
.endfor
.endif

MYADMDIR?=	www/phpMyAdmin
MYADMGRP?=	${WWWGRP}
CFGFILE=	config.inc.php

PLIST=		${WRKDIR}/plist
PLIST_SUB+=	MYADMDIR=${MYADMDIR} MYADMGRP=${MYADMGRP}

.SILENT:

# When creating a package, empty directories will not be generated
# from the pkg tarball.  Therefore make sure no directories are empty.

post-patch:
	cd ${WRKSRC} ; \
	for emptydir in $$( ${FIND} . -type d -empty -print ) ; do \
	    ${TOUCH} $${emptydir}/.keep-me ; \
	done
	${CP} ${FILESDIR}/${CFGFILE}.sample ${WRKSRC}/${CFGFILE}.sample
	cd ${WRKSRC} ; \
	${FIND} . ! -type d ! -name ${CFGFILE}.sample | ${SORT} | \
	    ${SED} -e "s,^\.,%%MYADMDIR%%,"           >${PLIST} ; \
	${CAT} ${PKGDIR}/pkg-plist-chunk             >>${PLIST} ; \
	${FIND} . -type d | ${SORT} -r | ${SED} \
	     -e "s,^\.$$,@dirrmtry %%MYADMDIR%%," \
	     -e "s,^\.,@dirrm %%MYADMDIR%%,"         >>${PLIST}

do-install: install-app install-conf

install-app:
	cd ${WRKSRC} ; \
	for src in $$( ${FIND} . ! -name .cvsignore ) ; do \
	    dst=${TARGETDIR}/${MYADMDIR}$${src#.} ; \
	    if ${TEST} -d $$src ; then \
	        ${MKDIR} $$dst ; \
	    else \
	        ${INSTALL_DATA} $$src $$dst ; \
	    fi \
	done

install-conf: install-app
	cd ${TARGETDIR}/${MYADMDIR} ; \
	${CHMOD} 0640 ${CFGFILE}.sample ; \
	${CHGRP} ${MYADMGRP} ${CFGFILE}.sample ; \
	if ${TEST} ! -f ${CFGFILE} ; then \
	    ${CP} -p ${CFGFILE}.sample ${CFGFILE} ; \
	fi

.include <bsd.port.mk>
