# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	devel lang
PKGNAMESUFFIX=	-fcl-registry

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal Component Library

USE_FPC=	fcl-async fcl-base fcl-xml hash paszlib pthreads

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
