# Ports collection makefile for:  pear-DB
# Date created:			  28 November 2002
# Whom:				  Thierry Thomas (<thierry@pompo.net>)
#
# $FreeBSD: ports/databases/pear-DB/Makefile,v 1.21 2006/09/23 00:23:22 linimon Exp $
# $MidnightBSD$
#

PORTNAME=	DB
PORTVERSION=	1.7.6
PORTEPOCH=	1
CATEGORIES=	databases www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEAR Database Abstraction Layer

BUILD_DEPENDS=	${PEARDIR}/PEAR.php:${PORTSDIR}/devel/pear
RUN_DEPENDS=	${BUILD_DEPENDS}

FILES=		DB.php DB/common.php DB/dbase.php DB/fbsql.php DB/ibase.php \
		DB/ifx.php DB/msql.php DB/mssql.php DB/mysql.php DB/mysqli.php \
		DB/oci8.php DB/odbc.php DB/pgsql.php DB/sybase.php DB/storage.php \
		DB/sqlite.php
DOCS=		IDEAS MAINTAINERS STATUS TESTERS
TESTS=		db_error.phpt db_parsedsn.phpt db_factory.phpt db_ismanip.phpt \
		db_error2.phpt errors.inc fetchmode_object.inc fetchmodes.inc \
		include.inc limit.inc numcols.inc numrows.inc prepexe.inc \
		run.cvs sequences.inc simplequery.inc transactions.inc \
		skipif.inc driver/01connect.phpt driver/02fetch.phpt \
		driver/03simplequery.phpt driver/04numcols.phpt \
		driver/05sequences.phpt driver/06prepexec.phpt \
		driver/08affectedrows.phpt driver/09numrows.phpt \
		driver/10errormap.phpt driver/11transactions.phpt \
		driver/13limit.phpt driver/14fetchmode_object.phpt \
		driver/15quote.phpt driver/16tableinfo.phpt driver/17query.phpt \
		driver/18get.phpt driver/19getlistof.phpt driver/connect.inc \
		driver/mktable.inc driver/multiconnect.php driver/run.cvs \
		driver/setup.inc.cvs driver/skipif.inc
_DOCSDIR=	doc

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/devel/pear/bsd.pear.mk"

post-patch:
.for file in ${FILES}
	@${REINPLACE_CMD} -e "s|@package_version@|${PORTVERSION}|" ${WRKSRC}/${file}
.endfor
	@${REINPLACE_CMD} -e "s|@include_path@|${PREFIX}/${LPEARDIR}|g" \
		${WRKSRC}/tests/include.inc
	@${REINPLACE_CMD} -e "s|@include_path@|${PREFIX}/${LPEARDIR}|g" \
		${WRKSRC}/tests/driver/setup.inc.cvs

.include <bsd.port.post.mk>
