# $MidnightBSD: mports/graphics/openjpeg/Makefile,v 1.1 2010/11/06 15:50:36 laffer1 Exp $

PORTNAME=	openjpeg
PORTVERSION=	1.3
CATEGORIES=	graphics
MASTER_SITES=	http://www.openjpeg.org/ \
		http://openjpeg.googlecode.com/files/
DISTNAME=	${PORTNAME}_v${PORTVERSION:S/./_/g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source JPEG 2000 codec
LICENSE=	bsd2

LIB_DEPENDS=	tiff.4:${PORTSDIR}/graphics/tiff

MAKE_JOBS_UNSAFE=	yes

USE_GMAKE=	yes
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/OpenJPEG_v1_3
JPWL_BINS=	JPWL_image_to_j2k JPWL_j2k_to_image
M2J_BINS=	extract_j2k_from_mj2 frames_to_mj2 mj2_to_frames wrap_j2k_in_mj2

PLIST_FILES=	include/openjpeg.h \
		lib/libopenjpeg.a \
		lib/libopenjpeg.so.${SHLIB_VER} \
		lib/libopenjpeg.so \
		${JPWL_BINS:S|^|bin/|} \
		${M2J_BINS:S|^|bin/|}

SHLIB_VER=	2

post-extract:
		${LN} ${WRKSRC}/jp3d/LICENSE.txt ${WRKSRC}/COPYRIGHT

post-patch:	.SILENT
		${FIND} ${WRKSRC} -type f -name Makefile -exec ${REINPLACE_CMD} 's|gcc|$$(CC)|g' {} +

do-install:
		${INSTALL_DATA} ${WRKSRC}/libopenjpeg/openjpeg.h ${PREFIX}/include/
		${INSTALL_DATA} ${WRKSRC}/libopenjpeg.a ${PREFIX}/lib/
		${INSTALL_DATA} ${WRKSRC}/libopenjpeg-2.1.3.0.so \
			${PREFIX}/lib/libopenjpeg.so.${SHLIB_VER}
		cd ${PREFIX}/lib && \
			${LN} -sf libopenjpeg.so.${SHLIB_VER} libopenjpeg.so
.for file in ${M2J_BINS:S|^|mj2/|} ${JPWL_BINS:S|^|jpwl/|}
		${INSTALL_PROGRAM} ${WRKSRC}/${file} ${PREFIX}/bin/
.endfor

.include <bsd.port.mk>
