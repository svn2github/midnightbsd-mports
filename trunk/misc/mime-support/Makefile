# $MidnightBSD$

PORTNAME=	mime-support
PORTVERSION=	3.56
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_DEBIAN_POOL}
DISTNAME=	${PORTNAME}_${PORTVERSION:C/([0-9]*\.[0-9]*)\.(.*)/\1-\2/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIME Media Types list

LICENSE=        gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:C/\.2$//}

NO_BUILD=	yes
PLIST_FILES=	bin/run-mailcap etc/mime.types \
		man/man1/run-mailcap.1.gz

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/run-mailcap ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/mime.types ${PREFIX}/etc
	${INSTALL_MAN} ${WRKSRC}/run-mailcap.man ${MANPREFIX}/man/man1/run-mailcap.1

.include <bsd.port.mk>
