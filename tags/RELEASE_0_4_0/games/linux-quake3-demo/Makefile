# $MidnightBSD: mports/games/linux-quake3-demo/Makefile,v 1.1 2008/05/01 07:31:12 laffer1 Exp $

PORTNAME=	quake3
DISTVERSION=	1.11-6
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=	distfiles
PKGNAMEPREFIX=	linux-
PKGNAMESUFFIX=	-demo
DISTNAME=	linuxq3ademo-${DISTVERSION}.x86
EXTRACT_SUFX=	.gz.sh

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quake III Arena Demo
LICENSE=	restricted

USE_LINUX=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

DATADIR=	${PREFIX}/share/${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}

SUB_FILES=	q3demo

do-extract:
	@${MKDIR} ${WRKDIR}
	@cd ${WRKDIR} && ${TAIL} +165 ${_DISTDIR}/${DISTNAME}${EXTRACT_SUFX} | \
		${TAR} zxf -

do-install:
	@${INSTALL_SCRIPT} ${WRKDIR}/q3demo ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	@${INSTALL_PROGRAM} ${WRKSRC}/bin/x86/glibc-2.0/q3demo ${DATADIR}
	@${CP} -R ${WRKSRC}/demoq3 ${DATADIR}
	@${LN} -s ${GL_LIB} ${DATADIR}/libGL.so
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	@${CP} -R ${WRKSRC}/Help/* ${DOCSDIR}
.endif

.include <bsd.port.pre.mk>

.ifdef(WITH_NVIDIA_GL)
GL_LIB=		${LINUXBASE}/usr/lib/libGL.so.1
GL_PORT=	x11/nvidia-driver
.else
GL_LIB=		${LINUXBASE}/usr/X11R6/lib/libGL.so.1
GL_PORT=	graphics/linux_dri
.endif

RUN_DEPENDS+=	${GL_LIB}:${PORTSDIR}/${GL_PORT}

.include <bsd.port.post.mk>
