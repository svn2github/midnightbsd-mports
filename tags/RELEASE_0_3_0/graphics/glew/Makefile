# $MidnightBSD$
# $FreeBSD: ports/graphics/glew/Makefile,v 1.26 2010/08/03 11:29:34 mva Exp $

PORTNAME=	glew
PORTVERSION=	1.5.5
CATEGORIES=	graphics
MASTER_SITES=	SF
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The OpenGL Extension Wrangler Library
LICENSE=	bsd3

USE_XORG=	x11 xext xi xmu
USE_GMAKE=	yes
USE_GL=		yes
USE_LDCONFIG=	yes

post-patch:
	${CP} ${WRKSRC}/config/Makefile.freebsd ${WRKSRC}/config/Makefile.midnightbsd

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/glewinfo ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/visualinfo ${PREFIX}/bin

	${INSTALL_PROGRAM} ${WRKSRC}/lib/libGLEW.so.${PORTVERSION} \
		${PREFIX}/lib/libGLEW.so.1
	${LN} -sf ${PREFIX}/lib/libGLEW.so.1 ${PREFIX}/lib/libGLEW.so
	${INSTALL_DATA} ${WRKSRC}/lib/libGLEW.a ${PREFIX}/lib
	${MKDIR} ${PREFIX}/include/GL
	${INSTALL_DATA} ${WRKSRC}/include/GL/*.h ${PREFIX}/include/GL
	${INSTALL_DATA} ${WRKSRC}/glew.pc ${PREFIX}/libdata/pkgconfig

.ifndef (NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in css html jpg png
	${INSTALL_DATA} ${WRKSRC}/doc/*.${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
