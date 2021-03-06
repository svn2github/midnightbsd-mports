# $MidnightBSD$
# $FreeBSD: head/databases/freetds/Makefile 369379 2014-09-27 08:31:58Z riggs $

PORTNAME=	freetds
PORTVERSION=	0.91.103
PORTEPOCH=	1
CATEGORIES=	databases
MASTER_SITES=	ftp://ftp.freetds.org/pub/freetds/stable/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sybase/Microsoft TDS protocol library

LICENSE=	gpl2

LIB_DEPENDS=	libgcrypt.so:${PORTSDIR}/security/libgcrypt

TDS_VER?=	5.0

USES=		iconv gmake pkgconfig libtool:keepla
GNU_CONFIGURE=	yes
USES=	autoconf:env
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
LIBS+=		-lgcrypt
CONFIGURE_ARGS=	--with-tdsver=${TDS_VER} --sysconfdir=${ETCDIR} \
	       	--enable-sybase-compat --enable-msdblib
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

PORTDOCS=	*

OPTIONS_DEFINE=		OPENSSL GNUTLS DOCS
OPTIONS_RADIO=		ODBC
OPTIONS_RADIO_ODBC=	IODBC UNIXODBC
OPENSSL_USE=		OPENSSL=yes
OPENSSL_CONFIGURE_ON=	--with-openssl=${OPENSSLBASE}
GNUTLS_LIB_DEPENDS=	libgnutls.so:${PORTSDIR}/security/gnutls
GNUTLS_CONFIGURE_ON=	--with-gnutls
IODBC_LIB_DEPENDS=	libiodbc.so:${PORTSDIR}/databases/libiodbc
IODBC_CONFIGURE_ON=	--with-iodbc=${LOCALBASE}
IODBC_CPPFLAGS=		-I${LOCALBASE}/include/libiodbc
UNIXODBC_LIB_DEPENDS=	libodbc.so:${PORTSDIR}/databases/unixODBC
UNIXODBC_CONFIGURE_ON=	--with-unixodbc=${LOCALBASE}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MIODBC} || ${PORT_OPTIONS:MUNIXODBC}
PLIST_SUB+=	ODBC=""
.else
PLIST_SUB+=	ODBC="@comment "
.endif

post-extract:
	@cd ${WRKSRC} && ${LN} -s freetds.conf freetds.conf.sample
	@cd ${WRKSRC} && ${LN} -s locales.conf locales.conf.sample
	@cd ${WRKSRC}/src/pool && ${LN} -s pool.conf pool.conf.sample

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|<malloc.h>|<stdlib.h>| ; \
		 s|/freetds.conf|/freetds.conf.sample|g ; \
		 s|/locales.conf|/locales.conf.sample|g ; \
		 s|/pool.conf|/pool.conf.sample|g ; \
		 s| common.h||g'
	@${REINPLACE_CMD} -e 's|$$ODBC_INC/isql.h|$$ODBC_INC/libiodbc/isql.h|g ; \
		 s|$$ODBC_INC/isqlext.h|$$ODBC_INC/libiodbc/isqlext.h|g' ${WRKSRC}/configure

post-install:
	@${INSTALL_DATA} ${WRKSRC}/interfaces ${STAGEDIR}${ETCDIR}/interfaces.sample
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	@(cd ${WRKSRC}/doc/doc/${PORTNAME}-${PORTVERSION} && \
		${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})
.endif

.include <bsd.port.mk>
