# New ports collection makefile for:   db-netbsd
# Date created:        1 January 2004
# Whom:                Edwin Groothuis (edwin@mavetju.org)
#
# $MidnightBSD$
# $FreeBSD: ports/databases/db/Makefile,v 1.32 2007/06/25 04:21:58 edwin Exp $
#

PORTNAME=	db
PORTVERSION=	1.14
PORTEPOCH=	1
CATEGORIES=	databases
MASTER_SITES=	http://www.mavetju.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulate db(3)'s btree(3) and hash(3) databases - NetBSD port
LICENSE=	bsd4

MAN1=		db.1
MANCOMPRESSED=	yes
PLIST_FILES=	bin/db

MAKE_ENV=	BINDIR=${PREFIX}/bin SHAREDIR=${PREFIX}

DIST_CVS=	http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/usr.bin/db/db
DB1VERSION=	1.17
MAKEVERSION=	1.2
DIST_DB1=	http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/usr.bin/db/db.1?rev=${DB1VERSION}&content-type=text/plain&only_with_tag=HEAD
DIST_DBC=	http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/usr.bin/db/db.c?rev=${PORTVERSION}&content-type=text/plain
DIST_MAKEFILE=	http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/usr.bin/db/Makefile?rev=${MAKEVERSION}&content-type=text/plain

tarball:
	${MKDIR} ${WRKSRC}
	fetch -o ${WRKSRC}/db.1 "${DIST_DB1}"
	fetch -o ${WRKSRC}/db.c "${DIST_DBC}"
	fetch -o ${WRKSRC}/Makefile "${DIST_MAKEFILE}"
	cd ${WRKDIR} && ${TAR} zcvf ${DISTFILES} ${PORTNAME}-${PORTVERSION}
	${MV} ${WRKDIR}/${DISTFILES} ${DISTDIR}

.include <bsd.port.mk>
