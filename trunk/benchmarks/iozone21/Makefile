# $MidnightBSD$

PORTNAME=	iozone
PORTVERSION=	2.01
CATEGORIES=	benchmarks
MASTER_SITES=	ftp://ftp.cs.uni-sb.de/pub/others/
EXTRACT_SUFX=	.shar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance Test of Sequential File I/O (older version)

LICENSE=	other

CONFLICTS=	iozone-3.*

LATEST_LINK=	iozone21
PLIST_FILES=	bin/iozone

EXTRACT_CMD=	( ${GZCAT} | ${AWK} '{if (/^\#!/) x++} {if(x) print $$0'}| ${SH} )
EXTRACT_BEFORE_ARGS=	<
EXTRACT_AFTER_ARGS=	# empty
NO_WRKSUBDIR=	YES
MAN1=		iozone.1

.include <bsd.port.mk>
