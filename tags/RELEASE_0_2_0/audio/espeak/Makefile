# New ports collection makefile for:	espeak
# Date created:		2006-03-25
# Whom:			Nicola Vitale	<nivit@email.it>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/espeak/Makefile,v 1.15 2007/08/06 13:33:16 nivit Exp $
#

PORTNAME=	espeak
PORTVERSION=	1.28
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	${PORTNAME}-${PORTVERSION}-source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A software speech synthesizer
LICENSE=	gpl3

LIB_DEPENDS=	portaudio:${PORTSDIR}/audio/portaudio

CONFLICTS=	speak-1.[0-9]

MAKE_ENV+=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}" CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}" CXX="${CXX}"

PLIST_SUB+=	ESPEAK_LIBRARY=${ESPEAK_LIBRARY}

USE_GETOPT_LONG=yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_ZIP=	yes

WRKSRC=	${WRKDIR}/${DISTNAME}
BUILD_WRKSRC=	${WRKSRC}/src
INSTALL_WRKSRC=	${WRKSRC}/src
ESPEAK_LIBRARY=	lib${PORTNAME}.so.1.${PORTVERSION}
FIND_DIRS=	espeak-data
FIND_DOCS=	docs

LN_OPTS=	-sf

REINPLACE_FILES=	${BUILD_WRKSRC}/Makefile  ${BUILD_WRKSRC}/speech.h
REINPLACE_ARGS=	-i.bak -e "s|%%LOCALBASE%%|${LOCALBASE}|g" \
		-e "s|%%DATADIR%%|${DATADIR}|g" \
		-e "s|%%PREFIX%%|${PREFIX}|g"

post-patch:
	@${REINPLACE_CMD} ${REINPLACE_FILES}

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/${FIND_DOCS} && ${FIND} . -type d -exec ${MKDIR} \
		${DOCSDIR}/{} \;
	cd ${WRKSRC}/${FIND_DOCS} && ${FIND} . -type f \
		-exec ${INSTALL_DATA} {} ${DOCSDIR}/{} \;
.endif

.include <bsd.port.mk>
