# New ports collection makefile for:   freetds
# Date created:		02 Nov 1999
# Whom:			Domas Mituzas <midom@dammit.lt>
#
# $MidnightBSD$
# $FreeBSD: ports/databases/freetds/Makefile,v 1.45 2006/05/04 21:39:57 edwin Exp $

PORTNAME=	freetds
PORTVERSION=	0.63
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_SUNSITE}
MASTER_SITE_SUBDIR=	ALPHA/freetds/stable

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Sybase/Microsoft TDS protocol library

TDS_VER?=	5.0

USE_ICONV=	yes
USE_GMAKE=	yes
GNU_GONFIGURE=	yes
USE_AUTOTOOLS=	autoconf:259:env libtool:15
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-tdsver=${TDS_VER}
INSTALLS_SHLIB=	yes

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-0.63
MAN1=		freebcp.1 tsql.1 bsqldb.1 defncopy.1

.if defined(WITH_IODBC)
LIB_DEPENDS+=	iodbc:${PORTSDIR}/databases/libiodbc
CONFIGURE_ARGS+=	--with-iodbc=${LOCALBASE}
.endif

.if defined(WITH_UNIXODBC)
LIB_DEPENDS+=	odbc:${PORTSDIR}/databases/unixODBC
CONFIGURE_ARGS+=	--with-unixodbc=${LOCALBASE}
.endif

.if defined(WITH_IODBC) || defined(WITH_UNIXODBC)
PLIST_SUB+=	ODBC=""
.else
PLIST_SUB+=	ODBC="@comment "
.endif

# We cannot use msdblib-style by default, because port databases/sybtcl
# relies on sybase-style dblib
.if defined(WITH_MSDBLIB)
CONFIGURE_ARGS+=	--enable-msdblib
.endif

post-extract:
	@cd ${WRKSRC} && ${LN} -s freetds.conf freetds.conf.dist
	@cd ${WRKSRC} && ${LN} -s locales.conf locales.conf.dist
	@cd ${WRKSRC}/src/pool && ${LN} -s pool.conf pool.conf.dist

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|<malloc.h>|<stdlib.h>| ; \
		 s|/freetds.conf|/freetds.conf.dist|g ; \
		 s|/locales.conf|/locales.conf.dist|g ; \
		 s|/pool.conf|/pool.conf.dist|g ; \
		 s| common.h||g'
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e "s|\(install-data-am:\).*|\1 install-man|g" \
		${WRKSRC}/doc/Makefile.in
.endif

post-install:
	@${MKDIR} ${PREFIX}/etc/freetds
	@${INSTALL_DATA} ${WRKSRC}/interfaces ${PREFIX}/etc/freetds/interfaces.dist
	@${ECHO_CMD} "Sample configuration files have been installed in ${PREFIX}/etc"
	@${ECHO_CMD} "You should edit them and remove the .dist-suffix from their names"

.include <bsd.port.mk>
