# New ports collection makefile for:	websvn
# Date created:				11 May 2004
# Whom:					Yuan-Chung Hsiao (ychsiao@ychsiao.idv.tw)
#
# $MidnightBSD$
# $FreeBSD: ports/devel/websvn/Makefile,v 1.11 2007/09/05 08:24:14 mm Exp $
#

PORTNAME=	websvn
PORTVERSION=	2.0
CATEGORIES=	devel www
MASTER_SITES=	http://websvn.tigris.org/files/documents/1380/39378/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Subversion repository web frontend
LICENSE=	gpl2

USE_PHP=	iconv pcre xml
NO_BUILD=	yes

WEBSVNDIR?=	www/data/websvn
PLIST=		${WRKDIR}/pkg-plist

SUB_FILES=	pkg-message
SUB_LIST+=	WEBSVNDIR="${WEBSVNDIR}"

pre-install:
	@cd ${WRKSRC} && ${RMDIR} temp www
	@cd ${WRKSRC} && ${FIND} -s * -type f | \
		${SED} -e 's|^|${WEBSVNDIR}/|' > ${PLIST} \
		&& ${FIND} -d * -type d | \
		${SED} -e 's|^|@dirrm ${WEBSVNDIR}/|' >> ${PLIST} \
		&& ${ECHO_CMD} @dirrm ${WEBSVNDIR} >> ${PLIST} \
		&& ${ECHO_CMD} @dirrmtry www/data >> ${PLIST}

do-install:
	${MKDIR} ${PREFIX}/${WEBSVNDIR}
	${CP} -R ${WRKSRC}/* ${PREFIX}/${WEBSVNDIR}
	${CHOWN} -R www:www ${PREFIX}/${WEBSVNDIR}
	${FIND} ${PREFIX}/${WEBSVNDIR} -type f | ${XARGS} ${CHMOD} 644

.include <bsd.port.mk>
