# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	databases lang
PKGNAMESUFFIX=	-odbc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal interface to ODBC

USE_FPC=	yes

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

OPTIONS_DEFINE=	ODBC
ODBC_DESC=	Install ODBC library suite for Unix

ODBC_LIB_DEPENDS=	libodbc.so:${PORTSDIR}/databases/unixODBC

.include "${MASTERDIR}/Makefile"
