# $MidnightBSD$

PORTNAME=	demos
PORTVERSION=	${MESAVERSION}
CATEGORIES=	graphics
PKGNAMEPREFIX=	mesa-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL demos distributed with Mesa
LICENSE=	agg

USE_GL=		glu glut
USE_XORG=	glproto x11 xext xxf86vm xdamage xfixes dri2proto

DATADIR=	${PREFIX}/share/${PKGNAMEPREFIX}${PORTNAME}

do-install:
	@for i in demos xdemos; do \
		cd ${WRKSRC}/progs/$$i; \
		for j in `${MAKE} -V PROGS`; do \
			echo ${INSTALL_PROGRAM} $$j ${PREFIX}/bin; \
			${INSTALL_PROGRAM} $$j ${PREFIX}/bin; \
		done; \
	done
	${MKDIR} ${DATADIR}/images ${DATADIR}/data
	@cd ${WRKSRC}/progs/images; \
		for i in `ls *.rgb*`; do \
			echo ${INSTALL_DATA} $$i ${DATADIR}/images; \
			${INSTALL_DATA} $$i ${DATADIR}/images; \
		done
	@cd ${WRKSRC}/progs/demos; \
		for i in `ls *.dat`; do \
			echo ${INSTALL_DATA} $$i ${DATADIR}/data; \
			${INSTALL_DATA} $$i ${DATADIR}/data; \
		done

.include "${.CURDIR}/../../graphics/libGL/bsd.mesalib.mk"
.include <bsd.port.pre.mk>

.if defined(WITH_NVIDIA_GL)
CFLAGS+=	-DWITH_NVIDIA_GL=1
.endif

.include <bsd.port.post.mk>
