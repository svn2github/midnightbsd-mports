# New ports collection makefile for:	php5-extensions
# Date created:			7 Jul 2004
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD: mports/lang/php5-extensions/Makefile,v 1.4 2007/10/09 16:28:35 laffer1 Exp $
# $FreeBSD: ports/lang/php5-extensions/Makefile,v 1.17 2007/02/10 19:09:33 ale Exp $
#

PORTNAME=	php5
PORTVERSION=	1.1
CATEGORIES=	lang
MASTER_SITES=	# none
PKGNAMESUFFIX=	-extensions
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A "meta-port" to install PHP extensions
LICENSE=	agg

DEFAULT_PHP_VER=5
IGNORE_WITH_PHP=4
USE_PHP_BUILD=	yes

NO_BUILD=	yes

WITH_CTYPE=	yes
WITH_DOM=	yes
WITH_FILTER=	yes
WITH_HASH=	yes
WITH_ICONV=	yes
WITH_JSON=	yes
WITH_PCRE=	yes
WITH_PDO=	yes
WITH_PDO_SQLITE=yes
WITH_POSIX=	yes
WITH_SESSION=	yes
WITH_SIMPLEXML=	yes
WITH_SPL=	yes
WITH_SQLITE=	yes
WITH_TOKENIZER=	yes
WITH_XML=	yes
WITH_XMLREADER=	yes
WITH_XMLWRITER=	yes

OPTIONS=	BCMATH          "bc style precision math functions" off \
		BZ2             "bzip2 library support" off \
		CALENDAR        "calendar conversion support" off \
		CTYPE           "ctype functions" on \
		CURL            "CURL support" off \
		DBA             "dba support" off \
		DBASE           "dBase library support" off \
		DOM             "DOM support" on \
		EXIF            "EXIF support" off \
		FILEINFO        "fileinfo support" off \
		FILTER          "input filter support" on \
		FRIBIDI         "FriBidi support" off \
		FTP             "FTP support" off \
		GD              "GD library support" off \
		GETTEXT         "gettext library support" off \
		GMP             "GNU MP support" off \
		HASH            "HASH Message Digest Framework" on \
		ICONV           "iconv support" on \
		IMAP            "IMAP support" off \
		JSON            "JavaScript Object Serialization support" on \
		LDAP            "OpenLDAP support" off \
		MBSTRING        "multibyte string support" off \
		MCRYPT          "Encryption support" off \
		MHASH           "Crypto-hashing support" off \
		MING            "ming shockwave flash support" off \
		MSSQL           "MS-SQL database support" off \
		MYSQL           "MySQL database support" off \
		MYSQLI          "MySQLi database support" off \
		NCURSES         "ncurses support (CLI only)" off \
		ODBC            "unixODBC support" off \
		OPENSSL         "OpenSSL support" off \
		PCNTL           "pcntl support (CLI only)" off \
		PCRE            "Perl Compatible Regular Expression support" on \
		PDF             "PDFlib support (implies GD)" off \
		PDO             "PHP Data Objects Interface (PDO)" on \
		PDO_SQLITE      "PDO sqlite driver" on \
		PGSQL           "PostgreSQL database support" off \
		POSIX           "POSIX-like functions" on \
		PSPELL          "pspell support" off \
		READLINE        "readline support (CLI only)" off \
		RECODE          "recode support" off \
		SESSION         "session support" on \
		SHMOP           "shmop support" off \
		SIMPLEXML       "simplexml support" on \
		SNMP            "SNMP support" off \
		SOAP            "SOAP support" off \
		SOCKETS         "sockets support" off \
		SPL             "Standard PHP Library" on \
		SQLITE          "sqlite support" on \
		SYBASE_CT       "Sybase database support" off \
		SYSVMSG         "System V message support" off \
		SYSVSEM         "System V semaphore support" off \
		SYSVSHM         "System V shared memory support" off \
		TIDY            "TIDY support" off \
		TOKENIZER       "tokenizer support" on \
		WDDX            "WDDX support (implies XML)" off \
		XML             "XML support" on \
		XMLREADER       "XMLReader support" on \
		XMLRPC          "XMLRPC-EPI support" off \
		XMLWRITER       "XMLWriter support" on \
		XSL             "XSL support (Implies DOM)" off \
		YAZ             "YAZ support (ANSI/NISO Z39.50)" off \
		ZIP             "ZIP support" off \
		ZLIB            "ZLIB support" off

PORT_DBDIR?=	/var/db/ports
LATEST_LINK=	${PORTNAME}${PKGNAMESUFFIX}
OPTIONSFILE?=	${PORT_DBDIR}/${LATEST_LINK}/options

.if exists(${OPTIONSFILE})
.include "${OPTIONSFILE}"
.endif

ALL_OPTIONS=	BCMATH BZ2 CALENDAR CTYPE CURL DBA DBASE \
		DOM EXIF FILEINFO FILTER FRIBIDI FTP GD GETTEXT \
		GMP HASH ICONV IMAP JSON LDAP MBSTRING MCRYPT \
		MHASH MING MSSQL MYSQL MYSQLI NCURSES \
		ODBC OPENSSL PCNTL PCRE PDF PDO PDO_SQLITE PGSQL POSIX \
		PSPELL READLINE RECODE SESSION SHMOP SIMPLEXML SNMP SOAP \
		SOCKETS SPL SQLITE SYBASE_CT SYSVMSG SYSVSEM SYSVSHM \
		TIDY TOKENIZER WDDX XML XMLREADER XMLRPC XMLWRITER XSL \
		YAZ ZIP ZLIB

SEL_OPTIONS=	yes
.for opt in ${ALL_OPTIONS}
.	if defined(WITH_${opt}) && !defined(WITHOUT_${opt})
SEL_OPTIONS+=	${opt:L}
.	endif
.endfor
USE_PHP=	${SEL_OPTIONS}

do-install: build
	@${DO_NADA}

.include <bsd.port.mk>
