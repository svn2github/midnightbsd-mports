# $MidnightBSD$
# $FreeBSD: ports/databases/mysql55-client/Makefile,v 1.104 2010/12/28 06:49:38 ale Exp $

PORTNAME=	mysql
PKGNAMESUFFIX=	-client

COMMENT=	Multithreaded SQL database (client)

MASTERDIR=	${.CURDIR}/../mysql55-server

PKGMESSAGE=	mustnotexist
PATCHDIR=	${.CURDIR}/files
PLIST=		${.CURDIR}/pkg-plist

LATEST_LINK=	mysql55-client

CONFLICTS=	mysql-client-[4].* mysql-client-5.[0-46-9].*

CMAKE_ARGS=	-DWITHOUT_SERVER=1

USE_LDCONFIG=	yes

MAN1=		comp_err.1 msql2mysql.1 mysql.1 mysql_config.1 mysql_find_rows.1 \
		mysql_waitpid.1 mysqlaccess.1 mysqladmin.1 mysqlbinlog.1 \
		mysqlcheck.1 mysqldump.1 mysqlimport.1 mysqlshow.1 mysqlslap.1

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
