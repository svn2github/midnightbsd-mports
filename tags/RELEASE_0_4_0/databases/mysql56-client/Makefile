# $MidnightBSD$

PORTNAME=	mysql
PKGNAMESUFFIX=	-client

COMMENT=	Multithreaded SQL database (client)
LICENSE=	gpl2

MASTERDIR=	${.CURDIR}/../mysql56-server

PKGMESSAGE=	mustnotexist
PATCHDIR=	${.CURDIR}/files
PLIST=		${.CURDIR}/pkg-plist

LATEST_LINK=	mysql56-client

CONFLICTS_INSTALL=	mysql-client-[34].* mysql-client-5.[0-57-9].* mariadb-client-5.* percona-client-5.*

CMAKE_ARGS+=     -DWITHOUT_SERVER=1 -DENABLE_DTRACE:BOOL=OFF

USE_LDCONFIG=	${PREFIX}/lib/mysql

MAN1=		comp_err.1 msql2mysql.1 mysql.1 mysql_config.1 mysql_config_editor.1 mysql_find_rows.1 \
		mysql_waitpid.1 mysqlaccess.1 mysqladmin.1 mysqlbinlog.1 \
		mysqlcheck.1 mysqldump.1 mysqlimport.1 mysqlshow.1 mysqlslap.1

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
