# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	security lang
PKGNAMESUFFIX=	-hash

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal unit for MD5 hash routines

USE_FPC=	yes

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR+=	${WRKUNITDIR}

NO_STAGE=	yes
.include "${MASTERDIR}/Makefile"
