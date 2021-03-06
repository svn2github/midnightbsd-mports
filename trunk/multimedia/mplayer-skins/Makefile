# New ports collection makefile for:	mplayer gui skins
# Date created:				Sat Jan 12 10:59:45 BRST 2002
# Whom:			Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/mplayer-skins/Makefile,v 1.44 2007/01/30 01:42:14 rafan Exp $
#

PORTNAME=	mplayer-skins
PORTVERSION=	1.1.3
PORTREVISION=	0
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_MPLAYERHQ}
MASTER_SITE_SUBDIR=	skins
DISTFILES=	# filled in later after options
DIST_SUBDIR=	mplayer-skins

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Skins for MPlayer's Graphical User Interface (GUI)

LICENSE=	unknown

#
# When adding a new skin, please make sure to add it into the following
# Makefiles:
# - Makefile.skins
# - Makefile.options
#
# Then do "make config", select "All Skins" and run "make makesum".
#

USES=		tar:bzip2
NO_WRKSUBDIR=	yes
NO_BUILD=	yes

.include "${.CURDIR}/Makefile.options"

.include <bsd.mport.options.mk>
.include <bsd.port.pre.mk>

.include "${.CURDIR}/Makefile.skins"

myDATADIR=	share/${PORTNAME:S/-skins//}/skins
# Used by other ports to detect if this is installed
DETECTION_FILE=	${LOCALBASE}/${myDATADIR}/${PKGNAME}

PLIST_SUB+=	PKGNAME="${PKGNAME}"

post-extract:
	@${FIND} ${WRKSRC} -type d \( -name '.svn' \) -delete

pre-build:
.if ${PORT_OPTIONS:MALL}
PORT_OPTIONS+=	${ALLSKINS}
.endif

post-build-script:
.for f in ${ALLSKINS}
.if $(PORT_OPTIONS:M${f})
PLIST_SUB+=	${f}="" WITHOUT_SKIN_${f}="@comment "
DISTFILES+=	${${f}_FILE}${EXTRACT_SUFX}
.else
PLIST_SUB+=	${f}="@comment " WITHOUT_SKIN_${f}=""
.endif
.endfor

do-install:
# both anotate and create target directories
	@for dir in `cd ${WRKDIR} && ${FIND} . -type d ! -name ".*" | ${SORT} -r` ; do \
		${MKDIR} "${PREFIX}/${myDATADIR}/$${dir#./}" ; \
		LAST_DIR="$${dir#./}"; \
	done && \
	${LN} -sfh "${PREFIX}/${myDATADIR}/$${LAST_DIR#./}" "${PREFIX}/${myDATADIR}/default"
.ifdef(WITH_SKIN_DEFAULT)
	@${LN} -sfh "${PREFIX}/${myDATADIR}/Blue" "${PREFIX}/${myDATADIR}/default"
.endif
# both anotate installed and install files
	@for f in `cd ${WRKDIR} && ${FIND} . -type f ! -name ".*" | ${SORT}` ; do \
		${INSTALL_DATA} "${WRKDIR}/$${f#./}" ${PREFIX}/${myDATADIR}/$${f#./} ; \
	done
# add marker file
	@${TOUCH} ${PREFIX}/${myDATADIR}/${PKGNAME}

.include <bsd.port.post.mk>
