# New ports collection makefile for:	memcachedb
# Date created:		2007-09-22
# Whom:			Gea-Suan Lin <gslin@gslin.org>
#
# $MidnightBSD$
# $FreeBSD: ports/databases/memcachedb/Makefile,v 1.9 2008/03/29 23:16:04 miwi Exp $
#

PORTNAME=	memcachedb
PORTVERSION=	1.0.3
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE} \
		http://freebsd.csie.nctu.edu.tw/~gslin/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed storage system designed for persistent
LICENSE=	bsd3

LIB_DEPENDS=	event-1.3e:${PORTSDIR}/devel/libevent

CFLAGS=		-I"${BDB_INCLUDE_DIR}"
CONFIUGRE_ARGS=	--enable-threads --with-bdb="${LOCALBASE}" \
		--with-libevent="${LOCALBASE}"
CONFIGURE_ENV=	CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
GNU_CONFIGURE=	yes
LDFLAGS=	-l"${BDB_LIB_NAME}" -L"${LOCALBASE}/lib"
MCDBDIR?=	/var/db/memcachedb
USE_BDB=	46+
USE_RC_SUBR=	${PORTNAME}

post-install:
	${MKDIR} ${MCDBDIR} || ${TRUE}
	${CHOWN} nobody:nobody ${MCDBDIR}

.include <bsd.port.mk>
