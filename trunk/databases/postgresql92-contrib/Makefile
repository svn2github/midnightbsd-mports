# $MidnightBSD$

PORTNAME=	postgresql
CATEGORIES=	databases
PKGNAMESUFFIX?=	${DISTVERSION:R:S/.//}${COMPONENT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The contrib utilities from the PostgreSQL distribution

LIB_DEPENDS=	libxslt.so:${PORTSDIR}/textproc/libxslt \
		libxml2.so:${PORTSDIR}/textproc/libxml2

USE_PGSQL=	yes
DEFAULT_PGSQL_VER=92
MASTERDIR=	${.CURDIR}/../postgresql${DEFAULT_PGSQL_VER}-server

USES=		bison

BUILD_DIRS=	src/port contrib
INSTALL_DIRS=	contrib

SLAVE_ONLY=	yes
COMPONENT=	-contrib
CONFIGURE_ARGS+=--with-libxslt --with-libxml --with-openssl
LDFLAGS+=	${PTHREAD_LIBS} -L${PREFIX}/lib

OPTIONS_DEFINE=	OSSP_UUID
OSSP_UUID_DESC=	Enable / disable ossp-uuid support
OPTIONS_DEFAULT=	OSSP_UUID

post-install:
	@- ${INSTALL_DATA} ${WRKSRC}/contrib/README ${STAGEDIR}${DOCSDIR}/extension/README

.include "${MASTERDIR}/Makefile"
